/*******************************************************************************
 * @ 版权所有(C) 中体彩科技发展有限公司 2011
 * @ 文件名称  : ADUser.cs
 * @ 当前版本  : 1.0.0.1
 * @ 作    者  : 刘志文 (zwliua@isoftstone.com)
 * @ 设计日期  : 2011年7月12日
 * @ 内容摘要  : 
 * @ 修改记录  : 
 * @ 日    期      版    本      修改人        修改摘要
 * 
 * ********************************************************************************/
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Services.Protocols;
using cslc.Athena.ADServiceAccessor;
using cslc.Athena.ADServiceAccessor.ADService;
using cslc.Athena.Framework;

namespace cslc.Athena.ADUtility
{
    /// <summary>
    /// AD中的用户
    /// </summary>
    [Serializable]
    public class ADUser
    {
        #region Fields
        private UserName _userName;
        private String _loginName;
        private UserDistinguishedName _distinguishedName;
        #region pwd and useraccount
        //This attribute specifies the date and time that the password for this account was last changed. 
        //This value is stored as a large integer that represents the number of 100 nanosecond intervals since January 1, 1601 (UTC). 
        //If this value is set to 0 and the User-Account-Control attribute does not contain the UF_DONT_EXPIRE_PASSWD flag, 
        //the user must set the password at the next logon 
        //see:http://msdn.microsoft.com/en-us/library/ms679430(v=vs.85).aspx
        //ADService中会加入UF_DONT_EXPIRE_PASSWD,所以这个赋值为0，以使密码永不过期
        private static readonly long _pwdLastSet = 0;

        //Flags that control the behavior of the user account.
        //see:http://msdn.microsoft.com/en-us/library/aa772300(v=vs.85).aspx
        //544代表：ADS_UF_PASSWD_NOTREQD | ADS_UF_NORMAL_ACCOUNT
        //此值将和ADS_UF_DONT_EXPIRE_PASSWD进行或运算
        private static readonly ADS_USER_FLAG_ENUMs _userAccountControl = ADS_USER_FLAG_ENUMs.ADS_UF_PASSWD_NOTREQD | ADS_USER_FLAG_ENUMs.ADS_UF_NORMAL_ACCOUNT;
        #endregion

        private ADTelephone _telephone = new ADTelephone();
        private Address _address = new Address();
        private ADMail _mail = new ADMail();
        private ADJob _job = new ADJob();

        private UserDistinguishedName _originalDistinguishedName;

        private List<String> _userGroups;
        public static readonly int LoginNameMaxLength = 20;
        private static readonly string GenderAttrubteName = "wWWHomePage";
        #endregion

        #region Constructors
        /// <summary>
        /// 
        /// </summary>
        /// <param name="userName">用户姓名</param>
        /// <param name="loginName">登陆名 <see cref="LoginName"/></param>
        public ADUser(ADPath ouPath, String loginName, UserName userName)
            : this(ouPath, loginName, userName.Value)
        {
            UserName = userName;
            //_parentDistinguishedName = ouPath.GetDistinguishedName();
        }

        public ADUser(ADPath ouPath, String loginName, String displayName)
            : this(new ADPath(ouPath.Path + "\\" + displayName), loginName)
        {
            DisplayName = displayName;
            //_parentDistinguishedName = ouPath.GetDistinguishedName();
        }

        private ADUser(ADPath path, String loginName)
        {
            _distinguishedName = new UserDistinguishedName(path);
            LoginName = loginName;
        }

        internal ADUser(ADServiceAccessor.ADService.ADUser adUser)
        {
            CloneFromService(adUser);
        }

        private void CloneFromService(ADServiceAccessor.ADService.ADUser adUser)
        {
            UserName = new UserName(adUser.Sn, adUser.GivenName);
            LoginName = adUser.SAMAccountName;
            DistinguishedName = new UserDistinguishedName(ADPath.Parse(adUser.DistinguishedName));
            Description = adUser.Description;
            DisplayName = adUser.DisplayName;
            Email = adUser.Mail;
            Gender = String.IsNullOrEmpty(adUser.Gender) ? Gender.Unkown : EnumHelper.Parse<Gender>(adUser.Gender);

            _telephone.FacsimileTelephoneNumber = adUser.FacsimileTelephoneNumber;
            _telephone.HomePhone = adUser.HomePhone;
            _telephone.IPPhone = adUser.IpPhone;
            _telephone.Mobile = adUser.Mobile;

            _address.Co = adUser.Co;
            _address.L = adUser.L;
            _address.PostalCode = adUser.PostalCode;
            _address.PostOfficeBox = adUser.PostalCode;
            _address.St = adUser.St;
            _address.StreetAddress = adUser.StreetAddress;

            _job = ADJob.Parse(adUser.Title);
        }
        #endregion

        #region Properties
        /// <summary>
        /// 用户登录名
        /// </summary>
        /// <remarks>登录名在整个AD中只能有一个，包括Group，但可以和OU重名</remarks>
        public string LoginName
        {
            get { return _loginName; }
            private set
            {
                if (value.Length > LoginNameMaxLength) throw new ArgumentException(String.Format("[{0}]长度超出了20", value));
                _loginName = value;
            }
        }

        private String _newLoginName;
        public String NewLoginName
        {
            get { return _newLoginName; }
            set
            {
                if (value.Length > LoginNameMaxLength) throw new ArgumentException("不能超过20位字符");
                _newLoginName = value;
            }
        }

        /// <summary>
        /// 用户姓名
        /// </summary>
        /// <remarks>
        /// 只在某个OU下是唯一的，在不同的OU下，可以有重复的姓名
        /// </remarks>
        public UserName UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }
        ///// <summary>
        ///// 职务
        ///// </summary>
        //public string JobTitle { get; set; }


        public ADJob Job
        {
            get { return _job; }
            set { _job = value; }
        }

        public ADTelephone Telephone
        {
            get { return _telephone; }
        }

        public Address Address
        {
            get { return _address; }
        }

        public ADMail Mail
        {
            get { return _mail; }
        }

        public string Description { get; set; }

        protected string Password { get; set; }

        public string DisplayName { get; set; }

        public UserDistinguishedName DistinguishedName
        {
            get { return _distinguishedName; }
            private set { _distinguishedName = value; }
        }

        /// <summary>
        /// 被移动前的DistinguishedName
        /// </summary>
        public UserDistinguishedName OriginalDistinguishedName
        {
            get { return _originalDistinguishedName; }
        }

        private ADPath _adPath;
        public ADPath ADPath
        {
            get
            {
                if (_adPath == null)
                {
                    _adPath = ADUtility.ADPath.Parse(DistinguishedName.Value);
                }
                return _adPath;
            }

        }

        private ADPath _ouPath;
        public ADPath OUPath
        {
            get
            {
                if (_ouPath == null)
                {
                    _ouPath = ADUtility.ADPath.Parse(DistinguishedName.OU.Value);
                }
                return _ouPath;
            }
        }

        private String _primaryGroup = null;
        public String PrimaryGroup
        {
            get
            {
                if (_primaryGroup == null)
                {
                    _primaryGroup = Repository().GetPrimaryGroup(LoginName);
                    if (_primaryGroup == null) _primaryGroup = "";
                }
                return _primaryGroup;
            }
        }

        private static IActiveDirectoryRepository Repository()
        {
            return ActiveDirectoryRepositoryFacatoryManager.Facatory.Instance();
        }


        /// <summary>
        /// 用户所属的组，但不包括系统默认组.
        /// </summary>
        public IEnumerable<String> Groups
        {
            get
            {
                if (_userGroups == null)
                {
                    ReLoadUserGroups();
                }

                return _userGroups;
            }
        }

        public string Email { get; set; }

        /// <summary>
        /// 性别
        /// </summary>
        public Gender Gender { get; set; }

        public String GenderDescription
        {
            get { return EnumHelper.GetDescription(Gender); }
        }

        public void ReLoadUserGroups()
        {

            _userGroups = new List<string>(Repository().GetAllGroupsForUser(LoginName));
            //移除系统设定的默认组，但用户设定的其它默认组，则不移除
            _userGroups.RemoveAll(name => name.Equals("Domain Users", StringComparison.OrdinalIgnoreCase));

        }

        #endregion

        #region Methods
        public string GetUserPrincipalName()
        {
            return String.Format("{0}@{1}", LoginName, ADPath.GetDC().Replace("DC=", "").Replace(',', '.'));
        }

        public void Save()
        {
            try
            {


                #region set

                var adUserRepository = Repository();
                ADServiceAccessor.ADService.ADUser user = adUserRepository.CreateUser(DistinguishedName.OU.Value,
                                                               Job.ADJobTitle,
                                                               DisplayName,
                                                               DisplayName,
                                                               LoginName,
                                                               GetUserPrincipalName(),
                                                               Password,
                                                               UserName.Surname,
                                                               UserName.GivenName,
                                                               Description,

                                                               Telephone.IPPhone,
                                                               Telephone.Mobile,
                                                               Telephone.HomePhone,
                                                               Telephone.FacsimileTelephoneNumber,

                                                               Address.Co,
                                                               Address.St,
                                                               Address.L,
                                                               Address.StreetAddress,
                                                               Address.PostOfficeBox,
                                                               Address.PostalCode,

                                                               (Int32)_userAccountControl,
                                                               _pwdLastSet,

                                                               Mail.HomeMDB,
                                                               Mail.Server,
                                                               Mail.Store
                        );
                #endregion
                adUserRepository.UpdateUserExtendAttributes(LoginName, new ObjectAttribute[] { new ObjectAttribute("mail", Email), new ObjectAttribute(GenderAttrubteName, Gender.ToString()), });
                CloneFromService(user);

            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "{0}创建失败", ToString());
            }
        }

        public override string ToString()
        {
            return String.Format("UserName={0},LoginName={1}", UserName, LoginName);
        }

        public void MoveToParentOU()
        {
            if (DistinguishedName.GetGrandFatherDistinguishedName() == null) return;

            MoveTo(DistinguishedName.GetGrandFatherDistinguishedName());
        }

        public void MoveTo(String targetDistinguishedName)
        {
            try
            {

                _originalDistinguishedName = DistinguishedName.Clone();
                var adUserRepository = Repository();
                adUserRepository.MoveTo(DistinguishedName.Value, targetDistinguishedName);
                ADServiceAccessor.ADService.ADUser adUser = adUserRepository.GetADUserByLoginName(LoginName);
                CloneFromService(adUser);

            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "在将用户{0}移动到{1}时失败", DistinguishedName.Value,
                                            targetDistinguishedName);
            }
        }
        #endregion

        #region Load
        /// <summary>
        /// 根据登录名获取
        /// </summary>
        /// <param name="loginName">用户登陆名</param>
        /// <exception cref="ADUtilityException">在访问webserivce时失败时，抛出此异常<see cref="ADUtilityException"/></exception>
        /// <returns>如果找到则ADUser，如果未找到，则返回null</returns>
        public static ADUser LoadByLoginName(String loginName)
        {
            if (String.IsNullOrEmpty(loginName)) throw new ArgumentNullException("loginName");
            try
            {
                var repository = Repository();
                ADServiceAccessor.ADService.ADUser adUser = repository.GetADUserByLoginName(loginName);
                if (adUser == null) return null;
                return new ADUser(adUser);

            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "按LoginName加载:[{0}]失败", loginName);
            }
        }

        public static ADUser LoadByDN(string userDN)
        {
            if (String.IsNullOrEmpty(userDN)) throw new ArgumentNullException("userDN");
            try
            {
                var repository = Repository();
                ADServiceAccessor.ADService.ADUser adUser = repository.GetADUserByDnForAthena(userDN);
                if (adUser == null) return null;
                return new ADUser(adUser);

            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "按UserDN加载:[{0}]失败", userDN);
            }
        }

        /// <summary>
        /// 根据DistingushedName加载用户
        /// </summary>
        /// <param name="distingushedName"></param>
        ///  <example>
        /// //将加载根据目录下Users中的名称为刘志文的User
        /// ADUser user = Load("CN=刘志文,CN=Users,DC=BI,DC=RD1,DC=com");
        /// 加载江西省下的姓名为志文的用户
        /// ADUser user = Load("CN=志文,OU=江西省,DC=BI,DC=RD1,DC=com");
        ///    </example>
        /// <exception cref="ADUtilityException">在访问webserivce时失败时，抛出此异常,比如错误的distingushedName<see cref="ADUtilityException"/></exception>
        /// <returns>如果找到则返回ADUser，如果未找到，则返回null</returns>
        public static ADUser Load(UserDistinguishedName distingushedName)
        {
            ADServiceAccessor.ADService.ADUser adUser = LoadFromService(distingushedName.Value);
            if (adUser == null) return null;
            return new ADUser(adUser);
        }

        private static ADServiceAccessor.ADService.ADUser LoadFromService(String distingushedName)
        {
            try
            {

                return Repository().GetADUserByDnForAthena(distingushedName);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "按DistingushedName加载:[{0}]失败", distingushedName);
            }
        }

        /// <summary>
        /// 按路径加载用户
        /// </summary>
        /// <param name="path">用户路径<see cref="ADPath.GetDistinguishedNameForUser()"/></param>
        /// <returns>如果为未找到，则返回null</returns>
        public static ADUser Load(ADPath path)
        {
            return Load(new UserDistinguishedName(path));
        }
        #endregion

        public Int32 Delete()
        {
            try
            {
                return Repository().Delete(_distinguishedName.Value);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, String.Format("用户[{0}]删除失败", ToString()));
            }
        }

        public void Update()
        {
            try
            {

                ObjectAttribute[] attributes = new ObjectAttribute[]
                                                       {
                                                           new ObjectAttribute("sAMAccountName",NewLoginName), 
                                                           new ObjectAttribute("displayName",DisplayName),
                                                           new ObjectAttribute("name",DisplayName),
                                                           new ObjectAttribute("title",Job.ADJobTitle),
                                                           new ObjectAttribute("userPrincipalName",GetUserPrincipalName()),
                                                           new ObjectAttribute("sn",UserName.Surname),
                                                           new ObjectAttribute("givenName",UserName.GivenName),
                                                           new ObjectAttribute("description",Description),

                                                           new ObjectAttribute("ipPhone",Telephone.IPPhone),
                                                           new ObjectAttribute("mobile",Telephone.Mobile),
                                                           new ObjectAttribute("homePhone",Telephone.HomePhone),
                                                           new ObjectAttribute("facsimileTelephoneNumber",Telephone.FacsimileTelephoneNumber),

                                                           new ObjectAttribute("co",Address.Co),
                                                           new ObjectAttribute("st",Address.St),
                                                           new ObjectAttribute("l",Address.L),
                                                           new ObjectAttribute("streetAddress",Address.StreetAddress),
                                                           new ObjectAttribute("postOfficeBox",Address.PostOfficeBox),
                                                           new ObjectAttribute("postalCode",Address.PostalCode),
                                                           new ObjectAttribute("mail",Email),
                                                           new ObjectAttribute(GenderAttrubteName,Gender.ToString()), 
                                                    };
                Repository().UpdateUserExtendAttributes(LoginName, attributes);

                //重新从AD中加载对象
                var newDN = new UserDistinguishedName(DistinguishedName.OU, DisplayName);
                CloneFromService(LoadFromService(newDN.Value));
                //service.UpdateUser(_distinguishedName.Value);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, String.Format("用户[{0}]更新失败", ToString()));
            }
        }

        /// <summary>
        /// 重新设置用户在某个OU下的的用户组
        /// </summary>
        /// <param name="orgnization"></param>
        /// <param name="newGroupNames"></param>
        public void ResetOrnizationGroupsForUser(params String[] newGroupNames)
        {
            if (newGroupNames == null || newGroupNames.Length == 0) return;

            ClearUserGroupsAndSubmit();

            foreach (var groupName in newGroupNames)
            {
                if (groupName == PrimaryGroup) continue;
                var adUserGroup = ADUserGroup.LoadByName(groupName);
                if (adUserGroup == null) throw new ADUserGroupNotFoundException(groupName);
                adUserGroup.LoadUsers();
                adUserGroup.AddUser(this);
                adUserGroup.Update();
            }

            ReLoadUserGroups();
        }

        /// <summary>
        /// 删除用户隶属的所有用户组
        /// </summary>
        public void ClearUserGroupsAndSubmit()
        {
            foreach (var group in Groups)
            {
                var adUserGroup = ADUserGroup.LoadByName(group);
                //if(!adUserGroup.Organization.IsSubOUOf(orgnization)) continue;
                adUserGroup.RemoveUser(LoginName);
                adUserGroup.Update();
            }

            if (_userGroups != null) _userGroups.Clear();
        }

        /// <summary>
        /// 设置密码，密码要具有一定的复杂性，比如 abc@132
        /// </summary>
        /// <param name="pwd"></param>
        public void SetPassword(string pwd)
        {
            try
            {
                Repository().SetPassword(LoginName, pwd);
            }
            catch (SoapException ex)
            {
                throw ADUtilityException.Instance(ex, "密码更新失败");
            }
        }

        
    }

    public enum Gender
    {
        [Description("保密")]
        Unkown,
        [Description("男")]
        Male,
        [Description("女")]
        Female,
    }
}
