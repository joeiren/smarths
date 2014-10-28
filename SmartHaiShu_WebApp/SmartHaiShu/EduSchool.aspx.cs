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
    public partial class EduSchool : Page
    {
        protected const int PageListNumber = 5;
        private const int PageSize = 10;
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
            string json = _serviceClient.GetPrimarySchoolCount();

            if (json.JObjCodeTrue() && json.JobjMessageConvert <int>() > 0)
            {
                TotalCount = json.JobjMessageConvert <int>();
                TotalPage = TotalCount/PageSize + (TotalCount%PageSize == 0 ? 0 : 1);
                json = _serviceClient.GetPrimarySchool(PageNo, PageSize);
                if (json.JObjCodeTrue())
                {
                    var source = from it in json.JObjMessageToken()
                                 select new
                                 {
                                     Name = it["Name"].ValueOrDefault <string>(),
                                     Address = it["Address"].ValueOrDefault <string>(),
                                     Type = it["Type"].ValueOrDefault <string>(),
                                     WorkTime = it["WorkTime"].ValueOrDefault <string>(),
                                     TelContacts = it["TelContacts"].ValueOrDefault <string>(),
                                     ComplaintTel = it["ComplaintTel"].ValueOrDefault <string>(),
                                     Seat = it["Seat"].ValueOrDefault <string>(),
                                     WebSite = it["WebSite"].ValueOrDefault <string>(),
                                     Introduction = it["Introduction"].ValueOrDefault <string>(),
                                 };

                    RepeaterPrimary.DataSource = source;
                    RepeaterPrimary.DataBind();
                }
            }
            Page.ClientScript.RegisterStartupScript(GetType(), "pageNoSelector",
                "<script language='javascript'>pageNoSelector(" + PageNo + "," + TotalPage +
                    ");</script>");
        }
    }
}