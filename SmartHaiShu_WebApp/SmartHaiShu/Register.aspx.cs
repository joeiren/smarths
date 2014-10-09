using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SmartHaiShu_WebApp.HSSmartDataService;
using SmartHaisuModel;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class Register : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            //    string validateNum = RefreshVerfiyCode();
                
            //    Session["ValidateNum"] = validateNum;
            }
            else
            {
                //string message;
                //var result =OnRegister(out message);
                //ClientScript.RegisterStartupScript(this.GetType(), "show", "<script>alert('" + message + "'</script>");
            }
        }

        private int OnRegister(out string message)
        {   
            var user = this.txtUser.Text.Trim();
            var pwd1 = this.txtPwd1.Text;
            var pwd2 = this.txtPwd2.Text;
            var mail = this.txtMail.Text;
            var phone = this.txtPhone.Text;
            var verifyCode = this.txtVCode.Text;
            message = string.Empty;
            if (String.Compare(Convert.ToString(Session["VerifyCode"]),verifyCode, StringComparison.OrdinalIgnoreCase) != 0)
            {
                message = "验证码不正确";
                return -1;
            }
            if (user.Length < 6 || user.Length > 20)
            {
                message = "用户名长度不正确";
                return -1;
            }

            if (pwd1.Length < 6 || pwd1.Length > 24)
            {
                message = "密码1长度不正确";
                return -1;
            }

            if (pwd2.Length < 6 || pwd2.Length > 24)
            {
                message = "密码2长度不正确";
                return -1;
            }

            if (String.Compare(pwd1,pwd2, StringComparison.Ordinal) != 0)
            {
                message = "两次密码输入不一致";
                return -1;
            }

            var serviceClient = new SmartHsServiceClient();
            member memb = new member()
            {
                name = user,
                default_community = Convert.ToInt32(Request.Form["lstCommunity"]),
                mail = mail,
                phone = phone,
                member_key = pwd1
            };
            var json = serviceClient.AddMember(JsonConvert.SerializeObject(memb));
            var jObj = JObject.Parse(json);
            if (Convert.ToInt32(jObj["Code"]) == 1)
            {
                message = "注册成功";
                return 1;
            }
            else
            {
                message = Convert.ToString(jObj["Message"]);
                if (string.IsNullOrEmpty(message))
                {
                    message = "注册失败";
                }
            }

            return 0;
        }
    }
}