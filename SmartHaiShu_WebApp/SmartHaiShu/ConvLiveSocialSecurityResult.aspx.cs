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
    public partial class ConvLiveSocialSecurityResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var user = Request.QueryString["user"];
                var pwd = Request.QueryString["pwd"];

                if (user.Trim().Length > 0 && pwd.Trim().Length > 0)
                {
                    HSSmartDataService.SmartHsServiceClient service = new SmartHsServiceClient();
                    var json = service.SocialInsureQuery(user, pwd);
                    if (json.JObjCodeTrue())
                    {
                        Repeater1.DataSource = from item in json.JObjMessageToken()
                                               select item;
                        Repeater1.DataBind();
                        
                    }
                }

            }
        }
    }
}