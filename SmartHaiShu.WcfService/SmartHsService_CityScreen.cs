using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.CityScreenServices;
using SmartHaiShu.CityScreenServices.PriceService;
using SmartHaiShu.Utility;


namespace SmartHaiShu.WcfService
{
    public partial class SmartHsService
    {
        protected NewsQuery _newsQueryService = new NewsQuery();
        protected PriceQuery _priceQueryService = new PriceQuery();

        /// <summary>
        ///     今天天气情况
        /// </summary>
        /// <returns></returns>
        public string WeatherInfoToday()
        {
            try
            {
                var result = new WeatherQuery().QueryToday();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        ///     未来天气情况
        /// </summary>
        /// <returns></returns>
        public string WeatherInfoFuture()
        {
            try
            {
                var result = new WeatherQuery().QueryFurther();

                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        ///     社保查询
        /// </summary>
        /// <param name="cardId">账户/身份证</param>
        /// <param name="pwd">查询密码</param>
        /// <returns></returns>
        public string SocialInsureQuery(string cardId, string pwd)
        {
            try
            {
                var result = new SocialInsureQuery().Query(cardId, pwd);
                return new ResultFormat(result == null || !result.Any() ? 0: 1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        ///     违章查询验证码图片
        /// </summary>
        /// <returns></returns>
        public byte[] GetTrafficCodeImg()
        {
            try
            {
                var result = new TrafficVioQuery().CodeImg();
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return null;
            }
        }

        /// <summary>
        ///     违章记录查询
        /// </summary>
        /// <param name="no">车牌号</param>
        /// <param name="frameNo">车架号 后6位</param>
        /// <param name="type">车类型</param>
        /// <param name="vcode">验证码</param>
        /// <returns></returns>
        public string GetTrafficRecode(string no, string frameNo, string type, string vcode)
        {
            try
            {
                var result = new TrafficVioQuery().Query(no, frameNo, vcode, type);
                if (result == null)
                {
                    return new ResultFormat(0, "远程服务无响应，请至'公安交管信息网'查询").ToString();
                }
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        ///     惠生活讯息条数
        /// </summary>
        /// <returns></returns>
        public string GetFavorableNewsCount()
        {
            try
            {
                int result = _newsQueryService.FavorableNewsCount();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     惠生活讯息
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetFavorableNews(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.FavorableNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID,
                                 it.Contents
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     惠生活讯息(不包含内容)
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetFavorableNewsTitle(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.FavorableNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID,
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     教育信息条数
        /// </summary>
        /// <returns></returns>
        public string GetEducationNewsCount()
        {
            try
            {
                int result = _newsQueryService.EducationNewsCount();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     教育信息
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetEducationleNews(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.EducationNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID,
                                 it.Contents
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     教育信息(不包含内容)
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetEducationleNewsTitle(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.EducationNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     卫生信息条数
        /// </summary>
        /// <returns></returns>
        public string GetHealthNewsCount()
        {
            try
            {
                int result = _newsQueryService.HealthNewsCount();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     卫生信息
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetHealthNews(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.HealthNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID,
                                 it.Contents
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     卫生信息(不包含内容)
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetHealthNewsTitle(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.HealthNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     物价信息条数
        /// </summary>
        /// <returns></returns>
        public string GetPriceNewsCount()
        {
            try
            {
                int result = _newsQueryService.PriceNewsCount();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     物价信息
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetPriceeNews(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.PriceNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID,
                                 it.Contents
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     物价信息(不包含内容)
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetPriceeNewsTitle(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.PriceNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     出行信息条数
        /// </summary>
        /// <returns></returns>
        public string GetTripNewsCount()
        {
            try
            {
                int result = _newsQueryService.TripNewsCount();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     出行信息
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetTripNews(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.TripNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID,
                                 it.Contents
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     出行信息（不包含内容）
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetTripNewsTitle(int pageSize, int pageNo)
        {
            try
            {
                var full = _newsQueryService.TripNews(pageSize, pageNo);
                var result = from it in full
                             select new
                             {
                                 it.AutoID,
                                 it.Title,
                                 it.Publisher,
                                 it.LastModifyTime,
                                 it.IsValid,
                                 it.Hot,
                                 it.DataType,
                                 it.DataSource,
                                 it.Checker,
                                 it.Checked,
                                 it.CheckMemo,
                                 it.CategoryID
                             };
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 获取所有物品名称
        /// </summary>
        /// <returns></returns>
        public string GetAllFoods()
        {
            try
            {
                var foods = _priceQueryService.QueryAllFoods();
                return new ResultFormat(1, from it in foods select new {Name = it.Key, Category = it.Value}).ToString();
            }
            catch (Exception ex)
            {

                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }


        /// <summary>
        /// 获取所有物品分类
        /// </summary>
        /// <returns></returns>
        public string GetAllFoodCategories()
        {
            try
            {
                var categories = _priceQueryService.QueryAllCategorys();
                return new ResultFormat(1, categories).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 获取所有监控点
        /// </summary>
        /// <returns></returns>
        public string GetAllMonitorSites()
        {
            try
            {
                var sites = _priceQueryService.QueryAllMonitorSites();
                return new ResultFormat(1, sites).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 根据分类获取食品
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public string FilterFoodsByCategory(string category)
        {
            try
            {
                var result = _priceQueryService.QueryFoodsByCategory(category);
                return new ResultFormat(1, result.Select(it => it.Key)).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 根据条件查看物价条数
        /// </summary>
        /// <param name="category">物品分类</param>
        /// <param name="foodname">物品名称</param>
        /// <param name="site">监控点</param>
        /// <returns></returns>
        public string GetFoodMonitorCount(string category, string foodname, string site)
        {
            try
            {
                FoodMonitor entity = new FoodMonitor {Category = category, FoodName = foodname, SiteName = site};
                var count = _priceQueryService.QueryMonitorsCountBy(entity);
                return new ResultFormat(1, count).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 根据条件查看物价条数
        /// </summary>
        /// <param name="category">物品分类</param>
        /// <param name="foodname">物品名称</param>
        /// <param name="site">监控点</param>
        /// <param name="pageSize"></param>
        /// <param name="pageNo"></param>
        /// <returns></returns>
        public string GetFoodMonitorsByPage(string category, string foodname, string site, int pageSize, int pageNo)
        {
            try
            {
                FoodMonitor entity = new FoodMonitor {Category = category, FoodName = foodname, SiteName = site};
                var count = _priceQueryService.QueryFoodMonitorsByPage(entity, pageSize,pageNo);
                return new ResultFormat(1, count).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }
    }
}