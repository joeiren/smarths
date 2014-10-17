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
    public partial class TripFlight : Page
    {
        protected const int PageListNumber = 5;
        private const int PageSize = 20;
        private readonly OpenDataServiceClient _serviceClient = new OpenDataServiceClient();

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

        protected int Page1
        {
            get;
            set;
        }

        //protected int ExportTotalCount
        //{
        //    get;
        //    set;
        //}

        //protected int ExportTotalPage
        //{
        //    get;
        //    set;
        //}

        //protected int ImportTotalCount
        //{
        //    get;
        //    set;
        //}

        //protected int ImportTotalPage
        //{
        //    get;
        //    set;
        //}
        //public int ImportPageNo
        //{
        //    get;
        //    set;
        //}

        //public int ExportPageNo
        //{
        //    get;
        //    set;
        //}

        //public int ImportPage1
        //{
        //    get;
        //    set;
        //}

        //public int ExportPage1
        //{
        //    get;
        //    set;
        //}

        protected int Import
        {
            get;
            set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool imp = Request.QueryString["Import"] != null && Convert.ToBoolean(Request.QueryString["Import"]);
                Import = imp ? 1 : 0;

                if (Request.QueryString["Next"] != null)
                {
                }
                if (Request.QueryString["PageNo"] != null)
                {
                    int page = Convert.ToInt32(Request.QueryString["PageNo"]);
                    PageNo = Math.Max(page, 1);
                }
                else
                {
                    PageNo = 1;
                }
                if (Request.QueryString["Next"] != null)
                {
                    bool? next = Convert.ToBoolean(Request.QueryString["Next"]);
                    PageNo = next.Value ? PageNo + 1 : Math.Max(1, PageNo - 1);
                }
                Page1 = (Math.Max(PageNo, 1) - 1)/PageListNumber*PageListNumber + 1;
            }
            else
            {
                Page1 = 1;
            }
            var isImport = Import == 1;
            string json = _serviceClient.GetFlightCount(isImport);
            
            if (json.JObjCodeTrue() && json.JobjMessageConvert <int>() > 0)
            {
                TotalCount = json.JobjMessageConvert <int>();
                TotalPage = TotalCount/PageSize + (TotalCount%PageSize == 0 ? 0 : 1);
                json = _serviceClient.GetFlights(isImport, PageNo, PageSize);
                if (json.JObjCodeTrue())
                {
                   var source = from it in json.JObjMessageToken()
                                                select new
                                                {
                                                    Address = it["Address"].ValueOrDefault <string>(),
                                                    Approach = it["Approach"].ValueOrDefault <string>(),
                                                    Flight = it["Flight"].ValueOrDefault <string>(),
                                                    DateLimit = it["DateLimit"].ValueOrDefault <string>()
                                                };
                    if (isImport)
                    {
                        RepeaterImport.DataSource = source;
                        RepeaterImport.DataBind();
                    }
                    else
                    {
                        RepeaterExport.DataSource = source;
                        RepeaterExport.DataBind();
                    }
                }
            }
           

            Page.ClientScript.RegisterStartupScript(GetType(), "pageNoSelector",
                "<script language='javascript'>pageNoSelector(" + Import + "," + PageNo + "," + TotalPage +
                    ");</script>");
        }
    }
}