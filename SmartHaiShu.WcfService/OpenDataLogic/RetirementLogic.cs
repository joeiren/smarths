using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    /// <summary>
    /// 退休养老
    /// </summary>
    public class RetirementLogic
    {
        /// <summary>
        /// 养老院列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_8_4> LoadRetirementHome(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_8_4
                orderby entity.RELEASE_TIME descending
                select entity).Skip(Math.Max(0, pageNo - 1)).Take(pageSize);
            return record.Any() ? record : null;
        }
    }
}
