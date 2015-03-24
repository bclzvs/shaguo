using System;
using System.Collections.Generic;
using cslc.Athena.ADServiceAccessor.ADService;

namespace cslc.Athena.ADUtility
{
    public interface IActiveDirectoryRepository
    {
        IEnumerable<ADObject> GetSubOUs(string distinguishedName);

        IEnumerable<ADServiceAccessor.ADService.ADUser> GetSubUsers(string distinguishedName);
        ADObject GetOUByDistinguishedName(string distinguishedName);
        void MoveTo(string sourceDistinguishedName, string targetDistinguishedName);
        bool NameExistsInOU(string sourceDistinguishedName, string name);
        int Delete(string distinguishedName);
        void UpdateOU(string distinguishedName, string name, string newName, string description);
        ADObject CreateOUAndReturn(string parentDistinguishedName, string name, string description);

        IEnumerable<ADGroup> GetSubGroups(string distinguishedName);
        IEnumerable<string> GetUsersByGroupName(string groupName, int depth);
        ADGroup CreateADGroup(string ou, string name, string alias, string description, string member);
        ADGroup GetGroupByDistinguishedName(string distinguishedName);
        ADGroup GetGroupByAmmountName(string name);
        Int32 UpdateGroupAndAmmountName(string groupName, string newGroupName, string displayName, string description, string ammountName, string[] memberList);


        string GetPrimaryGroup(string loginName);

        IEnumerable<string> GetAllGroupsForUser(string loginName);

        ADServiceAccessor.ADService.ADUser CreateUser(
            string ou,
            string jobTitle,
            string name,
            string displayName,
            string sAMAccountName,
            string userPrincipalName,
            string password,
            string sn,
            string givenName,
            string description,
            string ipPhone,
            string mobile,
            string homePhone,
            string facsimileTelephoneNumber,
            string co,
            string st,
            string l,
            string streetAddress,
            string postOfficeBox,
            string postalCode,
            int userAccountControl,
            long pwdLastSet,
            string homeMDB,
            string mailServer,
            string mailStore);

        void UpdateUserExtendAttributes(string loginName, ObjectAttribute[] objectAttributes);


        ADServiceAccessor.ADService.ADUser GetADUserByLoginName(string loginName);

        ADServiceAccessor.ADService.ADUser GetADUserByDnForAthena(string distingushedName);


        void SetPassword(string loginName, string pwd);
        String[] GetAllGroupDNsForOU(String ouDN);
        string[] GetSubUserDistinctNames(string groupDN);

        string[] GetAllSubOuDistinguishedNames(string ouDN);
        bool AmmountNameExists(string ammountName);
        IEnumerable<string> GetGroupDNsForOU(string ouDN);
        string[] GetAllUserDNsForOU(string ouDN);
        String[] GetUserDNsByGroupDN(String groupDN);
    }
}
