using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSSmartDataService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class TripRecordResult : System.Web.UI.Page
    {
        protected string Message
        {
            get;
            set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var carNo = Request.QueryString["no"];
                var carSeq = Request.QueryString["seq"];
                var type = Request.QueryString["typ"];
                var vcode = Request.QueryString["vcode"];

                HSSmartDataService.SmartHsServiceClient serviceClient = new SmartHsServiceClient();
                var result = serviceClient.GetTrafficRecode(carNo, carSeq, type, vcode);
                if (result.JObjCodeTrue())
                {
                    Repeater1.DataSource = from item in result.JObjMessageToken()
                                           select item;
                    Repeater1.DataBind();
                }
                else
                {
                    Message = result.JobjMessageConvert <string>();
                }
            }
        }
    }
}