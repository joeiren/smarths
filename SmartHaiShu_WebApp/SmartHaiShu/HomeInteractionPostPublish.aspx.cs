using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSSmartDataService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class HomeInteractionPostPublish : Page
    {
        private readonly SmartHsServiceClient _serviceClient = new SmartHsServiceClient();
        private long _memberId;

        protected void Page_Load(object sender, EventArgs e)
        {
            var smartHaiShu = (SmartHaiShu) Master;
            if (smartHaiShu != null)
            {
                _memberId = smartHaiShu.MemberId;
            }
            if (!IsPostBack)
            {
                string json = _serviceClient.FindPostSpanTypeConfig();
                if (json.JObjCodeTrue())
                {
                    DropListDateSpan.DataSource = from item in json.JObjMessageToken()
                                                  select item;
                    DropListDateSpan.DataTextField = "Name";
                    DropListDateSpan.DataValueField = "Id";
                    DropListDateSpan.DataBind();
                }
            }
        }

        protected void PostCommintOnClick(object sender, EventArgs e)
        {
            string title = Convert.ToString(Request.Form["inputTitle"]);
            string keywords = Convert.ToString(Request.Form["inputKeyword"]);
            string content = Convert.ToString(Request.Form["inputContent"]);
            string contactInfo = Convert.ToString(Request.Form["contactInfo"]);
            int dateSpan = Convert.ToInt32(Request.Form["DropListDateSpan"]);
            string json = _serviceClient.AddInteractPost(title, content, keywords, contactInfo, dateSpan, _memberId);
            
            if (json.JObjCodeTrue())
            {
                Server.Transfer("HomeInteractPost.aspx", false);
            }
            else
            {
                string error = json.JobjMessageConvert <string>();
                LogHelper.GetInstance().Warn("PostCommintOnClick 失败：" + error);
                Page.ClientScript.RegisterStartupScript(GetType(), "postAddFail",
                    "<script language='javascript'>postAddFail("+error+");</script>");
            }
        }
    }
}