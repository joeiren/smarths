using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.CityScreenServices.NewsService;
using SmartHaiShu.Utility;


namespace SmartHaiShu.CityScreenServices
{
    public class NewsQuery
    {
        public enum NewsCategory
        {
            ROOT = 1, //根目录
            FAVORABLE = 6, //惠生活
            EDUCATION = 7, //教育
            HEALTH = 10, //卫生
            FINANCIAL = 11, //金融理财
            INFO = 12, //	资讯
            PRICE = 19, //	物价
            GOVERNMENT = 20, //	阳光政务
            //21	营业厅
            TRIP = 22,//	交通
            //23	营业厅
            //24	看宁波
            //25	心理FM
        };

        /// <summary>
        ///     惠生活
        /// </summary>
        /// <returns></returns>
        public IEnumerable <NewsModel> FavorableNews(int pageSize, int pageNo)
        {
            return Query(pageSize, pageNo, (int) NewsCategory.FAVORABLE);
        }

        /// <summary>
        ///     惠生活信息数
        /// </summary>
        /// <returns></returns>
        public int FavorableNewsCount()
        {
            return Count((int)NewsCategory.FAVORABLE);
        }

        public IEnumerable <NewsModel> EducationNews(int pageSize, int pageNo)
        {
            return Query(pageSize, pageNo, (int)NewsCategory.EDUCATION);
        }

        public int EducationNewsCount()
        {
            return Count((int)NewsCategory.EDUCATION);
        }

        public IEnumerable<NewsModel> HealthNews(int pageSize, int pageNo)
        {
            return Query(pageSize, pageNo, (int)NewsCategory.HEALTH);
        }

        public int HealthNewsCount()
        {
            return Count((int)NewsCategory.HEALTH);
        }

        public IEnumerable<NewsModel> PriceNews(int pageSize, int pageNo)
        {
            return Query(pageSize, pageNo, (int)NewsCategory.PRICE);
        }

        public int PriceNewsCount()
        {
            return Count((int)NewsCategory.PRICE);
        }

        public IEnumerable<NewsModel> TripNews(int pageSize, int pageNo)
        {
            return Query(pageSize, pageNo, (int)NewsCategory.TRIP);
        }

        public int TripNewsCount()
        {
            return Count((int)NewsCategory.TRIP);
        }

        public IEnumerable <NewsModel> Query(int pageSize, int pageNo, int category)
        {
            try
            {
                var entity = new NewsModel {CategoryID = category};
                var client = new NewsClient();
                int count = client.GetNewssCounts(entity);
                var result = client.FindNewss(entity, "LastModifyTime", true, pageSize, Math.Max(0, pageNo - 1));
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return null;
            }
        }

        public int Count(int category)
        {
            try
            {
                var entity = new NewsModel {CategoryID = category};
                var client = new NewsClient();
                int count = client.GetNewssCounts(entity);
                return count;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return 0;
            }
        }
    }
}