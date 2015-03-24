using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace cslc.Athena.ADUtility
{
    public abstract class DistinguishedName
    {
        public static OUDistinguishedName RootOU = new OUDistinguishedName("\\");

        private ADPath _path;
        protected DistinguishedName(ADPath path)
        {
            _path = path;
        }

        protected DistinguishedName()
        {

        }

        //public abstract DistinguishedName GetParent();

        public abstract String Value { get; protected set; }

        public ADPath Path
        {
            get { return _path; }
        }

        public override string ToString()
        {
            return Value;
        }
    }

    [Serializable]
    public sealed class OUDistinguishedName : DistinguishedName,IComparable<OUDistinguishedName>
    {
        public OUDistinguishedName(ADPath path)
            : base(path)
        {
        }

        public OUDistinguishedName(OUDistinguishedName parentOU, String name)
        {
            _parent = parentOU;
            _name = name;
            _isSubOU = true;
        }

        private string _value;
        private Boolean _isSubOU;
        public Boolean IsRootOU
        {
            get
            {
                if (_isSubOU) return false;
                return Path.Path == "\\" || Path.Path.Trim().Length == 0;
            }
        }

        private OUDistinguishedName _parent;
        public OUDistinguishedName Parent
        {
            get
            {
                if (IsRootOU) return null;
                if (_parent == null)
                {
                    _parent = new OUDistinguishedName(Path.RemoveLastNode());
                }

                return _parent;
            }
        }

        private String _name;
        public String Name
        {
            get
            {
                if (_name == null)
                {
                    _name = Path.LastNode();
                }
                return _name;
            }
        }

        public override string Value
        {
            get
            {
                if (_value == null)
                {
                    if (IsRootOU) return ADPath.GetDC();

                    _value = String.Format("OU={0},{1}", Name, Parent.Value);
                }

                return _value;
            }
            protected set { _value = value; }
        }

        public static OUDistinguishedName Parse(String distinguishedName)
        {
            return new OUDistinguishedName(ADPath.Parse(distinguishedName));
        }

        public String ProvinceDistinguishedName
        {
            get { return Regex.Match(Value, @"OU=[^,]+,DC.*$").Groups[0].Value; }
        }

        public String CityDistinguishedName
        {
            get
            {
                if(IsProvince) throw new InvalidOperationException("省OU没有市名称");
                return Regex.Match(Value, @"OU=[^,]+,OU=[^,]+,DC.*$").Groups[0].Value;
            }
        }

        public Boolean IsProvince
        {
            get { return Value.Equals(ProvinceDistinguishedName, StringComparison.OrdinalIgnoreCase); }
        }

        public bool IsCity
        {
            get
            {
                if (IsRootOU) return false;
                if (IsProvince) return false;
                return Parent.IsProvince;
            }
        }

        public OUDistinguishedName[] Subs { get; set; }
        public UserDistinguishedName[] SubUsers { get; set; }

        /// <summary>
        /// 将字符串Dn转换成对象，目前只支持三层转换,第一层必须是从省开始
        /// </summary>
        /// <param name="ouDistinguishedNames"></param>
        /// <returns></returns>
        public static List<OUDistinguishedName> ConvertToTree(String[] ouDistinguishedNames)
        {
            OUDistinguishedName[] distinguishedNames = Array.ConvertAll(ouDistinguishedNames, name => Parse(name));

            var provinces = from item in distinguishedNames
                            where item.IsProvince
                            select item;

            foreach (var province in provinces)
            {
                var citys = from item in distinguishedNames
                            where item.IsCity
                                && item.ProvinceDistinguishedName.Equals(province.Value, StringComparison.OrdinalIgnoreCase)
                            select item;
                province.Subs = citys.ToArray();


                foreach (var city in citys)
                {
                    var countys = from item in distinguishedNames
                                  where item.IsCounty
                                      && item.CityDistinguishedName.Equals(city.Value, StringComparison.OrdinalIgnoreCase)
                                  select item;
                    city.Subs = countys.ToArray();
                }
            }

            return provinces.ToList();
        }

        /// <summary>
        /// 将字符串Dn转换成对象，目前只支持三层转换,第一层必须是从省开始
        /// </summary>
        /// <param name="ouDistinguishedNames"></param>
        /// <returns></returns>
        public static List<OUDistinguishedName> ConvertToTreeIncludeUsers(String[] ouDistinguishedNames,String[] userDistinguishedNames)
        {
            OUDistinguishedName[] distinguishedNames = Array.ConvertAll(ouDistinguishedNames, name => Parse(name));
            UserDistinguishedName[] users = Array.ConvertAll(userDistinguishedNames,
                                                             name => UserDistinguishedName.Parse(name));

            var provinces = from item in distinguishedNames
                            where item.IsProvince
                            select item;

            foreach (var province in provinces)
            {
                var citys = from item in distinguishedNames
                            where item.IsCity
                                && item.ProvinceDistinguishedName.Equals(province.Value, StringComparison.OrdinalIgnoreCase)
                            select item;
                province.Subs = citys.ToArray();

                var provinceUsers = from user in users
                           where user.OU.Value.Equals(province.Value, StringComparison.OrdinalIgnoreCase)
                           select user;
                province.SubUsers = provinceUsers.ToArray();

                foreach (var city in citys)
                {
                    var countys = from item in distinguishedNames
                                  where item.IsCounty
                                      && item.CityDistinguishedName.Equals(city.Value, StringComparison.OrdinalIgnoreCase)
                                  select item;
                    city.Subs = countys.ToArray();

                    var cityUsers = from user in users
                                    where user.OU.Value.Equals(city.Value, StringComparison.OrdinalIgnoreCase)
                                    select user;
                    city.SubUsers = cityUsers.ToArray();

                    foreach (var county in countys)
                    {
                        var countyUsers = from user in users
                                          where user.OU.Value.Equals(county.Value, StringComparison.OrdinalIgnoreCase)
                                        select user;
                        county.SubUsers = countyUsers.ToArray();
                    }
                }
            }

            return provinces.ToList();
        }

        public Boolean IsCounty
        {
            get
            {
                if (IsRootOU) return false;
                return Parent.IsCity;
            }
        }

        public int CompareTo(OUDistinguishedName other)
        {
            return System.String.CompareOrdinal(Name, other.Name);
        }
    }

    public sealed class GroupDistinguishedName : DistinguishedName, IComparable<GroupDistinguishedName>
    {
        #region Fields
        private OUDistinguishedName _ouDistinguishedName;
        private String _groupName;
        #endregion

        #region Constructors
        public GroupDistinguishedName(ADPath path)
            : base(path)
        {

        }

        public GroupDistinguishedName(OUDistinguishedName ouDistinguishedName, string groupName)
        {
            if (String.IsNullOrEmpty(groupName)) throw new ArgumentNullException("groupName");
            _ouDistinguishedName = ouDistinguishedName;
            _groupName = groupName;
        }
        #endregion

        #region Properties
        public override string Value
        {
            get
            {
                return String.Format("CN={0},{1}", GroupName, OU.Value);
            }
            protected set { throw new NotImplementedException(); }
        }

        public string GroupName
        {
            get
            {
                if (_groupName == null)
                {
                    _groupName = Path.LastNode();
                }
                return _groupName;
            }
        }

        public OUDistinguishedName OU
        {
            get
            {
                if (_ouDistinguishedName == null)
                {
                    _ouDistinguishedName = new OUDistinguishedName(Path.RemoveLastNode());
                }

                return _ouDistinguishedName;
            }
        }
        #endregion

        public static GroupDistinguishedName From(String dn)
        {
            return new GroupDistinguishedName(ADPath.Parse(dn));
        }

        public int CompareTo(GroupDistinguishedName other)
        {
            return this.GroupName.CompareTo(other.GroupName);
        }
    }

    [Serializable]
    public sealed class UserDistinguishedName : IComparable<UserDistinguishedName>
    {
        private OUDistinguishedName _ou;
        private String _userName;
        private String _value;

        public UserDistinguishedName(ADPath path)
            : this(new OUDistinguishedName(path.RemoveLastNode()), path.LastNode())
        {
        }

        public UserDistinguishedName(OUDistinguishedName ou, string userName)
        {
            _ou = ou;
            _userName = userName;
        }

        public OUDistinguishedName OU
        {
            get
            {
                return _ou;
            }
        }

        public String UserName
        {
            get
            {
                return _userName;
            }
        }

        public string Value
        {
            get
            {
                if (String.IsNullOrEmpty(_value))
                {
                    if (IsUsersUser())
                        _value = String.Format("CN={0},CN=Users,{1}", UserName, OU.Value);
                    else
                        _value = String.Format("CN={0},{1}", UserName, OU.Value);
                }
                return _value;
            }
        }

        /// <summary>
        /// 是否在存在于Users中的user
        /// </summary>
        /// <returns></returns>
        public bool IsUsersUser()
        {
            return _ou.Value == DistinguishedName.RootOU.Value;
        }

        public String GetGrandFatherDistinguishedName()
        {
            if (IsUsersUser()) return null;

            //如果的祖父是根,那么就返回Users
            if (OU.Parent.Value == DistinguishedName.RootOU.Value)
            {
                return String.Format("CN=Users,{0}", OU.Parent.Value);
            }

            return OU.Parent.Value;
        }

        public UserDistinguishedName Clone()
        {
            return new UserDistinguishedName(OU, UserName);
        }

        public static UserDistinguishedName Parse(String distinguishedName)
        {
            return new UserDistinguishedName(ADPath.Parse(distinguishedName));
        }

        public int CompareTo(UserDistinguishedName other)
        {
            return String.CompareOrdinal(UserName, other.UserName);
        }
    }

    public enum ADNameType
    {
        /// <summary>
        /// 组织
        /// </summary>
        OU,
        /// <summary>
        /// 用户组、用户
        /// </summary>
        CN
    }
}
