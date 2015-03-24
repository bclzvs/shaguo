using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using cslc.Athena.ADServiceAccessor;
using cslc.Athena.ADServiceAccessor.ADService;

namespace cslc.Athena.ADUtility
{
    public class ADUserFinder
    {
        private OUDistinguishedName _ouDistinguishedName;
        private GroupDistinguishedName _groupDistinguishedName;
        private String _jobLevel;
        private Int32 _pageSize;
        private Int32 _pageIndex;
        private Int32 _recordCount;
        private ADUserFinderOrderBy _orderBy = ADUserFinderOrderBy.SurnNameAndGivenNameAsc;

        public String KeyWord { get; set; }
        public Int32 RecordCount { get { return _recordCount; }  }

        public ADUserFinder(OUDistinguishedName ouDistinguishedName,GroupDistinguishedName groupDistinguishedName)
        {
            _ouDistinguishedName = ouDistinguishedName;
            _groupDistinguishedName = groupDistinguishedName;
        }

        private ADUserFinder(OUDistinguishedName ouDistinguishedName) : this(ouDistinguishedName, null)
        {

        }

        public static IEnumerable<ADUser> Find(OUDistinguishedName ouDistinguishedName, GroupDistinguishedName groupDistinguishedName)
        {
            return new ADUserFinder(ouDistinguishedName, groupDistinguishedName).Find(null,"");
        }

        public static IEnumerable<ADUser> Find(OUDistinguishedName ouDistinguishedName)
        {
            return new ADUserFinder(ouDistinguishedName).Find(null, "");
        }

        public IEnumerable<ADUser> Find(String jobLevel,String keyWord)
        {
            var service = new ADServiceFacade();
            cslc.Athena.ADServiceAccessor. ADService.ADUser[] usersFinded = service.Find(
                _ouDistinguishedName.Value, 
                _groupDistinguishedName == null ? "" : _groupDistinguishedName.Value, 
                jobLevel, keyWord, _pageIndex, _pageSize, _orderBy, out _recordCount);

            foreach (var adUser in usersFinded)
            {
                yield return new ADUser(adUser);
            }
        }

        public static IEnumerable<ADUser> Find(OUDistinguishedName ouDistinguishedName, GroupDistinguishedName groupDistinguishedName, ADJobLevel jobLevel)
        {
            return new ADUserFinder(ouDistinguishedName, groupDistinguishedName).Find(jobLevel.ToString(),null);
        }

        public void SetJobLevel(ADJobLevel jobLevel)
        {
            _jobLevel = jobLevel.ToString();
        }

        public IEnumerable<ADUser> Find()
        {
            return Find(_jobLevel, KeyWord);
        }

        public void SetPage(int pageIndex, int pageSize)
        {
            
            _pageSize = pageSize;
            _pageIndex = pageIndex == 0 ? 1 : pageIndex;
        }

        public void SetPageForGetAllRecords()
        {
            SetPage(0,0);
        }

        public void SetOrderBy(ADUserFinderOrderBy aDUserFinderOrderBy)
        {
            _orderBy = aDUserFinderOrderBy;
        }
    }
}
