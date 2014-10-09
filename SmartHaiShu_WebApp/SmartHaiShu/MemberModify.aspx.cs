using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using SmartHaiShu_WebApp.HSSmartDataService;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class MemberModify : System.Web.UI.Page
    {
        protected string UserName 
        {
            get { return Convert.ToString(HttpContext.Current.Session["UserName"]); }
        }

        protected long SessionVerifyId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Create"] != null &&
                    Request.QueryString["User"] != null &&
                    Request.QueryString["Code"] != null)
                {
                    var ticks = Convert.ToInt64(Request.QueryString["Create"]);
                    var key = Convert.ToString(Request.QueryString["User"]);
                    var code = Convert.ToString(Request.QueryString["Code"]);

                    SmartHsServiceClient serviceClient = new SmartHsServiceClient();
                    var result = serviceClient.CanUseSession(ticks, key, code);
                    var jobj = JObject.Parse(result);
                    if (jobj["Code"].Value<string>() != "1")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toIndex",
                            "<script language='javascript'>invalidRequest();</script>");
                    }
                    else
                    {
                        SessionVerifyId = Convert.ToInt64(jobj["Message"]);
                        this.txtUser.Text = key;
                        this.txtUser.ReadOnly = true;
                    }
                }
                else
                {
                    if (string.IsNullOrEmpty(UserName))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "signinFirst",
                            "<script language='javascript'>signinFirst();</script>");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "showInputCurrPwd",
                            "<script language='javascript'>showInputCurrPwd();</script>");
                        this.txtUser.Text = UserName;
                        this.txtUser.ReadOnly = true;
                    }
                }
            }
        }
    }
}