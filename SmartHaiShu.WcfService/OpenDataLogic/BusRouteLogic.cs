using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    /// <summary>
    /// 公交线路
    /// </summary>
    public class BusRouteLogic
    {
        public IEnumerable<b_t_ufp_4_2_7> LoadBusRoute(string routeName)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_2_7
                          //let route = entity.NAME.Substring(0, Math.Min(entity.NAME.IndexOf("路"), entity.NAME.IndexOf(" ")))
                          where entity.NAME.Contains(routeName)
                         // orderby route 
                          select entity).Take(10);
            return record.Any() ? record : null;
        }

        public IEnumerable<b_t_ufp_4_2_7> LoadBusRouteList(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_2_7
                          //let route = entity.NAME.Substring(0, Math.Min(entity.NAME.IndexOf("路"), entity.NAME.IndexOf(" "))+1)
                          //orderby route
                          orderby entity.NAME
                          select entity).Skip(Math.Max(pageNo-1,0) * pageSize).Take(pageSize);
            return record.Any() ? record : null;
        }
    }
}
