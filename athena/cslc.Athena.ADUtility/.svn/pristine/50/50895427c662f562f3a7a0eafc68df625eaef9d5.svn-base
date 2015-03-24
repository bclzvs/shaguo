using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace cslc.Athena.ADUtility
{

    [Serializable]
    public class ADUserNotFoundException : Exception
    {
        //
        // For guidelines regarding the creation of new exception types, see
        //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconerrorraisinghandlingguidelines.asp
        // and
        //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dncscol/html/csharp07192001.asp
        //
        

        public ADUserNotFoundException()
        {
        }

        public ADUserNotFoundException(String loginName) : base(String.Format("在AD中不存在用户:{0}",loginName))
        {

        }

        //public ADUserNotFoundException(string message) : base(message)
        //{
        //}

        public ADUserNotFoundException(string message, Exception inner) : base(message, inner)
        {
        }

        protected ADUserNotFoundException(
            SerializationInfo info,
            StreamingContext context) : base(info, context)
        {
        }
    }
}
