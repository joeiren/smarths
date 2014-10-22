using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSSmartDataService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class ConfirmCode4Traffic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HSSmartDataService.SmartHsServiceClient serviceClient = new SmartHsServiceClient();
                var img = serviceClient.GetTrafficCodeImg();
 
                HttpContext.Current.Response.ClearContent();
                HttpContext.Current.Response.ContentType = "image/Gif";
                HttpContext.Current.Response.BinaryWrite(img);
            }
        }
    }
}