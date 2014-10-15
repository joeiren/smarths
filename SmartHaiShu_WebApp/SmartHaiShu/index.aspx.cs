using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSOpenDataService;
using SmartHaiShu_WebApp.HSSmartDataService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class Index2 : Page
    {
        private readonly OpenDataServiceClient _openDataServiceClient = new OpenDataServiceClient();
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
                                              Title = item["Title"].ValueOrDefault <string>(),
                                              Keyword = item["Keyword"].ValueOrDefault <string>(),
                                              Id = item["Id"].ValueOrDefault <string>(),
                                              ReleaseTime = item["ReleaseTime"].ValueOrDefault <string>(),
                                              DateSpan = item["DateSpan"].ValueOrDefault <string>(),
                                          };
                
                
            }
            RepeaterPost.DataBind();
            SchoolBinding();
            KindergartenBinding();
            BankBinding();
            MarketBinding();
        }

        private void SchoolBinding()
        {
            string json = _openDataServiceClient.GetPrimarySchoolCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert<int>() > 0)
            {
                json = _openDataServiceClient.GetPrimarySchool(1, 5);
                RepeaterScholl.DataSource = from item in json.JObjMessageToken()
                                          select new
                                          {
                                              Name = item["Name"].ValueOrDefault<string>(),
                                              Address = item["Address"].ValueOrDefault<string>(),
                                              Type = item["Type"].ValueOrDefault<string>(),
                                          };
                RepeaterScholl.DataBind();
            }
        }

        private void KindergartenBinding()
        {
            string json = _openDataServiceClient.GetChildSchoolCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert<int>() > 0)
            {
                json = _openDataServiceClient.GetChildSchool(1, 5);
                RepeaterKindergarten.DataSource = from item in json.JObjMessageToken()
                                          select new
                                          {
                                              Name = item["Name"].ValueOrDefault<string>(),
                                              Address = item["Address"].ValueOrDefault<string>(),
                                              //Type = item["Type"].ValueOrDefault<string>(),
                                          };
                RepeaterKindergarten.DataBind();
            }
            
        }

        private void BankBinding()
        {
            string json = _openDataServiceClient.GetBankLocationCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert<int>() > 0)
            {
                json = _openDataServiceClient.GetBankLocation(1, 5);
                RepeaterBank.DataSource = from item in json.JObjMessageToken()
                                                  select new
                                                  {
                                                      Name = item["Name"].ValueOrDefault<string>(),
                                                      Address = item["Address"].ValueOrDefault<string>(),
                                                      //Type = item["Type"].ValueOrDefault<string>(),
                                                  };
                RepeaterBank.DataBind();
            }
        }

        private void MarketBinding()
        {
            string json = _openDataServiceClient.GetMarketCount();
            if (json.JObjCodeTrue() && json.JobjMessageConvert<int>() > 0)
            {
                json = _openDataServiceClient.GetMarket(1, 5);
                RepeaterMarket.DataSource = from item in json.JObjMessageToken()
                                                  select new
                                                  {
                                                      Name = item["Name"].ValueOrDefault<string>(),
                                                      Address = item["Address"].ValueOrDefault<string>(),
                                                      //Type = item["Type"].ValueOrDefault<string>(),
                                                  };
                RepeaterMarket.DataBind();
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
}