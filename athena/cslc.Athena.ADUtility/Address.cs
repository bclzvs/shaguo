using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace cslc.Athena.ADUtility
{
    [Serializable]
    public class Address
    {
        private string co;
        private string st;
        private string l;
        private string streetAddress;
        private string postOfficeBox;
        private string postalCode;

        /// <summary>
        /// 街道
        /// </summary>
        public string StreetAddress
        {
            get { return streetAddress; }
            set { streetAddress = value; }
        }

        /// <summary>
        /// 邮政信箱
        /// </summary>
        public string PostOfficeBox
        {
            get { return postOfficeBox; }
            set { postOfficeBox = value; }
        }

        /// <summary>
        /// 邮政编码
        /// </summary>
        public string PostalCode
        {
            get { return postalCode; }
            set { postalCode = value; }
        }

        /// <summary>
        /// 国家
        /// </summary>
        public string Co
        {
            get { return co; }
            set { co = value; }
        }

        /// <summary>
        /// 省/自治区
        /// </summary>
        public string St
        {
            get { return st; }
            set { st = value; }
        }

        /// <summary>
        /// 县
        /// </summary>
        public string L
        {
            get { return l; }
            set { l = value; }
        }
    }
}
