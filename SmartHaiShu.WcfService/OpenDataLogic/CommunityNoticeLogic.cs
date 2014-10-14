using System;
using System.Collections.Generic;
using System.Linq;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    public class CommunityNoticeLogic
    {
        public b_t_ufp_3_2_1 LoadCommunityIntroduction(string community)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_1
                          where String.Compare(community, entity.COMMUNITY_NAME, System.StringComparison.OrdinalIgnoreCase) == 0
                          orderby entity.RELEASE_TIME descending
                          select entity).FirstOrDefault();
            return record;
        }

        public int LoadNoticeCount(string community)
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_2
                          where String.Compare(community, entity.COMMUNITY_NAME, System.StringComparison.OrdinalIgnoreCase) == 0                          
                          select entity).Count();
            return count;
        }

        public IEnumerable<b_t_ufp_3_2_2> LoadNotices(string community)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_2
                          where String.Compare(community, entity.COMMUNITY_NAME, System.StringComparison.OrdinalIgnoreCase) == 0
                          orderby entity.RELEASE_TIME descending
                          select entity).Take(10);
            return record.Any() ? record : null;
        }

        public IEnumerable<b_t_ufp_3_2_2> LoadNotices(string community, int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_2
                          where String.Compare(community, entity.COMMUNITY_NAME, System.StringComparison.OrdinalIgnoreCase) == 0
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize).ToList();
            return record;
        }

        public b_t_ufp_3_2_2 LoadSpecificNotice(string uuid)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_2
                          where String.Compare(uuid, entity.UUID, System.StringComparison.OrdinalIgnoreCase) == 0
                          orderby entity.RELEASE_TIME descending
                          select entity).FirstOrDefault();
            return record;
        }

        /// <summary>
        /// 社区风采条数
        /// </summary>
        /// <param name="community"></param>
        /// <returns></returns>
        public int LoadFCCount(string community)
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_5
                         where System.String.Compare(entity.COMMUNITY_NAME, community, StringComparison.Ordinal) == 0
                          select entity).Count();
            return count;
        }

        /// <summary>
        /// 社区风采
        /// </summary>
        /// <param name="community"></param>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_3_2_5> LoadFC(string community, int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_5
                          where String.Compare(community, entity.COMMUNITY_NAME, System.StringComparison.OrdinalIgnoreCase) == 0
                          orderby entity.RELEASE_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize).ToList();
            return record;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uuid"></param>
        /// <returns></returns>
        public b_t_ufp_3_2_5 LoadSpecificFC(string uuid)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_5
                          where String.Compare(uuid, entity.UUID, System.StringComparison.OrdinalIgnoreCase) == 0
                          orderby entity.RELEASE_TIME descending
                          select entity).FirstOrDefault();
            return record;
        }

        /// <summary>
        /// 停水通知条数
        /// </summary>
        /// <returns></returns>
        public int WaterNoticeCount()
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_3
                         select entity).Count();
            return count;
        }

        /// <summary>
        /// 获取停水通知
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_3_2_3> LoadWaterNotice(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_3
                          orderby entity.RELEASE_TIME descending, entity.CHECK_TIME descending
                          select entity).Skip(Math.Max(0,pageNo -1) * pageSize).Take(pageSize);
            return record;
        }

        /// <summary>
        /// 停电通知条数
        /// </summary>
        /// <returns></returns>
        public int ElectricNoticeCount()
        {
            var count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_4
                         select entity).Count();
            return count;
        }

        /// <summary>
        /// 获取停电通知
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<b_t_ufp_3_2_4> LoadElectricNotice(int pageNo, int pageSize)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_3_2_4
                          orderby entity.RELEASE_TIME descending, entity.CHECK_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize);
            return record;
        }
    }
}
