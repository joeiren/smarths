using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json.Linq;
using SmartHaiShu_WebApp.HSSmartDataService;

namespace SmartHaiShu_WebApp.SmartHaiShu.Cache
{
    public class StaticData
    {
        private static Dictionary<int, string> _streeDictionary;
        public static Dictionary<int, string> StreetInfo
        {
            get
            {
                if (_streeDictionary == null || _streeDictionary.Count == 0)
                {
                    _streeDictionary = new Dictionary<int, string>();
                    var result = new SmartHsServiceClient().FindAllStreet();
                    var jObj = JObject.Parse(result);
                    if (Convert.ToInt32(jObj["Code"]) == 1)
                    {
                        foreach (var obj in from obj in jObj["Message"] select obj)
                        {
                            _streeDictionary.Add(Convert.ToInt32(obj["community_id"]), (string)obj["name"]);
                        }
                    }
                }
                return _streeDictionary;
            }
        }

        public static string HostAddress = "http://127.0.0.1:33999/SmartHaiShu/";

        
        public static string AdminMailAddress = "smarths_admin@163.com";
        public static string AdminMailUser = "smarths_admin";
        public static string AdminMailAlias = "海曙智慧社区管理中心";
        public static string AdminMailPwd = "smartHS1@ndtv";
        public static string AdminSmtpServer = "smtp.163.com";
    }
}