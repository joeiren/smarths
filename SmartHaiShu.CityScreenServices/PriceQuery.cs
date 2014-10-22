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
                var categ = client.GetCategorys();
                var tables = client.GetTableNames();
                var dd = client.GetMonitorSites();
                PriceService.FoodMonitor monitor = new FoodMonitor();
                monitor.FoodID = foods[0].Key;
                monitor.FoodName = foods[0].Value;
                var result = client.FindFoodMonitors(monitor, null, true, 10, 0);
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return ;
            }
            
        }
    }
}
