using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    /// <summary>
    /// 自行车分布点位
    /// </summary>
    public class BikeLocationLogic
    {
        /// <summary>
        /// 记录数
        /// </summary>
        /// <returns></returns>
        public int BikeLocationCount()
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_0003_yh
                         select entity).Count();
            return count;
        }

        /// <summary>
        /// 分页获取 自行车分布点位
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_4_1_2> LoadBikeLocation(int pageNo, int pageSize)
        {
            var result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_1_2
                          orderby entity.RELEASE_TIME descending, entity.CHECK_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize);
            return result;
        }
    }
}
