using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSOpenDataService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class EduHospital : System.Web.UI.Page
    {
        private const int PageListNumber = 5;
        private const int PageSize = 10;
        private List<Tuple<int, string>> _routeList = new List<Tuple<int, string>>();
        private HSOpenDataService.OpenDataServiceClient _openDataService = new OpenDataServiceClient();

        public int PageNo
        {
            get;
            set;
        }

        public int Page1
        {
            get;
            set;
        }

        public string PageRef
        {
            get;
            set;
        }

        public int Count
        {
            get;
            set;
        }

        public int TotalPage
        {
            get;
            set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Next"] != null)
                {
                }
                if (Request.QueryString["PageNo"] != null)
                {
                    int page = Convert.ToInt32(Request.QueryString["PageNo"]);
                    PageNo = page;
                }
                else
                {
                    PageNo = Math.Max(1, PageNo);
                }
                if (Request.QueryString["Next"] != null)
                {
                    bool? next = Convert.ToBoolean(Request.QueryString["Next"]);
                    PageNo = next.Value ? PageNo + 1 : Math.Max(1, PageNo - 1);
                }
            }
            else
            {
                Page1 = 1;
            }
            BindPageData();
            Page.ClientScript.RegisterStartupScript(GetType(), "pageNoSelector",
                "<script language='javascript'>pageNoSelector(" + PageNo + "," + TotalPage + ");</script>");
        }

        private void BindPageData()
        {
            
            var json = _openDataService.GetHospitalInfoCount();
            if (json.JObjCodeTrue())
            {
                Count = json.JobjMessageConvert <int>();
                TotalPage = Count / PageSize + (Count % PageSize == 0 ? 0 : 1);
                Page1 = (Math.Max(PageNo, 1) - 1) / PageListNumber * PageListNumber + 1;
                if (Count > 0)
                {
                    var info = _openDataService.GetHospitalInfoByPage(PageSize, PageNo);
                    Repeater1.DataSource = from it in info.JObjMessageToken()
                                           select new
                                           {
                                               Name = it["Name"].ValueOrDefault<string>(),
                                               Type = it["Type"].ValueOrDefault<string>(),
                                               Level = it["Level"].ValueOrDefault<string>(),
                                               Address = it["Address"].ValueOrDefault<string>(),
                                               Tel = it["Tel"].ValueOrDefault<string>(),
                                               Bus = it["Bus"].ValueOrDefault<string>(),
                                               Content = it["Content"].ValueOrDefault<string>(),
                                               
                                           };
                    Repeater1.DataBind();
                }
            }
            
            
        }
    }
}