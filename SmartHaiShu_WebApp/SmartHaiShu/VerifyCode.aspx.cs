using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class VerifyCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string validateNum = RefreshVerfiyCode();
                Session["VerifyCode"] = validateNum;
            }
        }

        public static string RefreshVerfiyCode()
        {
            try
            {
                string verificationCode = AuthCodeSecurity.CreateVerificationText(6);
                Bitmap _img = AuthCodeSecurity.CreateVerificationImage(verificationCode, 160, 30);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();

                //将图像保存到指定流
                _img.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
                HttpContext.Current.Response.ClearContent();
                HttpContext.Current.Response.ContentType = "image/Gif";
                HttpContext.Current.Response.BinaryWrite(ms.ToArray());
                //_img.Save(HttpContext.Current.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                return verificationCode;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
}