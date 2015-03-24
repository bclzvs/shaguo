// File:    ADUserGroup.cs
// Author:  liuzhiwen
// Created: 2011年6月30日 16:59:50
// Purpose: Definition of Class ADUserGroup

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services.Protocols;
using cslc.Athena.ADServiceAccessor.ADService;

namespace cslc.Athena.ADUtility
{
    /// <summary>
    /// AD中的用户组
    /// </summary>
    public class ADUserGroup
    {
        private String _name;
        private GroupDistinguishedName _distinguishedName;
        private GroupDistinguishedName _originalDistinguishedName;
        private string _description;
        public String DistinctName { get; private set; }

        internal ADUserGroup(ADGroup group)
        {
            CloneFromService(group);
        }

        private void CloneFromService(ADGroup group)
        {
            Name = group.Name;
            DistinctName = group.SAMAccountName;
            DistinguishedName = new GroupDistinguishedName(ADPath.Parse(group.DistinguishedName));
            _description = group.Description;
        }

        public ADUserGroup(GroupDistinguishedName groupDistinguishedName)
        {
            _name = groupDistinguishedName.GroupName;
            DistinguishedName = groupDistinguishedName;
        }

        public ADUserGroup(ADPath path)
            : this(new GroupDistinguishedName(path))
        {
        }

        public string Name
        {
            get { return _name; }
            private set { _name = value; }
        }

        private ADOrganizaitonUnit _organization;
        public ADOrganizaitonUnit Organization
        {
            get
            {
                if (_organization == null)
                {
                    _organization = ADOrganizaitonUnit.Load(_distinguishedName.OU);
                }

                return _organization;
            }
        }

        public GroupDistinguishedName DistinguishedName
        {
            get { return _distinguishedName; }
            private set { _distinguishedName = value; }
        }

        public String DistinguishedNameValue
        {
            get { return DistinguishedName.Value; }
        }

        /// <summary>
        /// 在移动到另一个OU之前的DistinguishedName
        /// </summary>
        public GroupDistinguishedName OriginalDistinguishedName
        {
            get { return _originalDistinguishedName; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        private List<ADUser> _users;
        private string _newName;

        public IEnumerable<ADUser> Users
        {
            get
            {
                if (_users == null)
                {
                    LoadUsers();
                }

                return _users;
            }
        }

        public void LoadUsers()
        {
            _users = new List<ADUser>();

            var userNames = GetRepository().GetUsersByGroupName(Name, 1);
            if (userNames == null) return;
            foreach (var userName in userNames)
            {
                _users.Add(ADUser.LoadByLoginName(userName));
            }

        }

        private static IActiveDirectoryRepository GetRepository()
        {
            return ActiveDirectoryRepositoryFacatoryManager.Facatory.Instance();
        }

        public void MoveToParentOU()
        {
            MoveTo(DistinguishedName.OU.Parent);
        }

        public void MoveTo(OUDistinguishedName tagetOU)
        {
            try
            {
                GetRepository().MoveTo(DistinguishedName.Value, tagetOU.Value);
                _originalDistinguishedName = _distinguishedName;
                DistinguishedName = new GroupDistinguishedName(tagetOU, _name);
                Reload();
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "移动组[{0}]到组[{1}]的时候发生错误", DistinguishedName,
                                                  tagetOU);
            }
        }

        private void Reload()
        {
            CloneFromService(LoadADGroup(DistinguishedName));
        }

        public void AddUser(ADUser user)
        {
            if (_users == null) _users = new List<ADUser>(0);
            if (_users.FirstOrDefault(item => item.LoginName == user.LoginName) != null) return;
            _users.Add(user);
        }

        public void RemoveUser(String loginName)
        {
            if (_users == null) _users = new List<ADUser>(Users);
            _users.RemoveAll(user => user.LoginName.Equals(loginName, StringComparison.OrdinalIgnoreCase));
        }

        public void Save()
        {
            try
            {
                var names = from adUser in Users
                            select adUser.DistinguishedName.Value;

                GetRepository().CreateADGroup(_distinguishedName.OU.Value, Name, Name, Description, String.Join(";", names.ToArray()));
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "[{0}]组创建失败", DistinguishedName);
            }
        }

        public static ADUserGroup Load(GroupDistinguishedName distinguishedName)
        {
            ADGroup groupFromService = LoadADGroup(distinguishedName);
            if (groupFromService == null) return null;
            return new ADUserGroup(groupFromService);
        }

        public static ADUserGroup Load(ADPath path)
        {
            return Load(new GroupDistinguishedName(path));
        }

        private static ADGroup LoadADGroup(GroupDistinguishedName distinguishedName)
        {
            try
            {

                return GetRepository().GetGroupByDistinguishedName(distinguishedName.Value);

            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "加载组[{1}]时失败", distinguishedName);
            }
        }

        public static ADUserGroup LoadByName(String name)
        {
            if (String.IsNullOrEmpty(name)) throw new ArgumentNullException("name");
            try
            {
                ADGroup group = GetRepository().GetGroupByAmmountName(name);
                if (group == null) return null;
                return new ADUserGroup(group);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "[{0}]组加载失败", name);
            }
        }

        public Int32 Delete()
        {
            try
            {
                return GetRepository().Delete(DistinguishedName.Value);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "[{0}]组删除失败", DistinguishedName);
            }
        }

        public void Update()
        {
            var names = from adUser in Users
                        select adUser.DistinguishedName.Value;
            try
            {
                if (String.IsNullOrEmpty(NewName)) NewName = Name;
                GetRepository().UpdateGroupAndAmmountName(Name, NewName, NewName, Description, NewName, names.ToArray());

                DistinguishedName = new GroupDistinguishedName(DistinguishedName.OU, NewName);
                Reload();
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "[{0}]组保存失败:{1}", DistinguishedName, String.Join(" ", names.ToArray()));
            }
        }

        public string NewName
        {
            get
            {
                return _newName;
            }
            set
            {
                _newName = value;
            }
        }

        public void ClearUsers()
        {
            if (_users == null) _users = new List<ADUser>();
            _users.Clear();
        }

        public string[] GetSubUserDistinctNames()
        {
            return GetRepository().GetSubUserDistinctNames(DistinguishedName.Value);
        }
    }
}