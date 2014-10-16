using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu_WebApp.HSSmartDataService;
using SmartHaiShu.Utility;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class HomeInteractPost : System.Web.UI.Page
    {
        protected const int PageSize = 15;
        protected const int PageListNumber = 5;

        protected int TotalCount
        {
            get;
            set;
        }

        protected int TotalPage
        {
            get;
            set;
        }

        protected int PageNo
        {
            get;
            set;
        }

        public int Page1
        {
            get;
            set;
        }
        private SmartHsServiceClient _serviceClient = new SmartHsServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageNo = Convert.ToInt32(Request.QueryString["PageNo"]);
                PageNo = Math.Max(PageNo, 1);
                var json = _serviceClient.GetPostCount();

                if (json.JObjCodeTrue())
                {
                    TotalCount = json.JobjMessageConvert<int>();
                    if (TotalCount > 0)
                    {
                        json = _serviceClient.GetPostsByPage(PageNo, PageSize);
                        if (json.JObjCodeTrue())
                        {

                            RepeaterInteract.DataSource = from item in json.JObjMessageToken()
                                                        select new
                                                        {
                                                            Title = item["Title"].ValueOrDefault<string>(),
                                                            Keyword = item["Keyword"].ValueOrDefault<string>(),
                                                            Contact = item["Contact"].ValueOrDefault<string>(),
                                                            Id = item["Id"].ValueOrDefault<string>(),
                                                            ReleaseTime = item["ReleaseTime"].ValueOrDefault<string>(),
                                                            Content = item["Content"].ValueOrDefault<string>(),
                                                            Member = item["Member"].ValueOrDefault<string>(),
                                                            DateSpan = item["DateSpan"].ValueOrDefault<string>(),
                                                        };
                        }
                    }
                }
            }
            TotalPage = TotalCount / PageSize + (TotalCount % PageSize == 0 ? 0 : 1);
            Page1 = (Math.Max(PageNo, 1) - 1) / PageListNumber * PageListNumber + 1;
            RepeaterInteract.DataBind();

            Page.ClientScript.RegisterStartupScript(GetType(), "pageNoSelector",
                "<script language='javascript'>pageNoSelector(" + PageNo + "," + TotalPage + ");</script>");

        }

       
    }
}