using System;
using cslc.Athena.ADServiceAccessor;

namespace cslc.Athena.ADUtility
{
    public static class ActiveDirectory
    {
        public static bool AmmountNameExists(String ammountName)
        {
            if (String.IsNullOrEmpty(ammountName)) throw new ArgumentNullException("ammountName");
            
                return ActiveDirectoryRepositoryFacatoryManager.Facatory.Instance().AmmountNameExists(ammountName.Trim());
        }
    }
}