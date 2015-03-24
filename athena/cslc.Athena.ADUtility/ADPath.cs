using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using cslc.Athena.ADServiceAccessor;
using cslc.Athena.Framework;

namespace cslc.Athena.ADUtility
{
    /// <summary>
    /// AD中的路径
    /// </summary>
    [Serializable]
    public class ADPath
    {
        private String _path;
        public ADPath(string path)
        {
            _path = path;
        }

        public string Path
        {
            get { return _path; }
        }

        public static String GetDC()
        {
            var result = ConfigurationHelper.GetValueFromAppSettings("ADPrefix", "");
            if (String.IsNullOrEmpty(result)) return new ADServiceFacade().GetDomainDistinguishedName();
            return result;
        }

        public static implicit operator ADPath(String path)
        {
            return new ADPath(path);
        }

        public ADPath RemoveLastNode()
        {
            try
            {

                if (IsRoot) throw new ArgumentException("已经是根节点了");
                String path = _path.Remove(_path.LastIndexOf('\\'));
                return new ADPath(path);
            }
            catch(ArgumentOutOfRangeException ex)
            {
                var paramName = "path";
                throw new ArgumentException(String.Format("[{0}]RemoveLastNode出错",Path),paramName,ex);
            }
        }

        public String LastNode()
        {
            return _path.Split('\\').Last();
        }

        public Boolean IsRoot
        {
            get { return "\\" == Path; }
        }

        public static ADPath Parse(String distinguishedName)
        {
            MatchCollection ouMatches = Regex.Matches(distinguishedName, "OU=(?<ou>[^,]+)");
            var ous = new List<String>(ouMatches.Count);

            foreach (Match ouMatch in ouMatches)
            {
                ous.Add(ouMatch.Groups["ou"].Value);    
            }

            ous.Reverse();
            
            StringBuilder pathBuilder = new StringBuilder();
            foreach (string ou in ous)
            {
                pathBuilder.AppendFormat("\\{0}", ou);
            }

            //如果有cn,就加cn
            MatchCollection cnMatches = Regex.Matches(distinguishedName, "CN=(?<cn>[^,]+)");
            if(cnMatches.Count>0)
            {
                pathBuilder.AppendFormat("\\{0}", cnMatches[0].Groups["cn"].Value);
            }

            if(pathBuilder.Length == 0) return new ADPath("\\");

            return new ADPath(pathBuilder.ToString());
        }

        public override string ToString()
        {
            return _path;
        }
    }

    
}
