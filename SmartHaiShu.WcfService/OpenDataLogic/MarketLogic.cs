using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    /// <summary>
    /// 超市
    /// </summary>
    public class MarketLogic
    {

        public int MarketCount()
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_0003_cs
                         select entity).Count();
            return count;
        }

        public IEnumerable<b_t_ufp_0003_cs> LoadMarket(int pageNo, int pageSize)
        {
            var result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_0003_cs
                          orderby entity.RELEASE_TIME descending, entity.CHECK_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize);
            return result;
        }
    }
}
