using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    /// <summary>
    /// 银行网点
    /// </summary>
    public class BankLocationLogic
    {
        /// <summary>
        /// 记录数
        /// </summary>
        /// <returns></returns>
        public int BankLocationCount()
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_0003_yh
                         select entity).Count();
            return count;
        }

        /// <summary>
        /// 分页获取银行网点
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_0003_yh> LoadBankLocation(int pageNo, int pageSize)
        {
            var result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_0003_yh
                          orderby entity.RELEASE_TIME descending, entity.CHECK_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize);
            return result;
        }
    }
}
