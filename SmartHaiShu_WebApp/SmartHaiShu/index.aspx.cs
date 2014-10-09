using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSOpenDataService;
using SmartHaiShu_WebApp.HSSmartDataService;
using Newtonsoft.Json;
using SmartHaisuModel;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class index : System.Web.UI.Page
    {
        public ElectricNotic Notice1 { get; private set; }
        public WaterNotice Notice2 { get; private set; }
        private HSOpenDataService.OpenDataServiceClient openDataServiceClient = new OpenDataServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            //HSSmartDataService.SmartHsServiceClient service = new SmartHsServiceClient();
            //result = service.FindStreetGroup();
            ////var community = JsonConvert.DeserializeObject<community>(result);
            if (!IsPostBack)
            {
                var json = openDataServiceClient.GetElectricNoticeCount();
                var count = json.JobjMessageConvert<int>();
                if (json.JObjCodeTrue() && count >0)
                {
                    var jsonResult = openDataServiceClient.GetElectricNotice(1, 1);
                    var result = jsonResult.JObjMessageToken().FirstOrDefault();
                    if (result != null)
                    {
                        Notice1 = new ElectricNotic()
                        {
                            Time = result.Value<string>("BLACKOUT"),
                            Range = result.Value<string>("RANGE1"),
                            Line = result.Value<string>("LINE"),
                            ReleaseTime = DateTime.Parse(result.Value<string>("RELEASE_TIME"))
                        };
                    }
                }

                json = openDataServiceClient.GetWaterNoticeCount();
                count = json.JobjMessageConvert<int>();
                if (json.JObjCodeTrue() && count > 0)
                {
                    var jsonResult = openDataServiceClient.GetWaterNotice(1, 1);
                    var result = jsonResult.JObjMessageToken().FirstOrDefault();
                    if (result != null)
                    {
                        Notice2 = new WaterNotice()
                        {
                            Time = string.Format("{0} — {1}", DateTime.Parse(result.Value<string>("StartTime")).ToString("yyyy-MM-dd HH:mm"), DateTime.Parse(result.Value<string>("EndTime")).ToString("yyyy-MM-dd HH:mm")),
                            Range = result.Value<string>("Range"),
                            Reason = result.Value<string>("Reason"),
                            ReleaseTime = DateTime.Parse(result.Value<string>("ReleaseTime"))
                        };
                    }
                    //Notice += openDataServiceClient.GetWaterNotice(1,1);
                }
            }
        }


        
    }

    public class ElectricNotic
    {
        public string Time { get; set; }
        public string Range { get; set; }
        public string Line { get; set; }
        public DateTime ReleaseTime { get; set; }
    }

    public class WaterNotice
    {
        public string Time { get; set; }
        public string Range { get; set; }
        public string Reason { get; set; }
        public DateTime ReleaseTime { get; set; }
    }
}