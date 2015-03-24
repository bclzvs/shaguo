using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Services.Protocols;
using cslc.Athena.Framework;

namespace cslc.Athena.ADUtility
{
    /// <summary>
    /// AD工具组件的自定义异常
    /// </summary>
    [Serializable]
    public class ADUtilityException : Exception
    {
        #region Constructors
        public ADUtilityException()
        {
        }

        public ADUtilityException(string message) : base(message)
        {
        }

        public ADUtilityException(string message, Exception inner) : base(message, inner)
        {
        }

        protected ADUtilityException(
            SerializationInfo info,
            StreamingContext context) : base(info, context)
        {
        }
        #endregion

        public String COMHResult { get; internal set; }

        public string HResultErrorMessage { get; internal set; }

        #region Instance
        public static ADUtilityException Instance(String dn,ADOperation operation, SoapException ex)
        {
            var result = Instance(ex, "{0}[{1}]时发生异常", EnumHelper.GetDescription(operation), dn);
            //if(result.HResultErrorMessage.Contains("对象已存在"))
            //{
            //    return new ADObjectExistedException(dn,result);
            //}

            return result;
        }

        public static ADUtilityException Instance(String dn, ADOperation operation)
        {
            return Instance(dn, operation,null);
        }

        public static ADUtilityException Instance(SoapException ex,String format,params object [] values)
        {
            //if(ex.Message.Contains("指定了一个无效的 dn 语法"))
            //{
            //    return new InvalidDistingusiedNameException();
            //}
            //TODO:处理UnAuthorizedException

            String hresult = "";
            String hResultMessage = "";
            if(ex != null)
            {
                Match hresultMatch = Regex.Match(ex.Message, "HRESULT:(?<hresult>[^)]+)");
                if(hresultMatch.Success)
                {
                    hresult = hresultMatch.Groups["hresult"].Value.TrimStart();

                    Match messageMatch = Regex.Match(ex.Message, hresult+@"\): (?<hresultMessage>[^(]+)");
                    if(messageMatch.Success)
                    {
                        hResultMessage = messageMatch.Groups["hresultMessage"].Value;

                        //if (hResultMessage.Contains("对象已存在"))
                        //{
                        //    throw new ADObjectExistedException();
                        //}
                    }
                }
            }

            return new ADUtilityException(String.Format(format,values),ex){COMHResult =  hresult,HResultErrorMessage = hResultMessage};
        }
        #endregion
    }

    public enum ADOperation
    {
        [Description("创建OU")]
        CreateOU,
        [Description("加载OU")]
        LoadOU,
        [Description("修改OU")]
        ModifyOU,
        [Description("修改所属OU")]
        MoveToNewParentOU,
        [Description("删除OU")]
        DeleteOU,

        [Description("创建UserGroup")]
        CreateUserGroup,
        [Description("加载UserGroup")]
        LoadUserGroup,
        [Description("修改UserGroup")]
        ModifyUserGroup,

        [Description("创建User")]
        CreateUser,
        [Description("加载User")]
        LoadUser,
        [Description("修改User")]
        ModifyUser,
    }
}
