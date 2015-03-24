using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace cslc.Athena.ADUtility
{
    /// <summary>
    /// 路径未找到
    /// </summary>
    [Serializable]
    public class PathNotFoundException : ADUtilityException
    {
        //
        // For guidelines regarding the creation of new exception types, see
        //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconerrorraisinghandlingguidelines.asp
        // and
        //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dncscol/html/csharp07192001.asp
        //

        public PathNotFoundException()
        {
        }

        public PathNotFoundException(string message) : base(message)
        {
        }

        public PathNotFoundException(string message, Exception inner) : base(message, inner)
        {
        }

        protected PathNotFoundException(
            SerializationInfo info,
            StreamingContext context) : base(info, context)
        {
        }
    }
}
