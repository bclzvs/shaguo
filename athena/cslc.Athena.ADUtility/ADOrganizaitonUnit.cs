// File:    ADOrganizaitonUnit.cs
// Author:  liuzhiwen
// Created: 2011年6月30日 16:20:53
// Purpose: Definition of Class ADOrganizaitonUnit

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services.Protocols;
using cslc.Athena.ADServiceAccessor;
using cslc.Athena.ADServiceAccessor.ADService;

namespace cslc.Athena.ADUtility
{
    /// AD系统中的组织
    public class ADOrganizaitonUnit
    {
        #region Variables

        private List<ADOrganizaitonUnit> _childs;
        private List<ADUserGroup> _groups;
        private Guid _guid;
        private ADOrganizaitonUnit _parent;
        private List<ADUser> _users;

        #endregion

        private IActiveDirectoryRepository _ADOrganizaitonUnitRepository;

        private IActiveDirectoryRepository Repository
        {
            get
            {
                if (_ADOrganizaitonUnitRepository == null)
                    _ADOrganizaitonUnitRepository = ActiveDirectoryRepositoryFacatoryManager.Facatory.Instance();
                return _ADOrganizaitonUnitRepository;
            }
        }

        #region Properties

        /// <summary>
        /// 父OU，为空代表顶级OU
        /// </summary>
        public ADOrganizaitonUnit Parent
        {
            get
            {
                if (_parent == null)
                {
                    if (DistinguishedName.Parent != null)
                    {
                        ADOrganizaitonUnit parent = Load(DistinguishedName.Parent);
                        if (parent == null)
                            throw new PathNotFoundException(String.Format("未找着父:{0}", DistinguishedName.Parent));
                        Parent = parent;
                    }
                }
                return _parent;
            }
            set { _parent = value; }
        }

        /// <summary>
        ///  是否是省组织
        /// </summary>
        public bool IsProvince
        {
            get { return DistinguishedName.Value.Equals(ProvinceDistinguishedName,StringComparison.OrdinalIgnoreCase); }
        }

        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        protected string Description { get; set; }

        public OUDistinguishedName DistinguishedName { get; private set; }

        public IEnumerable<ADOrganizaitonUnit> Childs
        {
            get
            {
                if (_childs == null)
                {
                    ReloadChilds();
                }
                return _childs;
            }
        }

        public IEnumerable<ADUser> Users
        {
            get
            {
                if (_users == null)
                {
                    ReloadUsers();
                }
                return _users;
            }
        }


        public IEnumerable<ADUserGroup> Groups
        {
            get
            {
                if (_groups == null)
                {
                    ReloadUserGroup();
                }
                return _groups;
            }
        }

        public string ProvinceDistinguishedName { get; private set; }

        public bool IsRoot
        {
            get { return DistinguishedName.IsRootOU; }
        }

        public Guid GUID
        {
            get { return _guid; }
        }

        public string NewName { get; set; }

        public void ReloadUserGroup()
        {
            IEnumerable<ADGroup> groups = Repository.GetSubGroups(DistinguishedName.Value);
            _groups = new List<ADUserGroup>(groups.Count());

            foreach (ADGroup adGroup in groups)
            {
                _groups.Add(new ADUserGroup(adGroup));
            }
        }

        #endregion

        #region Constructors

        //internal ADOrganizaitonUnit(string name)
        //{
        //    Name = name;
        //}

        public ADOrganizaitonUnit(ADPath path)
            : this(new OUDistinguishedName(path))
        {
        }

        public ADOrganizaitonUnit(OUDistinguishedName distinguishedName)
        {
            Name = distinguishedName.Name;
            DistinguishedName = distinguishedName;
        }

        internal ADOrganizaitonUnit(ADObject adObject)
        {
            CloneFromAdObject(adObject);
        }

        private void CloneFromAdObject(ADObject adObject)
        {
            Name = adObject.Name;
            Description = adObject.Description;
            DistinguishedName = new OUDistinguishedName(ADPath.Parse(adObject.DistinguishedName));
            ProvinceDistinguishedName = adObject.ProvinceOUDistinguishedName;
            _guid = new Guid(adObject.ObjectGUID);
        }

        #endregion

        #region New

        public ADOrganizaitonUnit NewSubOU(String name)
        {
            return new ADOrganizaitonUnit(new OUDistinguishedName(DistinguishedName, name));
        }

        public ADUserGroup NewUserGroup(String groupName)
        {
            return new ADUserGroup(new GroupDistinguishedName(DistinguishedName, groupName));
        }

        public ADUser NewUser(String loginName)
        {
            return new ADUser(ADPath.Parse(DistinguishedName.Value), loginName, loginName);
        }

        public ADUser NewUser(String loginName, String displayName)
        {
            return new ADUser(ADPath.Parse(DistinguishedName.Value), loginName, displayName);
        }

        public ADUser NewUser(String loginName, UserName userName)
        {
            return new ADUser(ADPath.Parse(DistinguishedName.Value), loginName, userName);
        }

        #endregion

        public void Save()
        {
            try
            {
                ADObject adObject = Repository.CreateOUAndReturn(DistinguishedName.Parent.Value, Name, Description);
                CloneFromAdObject(adObject);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(DistinguishedName.Value, ADOperation.CreateOU, ex);
            }
        }

        public void Update()
        {
            try
            {
                Repository.UpdateOU(DistinguishedName.Value, Name, NewName, Description);
                //重新从AD中加载对象
                var newDN = new OUDistinguishedName(DistinguishedName.Parent, NewName);
                ADObject adObject = Repository.GetOUByDistinguishedName(newDN.Value);
                CloneFromAdObject(adObject);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(DistinguishedName.Value, ADOperation.ModifyOU, ex);
            }
        }

        /// <summary>
        /// 删除当前的OU，如果此OU有子OU的话，则不允许删除
        /// 如果此OU有Group存在，则将Group移动到此OU的父OU
        /// 如果此OU有User存在，则将User移动到此OU的父OU
        /// </summary>
        public Int32 Delete()
        {
            ReloadChilds();
            if (HasChilds()) throw new InvalidOperationException("不能删除带有子OU的父OU");
            ReloadUserGroup();
            Groups.ToList().ForEach(group => group.MoveToParentOU());
            ReloadUsers();
            Users.ToList().ForEach(user => user.MoveToParentOU());

            try
            {
                return Repository.Delete(DistinguishedName.Value);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(DistinguishedName.Value, ADOperation.DeleteOU, ex);
            }
        }

        private bool HasChilds()
        {
            return Childs != null && Childs.Count() > 0;
        }

        ///// <summary>
        ///// 选择一个管理员
        ///// </summary>
        ///// <param name="p"></param>
        //public void SetlectAdministrator(string p)
        //{
        //    throw new NotImplementedException();
        //}

        /// <summary>
        /// 重新加载子OU
        /// </summary>
        public void ReloadChilds()
        {
            try
            {
                IEnumerable<ADObject> adObjects = Repository.GetSubOUs(DistinguishedName.Value);
                _childs = new List<ADOrganizaitonUnit>(adObjects.Count());

                foreach (ADObject adObject in adObjects)
                {
                    if (adObject.Name == "Domain Controllers" || adObject.Name == "Microsoft Exchange Security Groups")
                        continue;
                    _childs.Add(new ADOrganizaitonUnit(adObject));
                }
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "加载[{0}]的SubOU时出错", DistinguishedName);
            }
        }

        public void ReloadUsers()
        {
            IEnumerable<ADServiceAccessor.ADService.ADUser> users = Repository.GetSubUsers(DistinguishedName.Value);
            _users = new List<ADUser>(users.Count());

            foreach (ADServiceAccessor.ADService.ADUser adUser in users)
            {
                _users.Add(new ADUser(adUser));
            }
        }

        public void MoveTo(ADOrganizaitonUnit targetOrganizaitonUnit)
        {
            Repository.MoveTo(DistinguishedName.Value, targetOrganizaitonUnit.DistinguishedName.Value);


            //重新从AD中加载对象
            var newDN = new OUDistinguishedName(targetOrganizaitonUnit.DistinguishedName, Name);
            ADObject adObject = Repository.GetOUByDistinguishedName(newDN.Value);
            if (adObject == null) throw ADUtilityException.Instance(newDN.Value, ADOperation.LoadOU);
            CloneFromAdObject(adObject);
        }


        /// <summary>
        /// 是否有某个子名称的子对象
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public Boolean HasSubName(String name)
        {
            if (String.IsNullOrEmpty(name)) throw new ArgumentNullException("name");

            return Repository.NameExistsInOU(DistinguishedName.Value, name);
        }

        #region Staticmethods

        /// <summary>
        /// 按给定的路径加载OU
        /// </summary>
        /// <param name="path">依靠文件路径的AD路径<see cref="ADPath"/></param>
        /// <example>
        /// ADOrganizaitonUnit.Load("\\北京市\\西城区");//加载北京市下的西城区
        /// ADOrganizaitonUnit.Load("\\"); //加载根
        /// </example>
        /// <returns></returns>
        public static ADOrganizaitonUnit Load(ADPath path)
        {
            return Load(new OUDistinguishedName(path));
        }

        public static ADOrganizaitonUnit Load(OUDistinguishedName distinguishedName)
        {
            try
            {
                ADObject adObject =
                    ActiveDirectoryRepositoryFacatoryManager.Facatory.Instance().GetOUByDistinguishedName(
                        distinguishedName.Value);
                if (adObject == null) return null;
                return new ADOrganizaitonUnit(adObject);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "[{0}]加载失败", distinguishedName);
            }
        }

        #endregion

        public IEnumerable<ADUserGroup> GetGroupsIncludeSub()
        {
            foreach (var adUserGroup in Groups)
            {
                yield return adUserGroup;
            }

            foreach (var childOU in Childs)
            {
                foreach (var adUserGroup in childOU.Groups)
                {
                    yield return adUserGroup;
                }

                foreach (var subSubOU in childOU.Childs)
                {
                    foreach (var adUserGroup in subSubOU.Groups)
                    {
                        yield return adUserGroup;
                    }
                }
            }
        }

        public IEnumerable<GroupDistinguishedName> GetAllGroupDistinguishedNames()
        {
            IEnumerable<String> groupDNs = ActiveDirectoryRepositoryFacatoryManager.Facatory.Instance().GetAllGroupDNsForOU(DistinguishedName.Value);


            foreach (var groupDN in groupDNs)
            {
                yield return GroupDistinguishedName.From(groupDN);
            }
        }

        public IEnumerable<GroupDistinguishedName> GetGroupDistinguishedNames()
        {
            IEnumerable<String> groupDNs = ActiveDirectoryRepositoryFacatoryManager.Facatory.Instance().GetGroupDNsForOU(DistinguishedName.Value);


            foreach (var groupDN in groupDNs)
            {
                yield return GroupDistinguishedName.From(groupDN);
            }
        }

        public String[] AllSubOUDNsIncludeSelf()
        {
            return Repository.GetAllSubOuDistinguishedNames(DistinguishedName.Value);
        }
    }
}