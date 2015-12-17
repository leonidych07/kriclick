using Kriclick.Common.Models;
using Kriclick.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kriclick.BLL
{
   public static  class CommonBLL
    {
        public static List<State> GetStateList()
        {
            List<State> stateList = new List<State>();
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                stateList = dbContext.States.OrderBy(x=>x.Abbreviation).ToList();
            }
            return stateList;
        }

        public static List<IndustryType> GetIndustryTypeList()
        {
            List<IndustryType> IndustryTypeList = new List<IndustryType>();
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                IndustryTypeList = dbContext.IndustryTypes.OrderBy(x=>x.IndustryType1).ToList();
            }
            return IndustryTypeList;
        }
    }
}
