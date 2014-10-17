using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    public class EducationLogic
    {
        public IEnumerable<b_t_ufp_6_1_1> LoadChildSchool(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_6_1_1
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize);
            return record.Any() ? record : null;
        }

        public IEnumerable<b_t_ufp_6_1_2> LoadPrimarySchool(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_6_1_2
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize);
            return record.Any() ? record : null;
        }

        public int ChildSchoolCount()
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_6_1_1
                         select entity).Count();
            return count;
        }
        public int PrimarySchoolCount()
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_6_1_2
                         select entity).Count();
            return count;
        }
    }
}
