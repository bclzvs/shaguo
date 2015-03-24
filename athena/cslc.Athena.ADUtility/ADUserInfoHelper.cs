using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using cslc.Athena.ADServiceAccessor;

namespace cslc.Athena.ADUtility
{
    /// <summary>
    /// 这个类实现的功能：在各个WebApp中实现根据LoginName获取该用户在AD中存储的各种信息
    /// </summary>
   public  class ADUserInfoHelper
    {
       private ADUserInfoHelper()
       {
       }

       static ADServiceFacade service = new ADServiceFacade();

        /// <summary>
        /// 根据loginName获取对应的在AD系统中的DisplayName
        /// </summary>
        /// <param name="loginName"></param>
        /// <returns></returns>
        public static string GetDisplayNameByLoginName(string loginName)
        {
            if (string.IsNullOrEmpty(loginName))
            {
                return null;
            }

            if (loginName.Contains("\\"))
            {
                loginName = loginName.Substring(loginName .LastIndexOf ("\\")+1);
            }
            var user = service.GetADUserByLoginName(loginName );
            if (user == null)
            {
                return null;
            }
            else
            {
                return user.DisplayName;
            }
        }
    }
}
