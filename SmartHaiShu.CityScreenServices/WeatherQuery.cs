using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net.Repository.Hierarchy;
using Newtonsoft.Json.Linq;
using SmartHaiShu.Utility;


namespace SmartHaiShu.CityScreenServices
{
    public class WeatherQuery
    {
        public IEnumerable<JToken> QueryToday()
        {

            try
            {
                WeatherjhService.WeatherjhService service = new WeatherjhService.WeatherjhService();
                var result = service.GetWeather("101210401");
                var jobj = result.JObjParse();
                if (jobj["resultcode"].ValueOrDefault<string>() == "200")
                {
                    return jobj["result"]["today"];
                }
                return null;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return null;
            }
        }

        public IEnumerable <JToken> QueryFurther()
        {
            try
            {
                WeatherjhService.WeatherjhService service = new WeatherjhService.WeatherjhService();
                var result = service.GetWeather("101210401");
                var jobj = result.JObjParse();
                if (jobj["resultcode"].ValueOrDefault<string>() == "200")
                {
                    return jobj["result"]["future"];
                }
                return null;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return null;
            }
        }
    }
}
