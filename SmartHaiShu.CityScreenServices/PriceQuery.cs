using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.CityScreenServices.PriceService;
using SmartHaiShu.Utility;


namespace SmartHaiShu.CityScreenServices
{
    public class PriceQuery
    {

        public void Query()
        {
            try
            {
                PriceService.PriceClient client = new PriceClient();
                var foods = client.GetFoods();
                var rfoods = foods.Where(it => !string.IsNullOrEmpty(it.Value)).ToList();
                var foodNames = client.GetFoodName();
                var categ = client.GetCategorys();
                var tables = client.GetTableNames();
                var dd = client.GetMonitorSites();
                PriceService.FoodMonitor monitor = new FoodMonitor();
                monitor.FoodID = foods[0].Key;
                monitor.FoodName = foods[0].Value;
                var result = client.FindFoodMonitors(null, null, true, 50, 0);
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return ;
            }
        }


        public IEnumerable<KeyValuePair <string, string>> QueryAllFoods()
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

        public IEnumerable <KeyValuePair <string, string>> QueryFoodsByCategory(string category)
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

        public IEnumerable <FoodMonitor> QueryFoodMonitorsByPage(FoodMonitor condition, int pageSize, int pageNo)
        {
            PriceService.PriceClient client = new PriceClient();
            var result = client.FindFoodMonitors(condition, null, true, 20, Math.Max(0, pageNo-1));
            return result;
        }

        
    }
}
