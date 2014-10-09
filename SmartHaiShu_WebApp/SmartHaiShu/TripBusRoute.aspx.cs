using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSOpenDataService;
using SmartHaiShu_WebApp.HSSmartDataService;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class BusRoute : System.Web.UI.Page
    {
        private List<Tuple<int, string>> _routeList = new List<Tuple<int, string>>();
        private const int PageListNumber = 5;
        private const int PageSize = 10;
        public int PageNo { get; set; }
        public int Page1 { get; set; }

        public string PageRef { get; set; }
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
                Page1 = (Math.Max(PageNo,1)-1)/PageListNumber * PageListNumber + 1;
            }
            else
            {
                Page1 = 1;
            }
            BindPageData();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "pageNoSelector",
                           "<script language='javascript'>pageNoSelector("+ PageNo+",16);</script>");
        }

        private void BindPageData()
        {
            OpenDataServiceClient serviceClient = new OpenDataServiceClient();
            var json = serviceClient.GetBusRouteList(PageNo, PageSize);
            var jobj = json.JObjParse();

            if (jobj["Code"].Value<int>() == 1)
            {
                Repeater1.DataSource = from jitem in jobj["Message"]
                                       let line = jitem["Line"].Value<string>()
                                       let index = line.IndexOf("站点：", System.StringComparison.Ordinal)
                                       let included = line.Substring(0, 20).Contains("单向")
                                       select new
                                       {
                                           Name = jitem["Name"],
                                           Line = line.Substring(index + 3),
                                           Single = included ? "单向" : "双向"
                                       };
                Repeater1.DataBind();
            }
        }
    }
}