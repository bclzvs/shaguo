using System;

namespace cslc.Athena.ADUtility
{
    /// <summary>
    /// 用户姓名
    /// </summary>
    [Serializable]
    public struct UserName : IEquatable<UserName>
    {
        private String _surname;
        private String _givenName;

        public UserName(String surnName, String givenName)
        {
            _surname = surnName;
            _givenName = givenName;
        }

        /// <summary>
        /// 姓
        /// </summary>
        public string Surname
        {
            get { return _surname; }
        }

        /// <summary>
        /// 名
        /// </summary>
        public string GivenName
        {
            get { return _givenName; }
        }

        public String Value
        {
            get { return _surname + _givenName; }
        }

        public override int GetHashCode()
        {
            return _surname.GetHashCode() + _givenName.GetHashCode();
        }

        public bool Equals(UserName other)
        {
            return other.Value == this.Value;
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            if (obj.GetType() != GetType()) return false;
            return Equals((UserName)obj);
        }

        public override string ToString()
        {
            return String.Format("{0}{1}", Surname, GivenName);
        }

        public static Boolean operator ==(UserName value1,UserName value2)
        {
            return value1.Equals(value2);
        }

        public static Boolean operator !=(UserName value1, UserName value2)
        {
            return !value1.Equals(value2);
        }
    }
}
