using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu_WebApp.SmartHaiShu.CityScreenService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class LifeSpecial : Page
    {
        private const int PageListNumber = 5;
        private const int PageSize = 10;
        private List <Tuple <int, string>> _routeList = new List <Tuple <int, string>>();

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
            var query = new NewsQuery();
            Count = query.FavorableNewsCount();
            TotalPage = Count/PageSize + (Count%PageSize == 0 ? 0 : 1);
            Page1 = (Math.Max(PageNo, 1) - 1)/PageListNumber*PageListNumber + 1;
            if (Count > 0)
            {
                var info = query.FavorableNews(PageSize, PageNo);
                Repeater1.DataSource = from it in info
                                       select new
                                       {
                                           it.Title,
                                           it.Contents
                                       };
                Repeater1.DataBind();
            }
        }
    }
}