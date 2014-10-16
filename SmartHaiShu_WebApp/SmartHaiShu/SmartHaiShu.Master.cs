using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

        public string StreetName
        {
            get;
            set;
        }

        public string CommunityName
        {
            get;
            protected set;
        }

        public long MemberId
        {
            get;
            set;
        }

        protected const string _testCommunity = "牡丹社区";

        HSSmartDataService.SmartHsServiceClient service0 = new SmartHsServiceClient();
        HSOpenDataService.OpenDataServiceClient service1 = new OpenDataServiceClient();
            
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (string.IsNullOrWhiteSpace(CurrentCommunity))
                {
                    StreetName = "南门街道";
                    CommunityName = "朝阳社区";
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

        
    }
}