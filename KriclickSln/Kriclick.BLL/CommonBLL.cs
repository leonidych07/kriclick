using Kriclick.Common.Models;
using Kriclick.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kriclick.BLL
{
    public static class CommonBLL
    {
        public static List<States> GetStateList()
        {
            List<States> stateList = new List<States>();
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                stateList = dbContext.States.Select(t => new States
                {
                    StateId = t.StateId,
                    StateName = t.StateName,
                    Abbreviation = t.Abbreviation,
                    CountryId = t.CountryId
                }).ToList().
                OrderBy(x => x.Abbreviation).ToList();
            }
            stateList.Insert(0, new States { StateId = null, StateName = "Select", Abbreviation = "Select", CountryId = null });
            return stateList;
        }


        public static List<IndustryType> GetIndustryTypeList()
        {
            List<IndustryType> IndustryTypeList = new List<IndustryType>();
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                IndustryTypeList = dbContext.IndustryTypes.OrderBy(x => x.IndustryType1).ToList();
            }
            return IndustryTypeList;
        }
    }

    public class States
    {
        public int? StateId { get; set; }
        public string StateName { get; set; }
        public string Abbreviation { get; set; }
        public short? CountryId { get; set; }
    }

}
