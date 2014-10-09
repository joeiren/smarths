﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    /// <summary>
    /// 汽车服务
    /// </summary>
    public class CarServiceLogic
    {
        /// <summary>
        /// 汽车4s店
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_4_3_1> Load4SLocation(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_3_1
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo -1)).Take(pageSize);
            return record.Any() ? record : null;
        }

        /// <summary>
        /// 车辆维修
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_4_3_2> LoadCarRepairLocation(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_3_2
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1)).Take(pageSize);
            return record.Any() ? record : null;
        }

        /// <summary>
        /// 车辆年检
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_4_3_3> LoadCarAnnualCheck(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_3_3
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1)).Take(pageSize);
            return record.Any() ? record : null;
        }

        /// <summary>
        /// 驾校培训
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_4_3_5> LoadCarSchool(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_4_3_5
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1)).Take(pageSize);
            return record.Any() ? record : null;
        }

    }
}
