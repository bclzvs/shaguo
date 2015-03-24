using System;
using System.Collections.Generic;
using cslc.Athena.ADServiceAccessor;
using cslc.Athena.ADServiceAccessor.ADService;

namespace cslc.Athena.ADUtility
{
    internal class ADServiceFacadeAdapter : IActiveDirectoryRepository, IDisposable
    {
        private ADServiceFacade facade = new ADServiceFacade();

        #region IADOrganizaitonUnitRepository Members

        public IEnumerable<ADObject> GetSubOUs(string distinguishedName)
        {
            return facade.GetSubOUs(distinguishedName);
        }

        public IEnumerable<ADServiceAccessor.ADService.ADUser> GetSubUsers(string distinguishedName)
        {
            return facade.GetSubUsers(distinguishedName);
        }

        public ADObject GetOUByDistinguishedName(string distinguishedName)
        {
            return facade.GetOUByDistinguishedName(distinguishedName);
        }

        public int UpdateGroupAndAmmountName(string groupName, string newGroupName, string displayName, string description, string ammountName, string[] memberList)
        {
            return facade.UpdateGroupAndAmmountName(groupName, newGroupName, displayName, description, ammountName,
                                                    memberList);
        }

        public string GetPrimaryGroup(string loginName)
        {
            return facade.GetPrimaryGroup(loginName);
        }

        public IEnumerable<string> GetAllGroupsForUser(string loginName)
        {
            return facade.GetAllGroupsForUser(loginName);
        }

        public ADServiceAccessor.ADService.ADUser CreateUser(string ou, string jobTitle, string name, string displayName, string sAMAccountName, string userPrincipalName, string password, string sn, string givenName, string description, string ipPhone, string mobile, string homePhone, string facsimileTelephoneNumber, string co, string st, string l, string streetAddress, string postOfficeBox, string postalCode, int userAccountControl, long pwdLastSet, string homeMDB, string mailServer, string mailStore)
        {
            return facade.CreateUser(
                ou,
                jobTitle,
                name,
                displayName,
                sAMAccountName,
                userPrincipalName,
                password,
                sn,
                givenName,
                description,
                ipPhone,
                mobile,
                homePhone,
                facsimileTelephoneNumber,
                co,
                st,
                l,
                streetAddress,
                postOfficeBox,
                postalCode,
                userAccountControl,
                pwdLastSet,
                homeMDB,
                mailServer,
                mailStore
                );
        }

        public void UpdateUserExtendAttributes(string loginName, ObjectAttribute[] objectAttributes)
        {
            facade.UpdateUserExtendAttributes(loginName, objectAttributes);
        }



        public void MoveTo(string sourceDistinguishedName, string targetDistinguishedName)
        {
            facade.MoveTo(sourceDistinguishedName,targetDistinguishedName);
        }

        public IEnumerable<string> GetUsersByGroupName(string groupName, int depth)
        {
            return facade.GetUsersByGroupName(groupName, depth);
        }

        public ADGroup CreateADGroup(string ou, string name, string alias, string description, string member)
        {
            return facade.CreateADGroup(ou, name, alias, description, member);
        }

        public ADGroup GetGroupByDistinguishedName(string distinguishedName)
        {
            return facade.GetGroupByDistinguishedName(distinguishedName);
        }


        public ADGroup GetGroupByAmmountName(string name)
        {
            return facade.GetGroupByAmmountName(name);
        }

        public ADServiceAccessor.ADService.ADUser GetADUserByLoginName(string loginName)
        {
            return facade.GetADUserByLoginName(loginName);
        }

        public ADServiceAccessor.ADService.ADUser GetADUserByDnForAthena(string distingushedName)
        {
            return facade.GetADUserByDnForAthena(distingushedName);
        }

        public bool NameExistsInOU(string sourceDistinguishedName, string name)
        {
            return facade.NameExistsInOU(sourceDistinguishedName, name);
        }

        public int Delete(string distinguishedName)
        {
            return facade.Delete(distinguishedName);
        }



        public void SetPassword(string loginName, string pwd)
        {
            facade.SetPassword(loginName, pwd);
        }

        public void UpdateOU(string distinguishedName, string name, string newName, string description)
        {
            facade.UpdateOU(distinguishedName, name, newName, description);
        }

        public ADObject CreateOUAndReturn(string parentDistinguishedName, string name, string description)
        {
            return facade.CreateOUAndReturn(parentDistinguishedName, name, description);
        }

        public IEnumerable<ADGroup> GetSubGroups(string distinguishedName)
        {
            return facade.GetSubGroups(distinguishedName);
        }

        public String[] GetAllGroupDNsForOU(String ouDN)
        {
            return facade.GetAllGroupDNsForOU(ouDN);
        }

        public string[] GetSubUserDistinctNames(string groupDN)
        {
            return facade.GetSubUserDistinctNames(groupDN);
        }

        public string[] GetAllSubOuDistinguishedNames(string ouDN)
        {
            return facade.GetAllSubOuDistinguishedNames(ouDN);
        }

        public bool AmmountNameExists(string ammountName)
        {
            return facade.AmmountNameExists(ammountName);
        }

        public IEnumerable<string> GetGroupDNsForOU(string ouDN)
        {
            return facade.GetGroupDNsForOU(ouDN);
        }

        public string[] GetAllUserDNsForOU(string ouDN)
        {
            return facade.GetAllUserDNsForOU(ouDN);
        }

        public string[] GetUserDNsByGroupDN(string groupDN)
        {
            return facade.GetUserDNsByGroupDN(groupDN);
        }

        #endregion

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        void Dispose(Boolean disposing)
        {
            if(disposing)
            {
                facade.Dispose();
            }
        }
    }
}