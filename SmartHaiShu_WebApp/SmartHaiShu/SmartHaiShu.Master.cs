using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSSmartDataService;
using SmartHaiShu_WebApp.HSOpenDataService;
using Newtonsoft.Json;
using SmartHaisuModel;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class SmartHaiShu : System.Web.UI.MasterPage
    {
        public String result;
        public String result_community;

        public string Today
        {
            get { return DateTime.Now.ToString("yyyy年MM月dd日"); }
        }

        private string _street;
        public string StreetName
        {
            get
            {
                return _street;
            }
            set
            {
                _street = value;
                HttpContext.Current.Session["SelectedStreet"] = value;
            }
        }

        private string _community;
        public string CommunityName
        {
            get
            {
                return _community;
            }
            protected set
            {
                _community = value;
                HttpContext.Current.Session["SelectedCommunity"] = value;
            }
        }

        public long MemberId
        {
            get;
            set;
        }

        protected const string _testCommunity = "牡丹社区";
        protected string _weatherInfo = "";

        HSSmartDataService.SmartHsServiceClient service0 = new SmartHsServiceClient();
        HSOpenDataService.OpenDataServiceClient service1 = new OpenDataServiceClient();
            
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (string.IsNullOrWhiteSpace(CurrentCommunity))
                {
                    StreetName = "白云街道";
                    CommunityName = "牡丹社区";
                    result = service0.FindStreetGroup();
                    result_community = service1.GetCommunityIntroduction(CommunityName);
                }
                else 
                {
                    //var selected = Request.QueryString["Selected"] ;
                    //var input = selected.Split(',');
                    //if (input.Length == 2)
                    {
                        //StreetName = input[0];
                        //CommunityName = input[1];
                        StreetName = CurrentStreet;
                        CommunityName = CurrentCommunity;
                        result = service0.FindStreetGroup();
                        result_community = service1.GetCommunityIntroduction(CommunityName);
                    }
                    
                }

                LoadWeather();
            }
        }

        public string CurrentCommunity
        {
            get
            {
                var comm = Convert.ToString(HttpContext.Current.Session["SelectedCommunity"]);
                return string.IsNullOrWhiteSpace(comm) ? CommunityName : comm;
            }
        }

        public string CurrentStreet
        {
            get
            {
                var street = Convert.ToString(HttpContext.Current.Session["SelectedStreet"]);
               return string.IsNullOrWhiteSpace(street) ? StreetName : street;
            }
            
        }

        private void LoadWeather()
        {
            var json = service0.WeatherInfoToday();
            if (json.JObjCodeTrue())
            {
                var today = DateTime.ParseExact( json.JObjMessageInner("date_y").ValueOrDefault<string>(), "yyyy年M月d日", null );
                if (today.Date == DateTime.Now.Date)
                {
                    _weatherInfo = string.Format("{0},{1},{2}。",
                        json.JObjMessageInner("weather").ValueOrDefault <string>(),
                        json.JObjMessageInner("temperature").ValueOrDefault <string>(),
                        json.JObjMessageInner("wind").ValueOrDefault <string>());
                }
                else
                {
                    json = service0.WeatherInfoFuture();
                    var future = (from item in json.JObjMessageToken()
                                  where
                                      DateTime.ParseExact(item["date"].ValueOrDefault<string>(), "yyyyMMdd", null).Date ==
                                          DateTime.Now.Date
                                  select item).FirstOrDefault() ?? json.JObjMessageToken().LastOrDefault();
                    if (future != null)
                    {
                        _weatherInfo = string.Format("{0},{1},{2}。", future["weather"].ValueOrDefault<string>(),
                            future["temperature"].ValueOrDefault<string>(),
                            future["wind"].ValueOrDefault<string>());
                    }
                }
                
            }

        }

        
    }
}