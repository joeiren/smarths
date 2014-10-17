using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;


namespace SmartHaiShu.WcfService.OpenDataLogic
{
    /// <summary>
    ///     航班信息
    /// </summary>
    public class FlightLogic
    {
        /// <summary>
        ///     信息条数
        /// </summary>
        /// <returns></returns>
        public int FlightCount()
        {
            int count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_2_6
                         select entity).Count();
            return count;
        }

        /// <summary>
        ///     出港航班条数
        /// </summary>
        /// <returns></returns>
        public int FlightExportCount()
        {
            int count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_2_6
                         where String.Compare(entity.IMPORT_PORT, "出港", StringComparison.Ordinal) == 0
                         select entity).Count();
            return count;
        }

        /// <summary>
        ///     进港航班条数
        /// </summary>
        /// <returns></returns>
        public int FlightImportCount()
        {
            int count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_2_6
                         where String.Compare(entity.IMPORT_PORT, "进港", StringComparison.Ordinal) == 0
                         select entity).Count();
            return count;
        }

        /// <summary>
        /// </summary>
        /// <returns></returns>
        public IEnumerable <b_t_ufp_4_2_6> FindFlightsImport(int pageNo, int pageSize, bool import)
        {
            string key = import ? "进港" : "出港";
            var flights = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_2_6
                           where String.Compare(entity.IMPORT_PORT, key, StringComparison.Ordinal) == 0
                           orderby entity.ADDRESS
                           select entity).Skip(Math.Max(0, pageNo - 1)*pageSize).Take(pageSize);
            return flights;
        }
    }
}