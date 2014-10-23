using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.PriceService;
using SmartHaiShu.Utility;


namespace SmartHaiShu_WebApp.SmartHaiShu.CityScreenService
{
    public class PriceQuery
    {
        //public void Query()
        //{
        //    try
        //    {
        //        PriceService.PriceClient client = new PriceService.PriceClient();
        //        var foods = client.GetFoods();
        //        var rfoods = foods.Where(it => !string.IsNullOrEmpty(it.Value)).ToList();
        //        var foodNames = client.GetFoodName();
        //        var categ = client.GetCategorys();
        //        var tables = client.GetTableNames();
        //        var dd = client.GetMonitorSites();
        //        PriceService.FoodMonitor monitor = new FoodMonitor();
        //        monitor.FoodID = foods[0].Key;
        //        monitor.FoodName = foods[0].Value;
        //        var result = client.FindFoodMonitors(null, null, true, 50, 0);
        //    }
        //    catch (Exception ex)
        //    {
        //        LogHelper.GetInstance().Error(ex.ToString());
        //        return;
        //    }
        //}

        public IEnumerable<KeyValuePair<string, string>> QueryAllFoods()
        {
            PriceService.PriceClient client = new PriceClient();
            var foods = client.GetFoodName();
            return foods;
        }

        public string[] QueryAllCategorys()
        {
            PriceService.PriceClient client = new PriceClient();
            var categorys = client.GetCategorys();
            return categorys;
        }

        public IEnumerable<KeyValuePair<string, string>> QueryAllMonitorSites()
        {
            PriceService.PriceClient client = new PriceClient();
            var sites = client.GetMonitorSites();
            return sites;
        }

        public IEnumerable<KeyValuePair<string, string>> QueryFoodsByCategory(string category)
        {
            PriceService.PriceClient client = new PriceClient();
            var list = client.GetFoodName().Where(it => it.Value == category).ToList();
            return list;
        }

        public int QueryMonitorsCountBy(FoodMonitor entity)
        {
            PriceService.PriceClient client = new PriceClient();
            var count = client.GetFoodMonitorsCounts(entity);
            return count;
        }

        public IEnumerable<FoodMonitor> QueryFoodMonitorsByPage(FoodMonitor condition, int pageSize, int pageNo)
        {
            PriceService.PriceClient client = new PriceClient();
            var result = client.FindFoodMonitors(condition, "FoodName", true, 20, Math.Max(0, pageNo - 1));
            return result;
        }


        /// <summary>
        /// 获取所有物品名称
        /// </summary>
        /// <returns></returns>
        public string GetAllFoods()
        {
            try
            {
                var foods = QueryAllFoods();
                return new ResultFormat(1, from it in foods select new { Name = it.Key, Category = it.Value }).ToString();
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
                var categories = QueryAllCategorys();
                return new ResultFormat(1, from it in categories
                                               select new {Name=it}).ToString();
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
                var sites = QueryAllMonitorSites();
                return new ResultFormat(1, from it in sites
                                               select new {Id=it.Key, Name=it.Value}).ToString();
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
                var result = QueryFoodsByCategory(category);
                return new ResultFormat(1, result.Select(it => new {Name=it.Key})).ToString();
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
                FoodMonitor entity = new FoodMonitor { Category = category, FoodName = foodname, SiteName = site };
                var count = QueryMonitorsCountBy(entity);
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
                FoodMonitor entity = new FoodMonitor { Category = category, FoodName = foodname, SiteName = site };
                var result = QueryFoodMonitorsByPage(entity, pageSize, pageNo);
                var foods = from it in result
                            select new
                            {
                                it.AutoID,
                                Category = it.Category ?? "",
                                FoodName = it.FoodName??"",
                                Metrics = it.Metrics??"",
                                Price = it.Price == null ?"" : it.Price.Value.ToString(),
                                SiteName = it.SiteName??"",
                                Spec = it.Spec??"",
                                TableName = it.TableName??"",
                                Unit = it.Unit??"",
                                Uploadtime = it.Uploadtime != null ? it.Uploadtime.Value.ToString("yyyy-MM-dd") : ""
                            };
                return new ResultFormat(1, foods).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }
    }
}