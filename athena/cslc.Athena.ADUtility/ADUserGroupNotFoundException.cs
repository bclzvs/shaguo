using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace cslc.Athena.ADUtility
{
    public class ADUserGroupNotFoundException : Exception
    {
        public ADUserGroupNotFoundException(String groupName)
            : base(String.Format("未找到用户组[{0}]", groupName))
        {

        }
    }
}
