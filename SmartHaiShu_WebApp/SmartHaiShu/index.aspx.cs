using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSOpenDataService;
using SmartHaiShu_WebApp.HSSmartDataService;
using SmartHaiShu_WebApp.SmartHaiShu.CityScreenService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class index : Page
    {
        private readonly OpenDataServiceClient _openDataServiceClient = new OpenDataServiceClient();
        private readonly NewsQuery _query = new NewsQuery();
        private readonly SmartHsServiceClient _smartHsServiceClient = new SmartHsServiceClient();

        public ElectricNotic Notice1
        {
            get;
            private set;
        }

        public WaterNotice Notice2
        {
            get;
            private set;
        }

        public int TripCount
        {
            get;
            set;
        }

        public int FoodCount
        {
            get;
            set;
        }

        public int FavorableCount
        {
            get;
            set;
        }

        public int EducationCount
        {
            get;
            set;
        }

        public int HealthCount
        {
            get;
            set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string json = _openDataServiceClient.GetElectricNoticeCount();
                int count = json.JobjMessageConvert <int>();
                if (json.JObjCodeTrue() && count > 0)
                {
                    string jsonResult = _openDataServiceClient.GetElectricNotice(1, 1);
                    var result = jsonResult.JObjMessageToken().FirstOrDefault();
                    if (result != null)
                    {
                        Notice1 = new ElectricNotic
                        {
                            Time = result.Value <string>("BLACKOUT"),
                            Range = result.Value <string>("RANGE1"),
                            Line = result.Value <string>("LINE"),
                            ReleaseTime = DateTime.Parse(result.Value <string>("RELEASE_TIME"))
                        };
                    }
                }

                json = _openDataServiceClient.GetWaterNoticeCount();
                count = json.JobjMessageConvert <int>();
                if (json.JObjCodeTrue() && count > 0)
                {
                    string jsonResult = _openDataServiceClient.GetWaterNotice(1, 1);
                    var result = jsonResult.JObjMessageToken().FirstOrDefault();
                    if (result != null)
                    {
                        Notice2 = new WaterNotice
                        {
                            Time =
                                string.Format("{0} — {1}",
                                    DateTime.Parse(result.Value <string>("StartTime")).ToString("yyyy-MM-dd HH:mm"),
                                    DateTime.Parse(result.Value <string>("EndTime")).ToString("yyyy-MM-dd HH:mm")),
                            Range = result.Value <string>("Range"),
                            Reason = result.Value <string>("Reason"),
                            ReleaseTime = DateTime.Parse(result.Value <string>("ReleaseTime"))
                        };
                    }
                    //Notice += openDataServiceClient.GetWaterNotice(1,1);
                }

                PostBinding();
            }
        }

        private void PostBinding()
        {
            string json = _smartHsServiceClient.GetPostCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert <int>() > 0)
            {
                json = _smartHsServiceClient.GetPostTitlesByPage(1, 5);
                RepeaterPost.DataSource = from item in json.JObjMessageToken()
                                          select new
                                          {
                                              Title =
                                                  new string(
                                                      item["Title"].ValueOrDefault <string>().ToCharArray().Take(30)
                                                                   .ToArray()),
                                              Keyword = item["Keyword"].ValueOrDefault <string>(),
                                              Id = item["Id"].ValueOrDefault <string>(),
                                              ReleaseTime = item["ReleaseTime"].ValueOrDefault <string>(),
                                              DateSpan = item["DateSpan"].ValueOrDefault <string>(),
                                          };
            }
            RepeaterPost.DataBind();
            FoodPriceBinding();
            SchoolBinding();
            KindergartenBinding();
            BankBinding();
            MarketBinding();
            TripInfoBinding();
            FoodInfoBinding();
            FavorableBinding();
            EducationBinding();
            HealthBinding();
        }

        private void SchoolBinding()
        {
            string json = _openDataServiceClient.GetPrimarySchoolCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert <int>() > 0)
            {
                json = _openDataServiceClient.GetPrimarySchool(1, 5);
                RepeaterScholl.DataSource = from item in json.JObjMessageToken()
                                            select new
                                            {
                                                Name = item["Name"].ValueOrDefault <string>(),
                                                Address = item["Address"].ValueOrDefault <string>(),
                                                Type = item["Type"].ValueOrDefault <string>(),
                                            };
                RepeaterScholl.DataBind();
            }
        }

        private void KindergartenBinding()
        {
            string json = _openDataServiceClient.GetChildSchoolCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert <int>() > 0)
            {
                json = _openDataServiceClient.GetChildSchool(1, 5);
                RepeaterKindergarten.DataSource = from item in json.JObjMessageToken()
                                                  select new
                                                  {
                                                      Name = item["Name"].ValueOrDefault <string>(),
                                                      Address = item["Address"].ValueOrDefault <string>(),
                                                      //Type = item["Type"].ValueOrDefault<string>(),
                                                  };
                RepeaterKindergarten.DataBind();
            }
        }

        private void BankBinding()
        {
            string json = _openDataServiceClient.GetBankLocationCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert <int>() > 0)
            {
                json = _openDataServiceClient.GetBankLocation(1, 5);
                RepeaterBank.DataSource = from item in json.JObjMessageToken()
                                          select new
                                          {
                                              Name = item["Name"].ValueOrDefault <string>(),
                                              Address = item["Address"].ValueOrDefault <string>(),
                                              //Type = item["Type"].ValueOrDefault<string>(),
                                          };
                RepeaterBank.DataBind();
            }
        }

        private void MarketBinding()
        {
            string json = _openDataServiceClient.GetMarketCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert <int>() > 0)
            {
                json = _openDataServiceClient.GetMarket(1, 5);
                RepeaterMarket.DataSource = from item in json.JObjMessageToken()
                                            select new
                                            {
                                                Name = item["Name"].ValueOrDefault <string>(),
                                                Address = item["Address"].ValueOrDefault <string>(),
                                                //Type = item["Type"].ValueOrDefault<string>(),
                                            };
                RepeaterMarket.DataBind();
            }
        }

        private void FoodPriceBinding()
        {
            var query = new PriceQuery();
            string json = query.GetFoodMonitorCount("蔬菜", null, null);
            var source = new List <FoodPriceVo>();
            int count = 0;
            if (json.JObjCodeTrue())
            {
                count = json.JobjMessageConvert <int>();
                if (count > 0)
                {
                    json = query.GetFoodMonitorsByPage("蔬菜", null, null, 1, 1);

                    var food1 = (from item in json.JObjMessageToken()
                                 select new FoodPriceVo
                                 {
                                     Category = "蔬菜",
                                     Food = item["FoodName"].ValueOrDefault <string>(),
                                     Price = item["Price"].ValueOrDefault <string>(),
                                     Unit = item["Unit"].ValueOrDefault <string>(),
                                     Site = item["SiteName"].ValueOrDefault <string>(),
                                     Count = count
                                 }).FirstOrDefault();
                    source.Add(food1);
                }
            }

            json = query.GetFoodMonitorCount("肉", null, null);

            if (json.JObjCodeTrue())
            {
                count = json.JobjMessageConvert <int>();
                if (count > 0)
                {
                    json = query.GetFoodMonitorsByPage("肉", null, null, 1, 1);
                    var food1 = (from item in json.JObjMessageToken()
                                 select new FoodPriceVo
                                 {
                                     Category = "肉",
                                     Food = item["FoodName"].ValueOrDefault <string>(),
                                     Price = item["Price"].ValueOrDefault <string>(),
                                     Unit = item["Unit"].ValueOrDefault <string>(),
                                     Site = item["SiteName"].ValueOrDefault <string>(),
                                     Count = count
                                 }).FirstOrDefault();
                    source.Add(food1);
                }
            }
            json = query.GetFoodMonitorCount("鱼", null, null);

            if (json.JObjCodeTrue())
            {
                count = json.JobjMessageConvert <int>();
                if (count > 0)
                {
                    json = query.GetFoodMonitorsByPage("鱼", null, null, 1, 1);
                    var food1 = (from item in json.JObjMessageToken()
                                 select new FoodPriceVo
                                 {
                                     Category = "鱼",
                                     Food = item["FoodName"].ValueOrDefault <string>(),
                                     Price = item["Price"].ValueOrDefault <string>(),
                                     Unit = item["Unit"].ValueOrDefault <string>(),
                                     Site = item["SiteName"].ValueOrDefault <string>(),
                                     Count = count
                                 }).FirstOrDefault();
                    source.Add(food1);
                }
            }

            json = query.GetFoodMonitorCount("蛋", null, null);

            if (json.JObjCodeTrue())
            {
                count = json.JobjMessageConvert <int>();
                if (count > 0)
                {
                    json = query.GetFoodMonitorsByPage("蛋", null, null, 1, 1);
                    var food1 = (from item in json.JObjMessageToken()
                                 select new FoodPriceVo
                                 {
                                     Category = "蛋",
                                     Food = item["FoodName"].ValueOrDefault <string>(),
                                     Price = item["Price"].ValueOrDefault <string>(),
                                     Unit = item["Unit"].ValueOrDefault <string>(),
                                     Site = item["SiteName"].ValueOrDefault <string>(),
                                     Count = count
                                 }).FirstOrDefault();
                    source.Add(food1);
                }
            }
            json = query.GetFoodMonitorCount("水果", null, null);

            if (json.JObjCodeTrue() && count > 0)
            {
                count = json.JobjMessageConvert <int>();
                if (count > 0)
                {
                    json = query.GetFoodMonitorsByPage("水果", null, null, 1, 1);
                    var food1 = (from item in json.JObjMessageToken()
                                 select new FoodPriceVo
                                 {
                                     Category = "水果",
                                     Food = item["FoodName"].ValueOrDefault <string>(),
                                     Price = item["Price"].ValueOrDefault <string>(),
                                     Unit = item["Unit"].ValueOrDefault <string>(),
                                     Site = item["SiteName"].ValueOrDefault <string>(),
                                     Count = count
                                 }).FirstOrDefault();
                    source.Add(food1);
                }
            }

            RepeaterFood.DataSource = source;
            RepeaterFood.DataBind();
        }

        private void TripInfoBinding()
        {
            TripCount = _query.TripNewsCount();
            if (TripCount > 0)
            {
                var trips = _query.TripNews(5, 1);
                RepeaterTrip.DataSource = from it in trips
                                          select new {it.Title};
                RepeaterTrip.DataBind();
            }
        }

        private void FoodInfoBinding()
        {
            FoodCount = _query.PriceNewsCount();
            if (TripCount > 0)
            {
                var prices = _query.PriceNews(5, 1);
                RepeaterFoodInfo.DataSource = from it in prices
                                              select new {it.Title};
                RepeaterFoodInfo.DataBind();
            }
        }

        private void FavorableBinding()
        {
            FavorableCount = _query.FavorableNewsCount();
            if (FavorableCount > 0)
            {
                var prices = _query.FavorableNews(5, 1);
                RepeaterFavorable.DataSource = from it in prices
                                               select new {it.Title};
                RepeaterFavorable.DataBind();
            }
        }

        private void EducationBinding()
        {
            EducationCount = _query.EducationNewsCount();
            if (FavorableCount > 0)
            {
                var education = _query.EducationNews(5, 1);
                RepeaterEducation.DataSource = from it in education
                                               select new {it.Title};
                RepeaterEducation.DataBind();
            }
        }

        private void HealthBinding()
        {
            HealthCount = _query.HealthNewsCount();
            if (FavorableCount > 0)
            {
                var health = _query.HealthNews(5, 1);
                RepeaterHealth.DataSource = from it in health
                                            select new {it.Title};
                RepeaterHealth.DataBind();
            }
        }
    }

    public class ElectricNotic
    {
        public string Time
        {
            get;
            set;
        }

        public string Range
        {
            get;
            set;
        }

        public string Line
        {
            get;
            set;
        }

        public DateTime ReleaseTime
        {
            get;
            set;
        }
    }

    public class WaterNotice
    {
        public string Time
        {
            get;
            set;
        }

        public string Range
        {
            get;
            set;
        }

        public string Reason
        {
            get;
            set;
        }

        public DateTime ReleaseTime
        {
            get;
            set;
        }
    }

    public class FoodPriceVo
    {
        public string Category
        {
            get;
            set;
        }

        public string Food
        {
            get;
            set;
        }

        public string Price
        {
            get;
            set;
        }

        public string Unit
        {
            get;
            set;
        }

        public string Site
        {
            get;
            set;
        }

        public int Count
        {
            get;
            set;
        }
    }
}