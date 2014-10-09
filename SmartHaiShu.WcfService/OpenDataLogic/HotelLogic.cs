using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    public class HotelLogic
    {
        public IEnumerable<b_t_ufp_4_5_1> LoadStarHotelList(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_5_1
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1)).Take(pageSize);
            return record.Any() ? record : null;
        }

        public IEnumerable<b_t_ufp_4_5_2> LoadFlowerHotelList(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_5_2
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1)).Take(pageSize);
            return record.Any() ? record : null;
        }
    }
}
