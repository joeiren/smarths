using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class ConvenienceLive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sub = Request.QueryString["toSub"];
            if (!string.IsNullOrWhiteSpace(sub))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "subClick",
                      "<script language='javascript'>menuClick($('#" + sub + "'));</script>");
            }
        }
    }
}