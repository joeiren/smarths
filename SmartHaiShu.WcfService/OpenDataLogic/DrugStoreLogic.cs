using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    /// <summary>
    /// 药店名录
    /// </summary>
    public class DrugStoreLogic
    {
        /// <summary>
        /// 记录数
        /// </summary>
        /// <returns></returns>
        public int DrugStoreCount()
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_0003_ydml
                         select entity).Count();
            return count;
        }

        /// <summary>
        /// 分页获取药店
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_0003_ydml> LoadDrugStore(int pageNo, int pageSize)
        {
            var result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_0003_ydml
                          orderby entity.CHECK_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize);
            return result;
        }
    }
}
