using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.Util;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSSmartDataService;
using SmartHaiShu_WebApp.SmartHaiShu.Cache;
using SmartHaisuModel;
using Telerik.Web.UI.com.hisoftware.api2;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class Register
    {
        private SmartHsServiceClient _clientService = new SmartHsServiceClient();

        [WebMethod]
        public static string LoadStreet()
        {
            try
            {
                var list = from street in StaticData.StreetInfo
                    select new {id = street.Key, name = street.Value};
                var json = JsonConvert.SerializeObject(list);
                return json;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }

        [WebMethod]
        public static string FindCommunities(int id)
        {
            try
            {
                var community = new SmartHsServiceClient().FindCommunityByStreet(id);
                var jObj = JObject.Parse(community);
                if (Convert.ToInt32(jObj["Code"]) == 1)
                {
                    var list = (from obj in jObj["Message"]
                        select new
                        {
                            id = Convert.ToInt32(obj["community_id"]),
                            name = (string) obj["name"]
                        });

                    var result = JsonConvert.SerializeObject(list);
                    return result;
                }
                return string.Empty;
            }

            catch (Exception)
            {
                return string.Empty;
            }
        }

        [WebMethod]
        public static string CheckUserName(string name)
        {
            try
            {
                var result = new SmartHsServiceClient().ExistMemberName(name);
                var jObj = JObject.Parse(result);
                if (Convert.ToInt32(jObj["Code"]) == 1)
                {
                    return Convert.ToInt32(!Convert.ToBoolean(jObj["Message"])).ToString();
                }
                return string.Empty;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }



        [WebMethod]
        public static string ValidateVerfiyCode(string input)
        {
            if (
                String.Compare(Convert.ToString(HttpContext.Current.Session["VerifyCode"]), input,
                    StringComparison.OrdinalIgnoreCase) == 0)
            {
                return "1";
            }
            return "0";
        }

        [WebMethod]
        public static string OnRegister(string user, string pwd1, string pwd2, int community, string vcode,
            string phone, string mail /**/)
        {
            string message = string.Empty;
            int code;
            if (
                String.Compare(Convert.ToString(HttpContext.Current.Session["VerifyCode"]), vcode,
                    StringComparison.OrdinalIgnoreCase) != 0)
            {
                message = "验证码不正确";
                code = 0;
                return JsonConvert.SerializeObject(new {Code = code, Message = message});
            }
            if (user.Length < 6 || user.Length > 20)
            {
                message = "用户名长度不正确";
                code = 0;
                return JsonConvert.SerializeObject(new {Code = code, Message = message});
            }

            if (pwd1.Length < 6 || pwd1.Length > 24)
            {
                message = "密码1长度不正确";
                code = 0;
                return JsonConvert.SerializeObject(new {Code = code, Message = message});
            }

            if (pwd2.Length < 6 || pwd2.Length > 24)
            {
                message = "密码2长度不正确";
                code = 0;
                return JsonConvert.SerializeObject(new {Code = code, Message = message});
            }

            if (String.Compare(pwd1, pwd2, StringComparison.Ordinal) != 0)
            {
                message = "两次密码输入不一致";
                code = 0;
                return JsonConvert.SerializeObject(new {Code = code, Message = message});
            }

            var serviceClient = new SmartHsServiceClient();
            member memb = new member()
            {
                name = user,
                default_community = community,
                mail = mail,
                phone = phone,
                member_key = pwd1
            };
            var json = serviceClient.AddMember(JsonConvert.SerializeObject(memb));
            var jObj = JObject.Parse(json);
            if (Convert.ToInt32(jObj["Code"]) == 1)
            {
                message = "注册成功";
                code = 1;
                return JsonConvert.SerializeObject(new {Code = code, Message = message});
            }
            else
            {
                message = Convert.ToString(jObj["Message"]);
                if (string.IsNullOrEmpty(message))
                {
                    message = "注册失败";
                }
                return JsonConvert.SerializeObject(new {Code = 0, Message = message});
            }
            //return "";
        }

        [WebMethod]
        public static string OnSignin(string user, string pwd, bool remember)
        {
            var serviceClient = new SmartHsServiceClient();

            var result = serviceClient.Login(user, pwd, GetRequestIp(), 1);
            var jObj = JObject.Parse(result);
            if (Convert.ToInt32(jObj["Code"]) == 1)
            {
                HttpContext.Current.Session["UserName"] = user;
                if (remember)
                {
                    var memberCookie = HttpContext.Current.Request.Cookies["CurrentMember"];
                    if (memberCookie == null || !memberCookie.Values["user"].Equals(user))
                    {
                        memberCookie = new HttpCookie("CurrentMember");
                        memberCookie.Values.Add("user", user);
                        memberCookie.Values.Add("pwd", SecurityEncryption.EncryptDefault(pwd));
                        memberCookie.Expires = DateTime.Now.AddDays(7);
                        HttpContext.Current.Response.Cookies.Add(memberCookie);
                    }
                }
            }
            return result;
        }


        [WebMethod]
        public static string OnApplyMemberKey(string user, string vcode)
        {
            int code = 0;
            string message;
            if (
                String.Compare(Convert.ToString(HttpContext.Current.Session["VerifyCode"]), vcode,
                    StringComparison.OrdinalIgnoreCase) != 0)
            {
                message = "验证码不正确";
                code = 0;
                return JsonConvert.SerializeObject(new {Code = code, Message = message});
            }

            var serviceClient = new SmartHsServiceClient();
            var result = serviceClient.FindMemberByName(user);
            var jobj = JObject.Parse(result);
            if (Convert.ToInt32(jobj["Code"]) != 1)
            {
                message = "未找到该注册用户";
                code = 0;
                return JsonConvert.SerializeObject(new {Code = code, Message = message});
            }
            //发送邮件
            var mail = jobj["Message"]["mail"].Value<string>();
            var confirm = Guid.NewGuid().ToString();
            DateTime now = DateTime.Now;
            var sessionResult = serviceClient.AddSessionVerify(now.Ticks, user, confirm);
            jobj = JObject.Parse(sessionResult);
            if (Convert.ToInt32(jobj["Code"]) != 1)
            {
                message = "服务器生成验证url失败";
                code = 0;
                return JsonConvert.SerializeObject(new { Code = code, Message = message });
            }
            //var testmail = "wanggq@ndtv.com.cn";
            //bool success = SendModifyPwdEmail(user, testmail, now, confirm);
            bool success = SendModifyPwdEmail(user, mail, now, confirm);
            return JsonConvert.SerializeObject(new { Code = success?1:0,string.Empty });
        }

        [WebMethod]
        public static string ResetMemberKey(string user, string pwd1, string pwd2, string orignal, long session)
        {
            if (String.CompareOrdinal(pwd1, pwd2) != 0)
            {
                return JsonConvert.SerializeObject(new { Code = 0, Message = "两次输入密码不一致！" });
            }
            var serviceClient = new SmartHsServiceClient();
            var member = serviceClient.FindMemberByName(user);
            var jObj = JObject.Parse(member);
            if (Convert.ToInt32(jObj["Code"]) != 1)
            {
                return JsonConvert.SerializeObject(new { Code = 0, Message = "该注册用户不存在！" });
            }

            if (string.IsNullOrWhiteSpace(orignal) && session <= 0)
            {
                return JsonConvert.SerializeObject(new { Code = 0, Message = "此次请求不合法或已失效！" });
            }

            if (session > 0)
            {
                var can = serviceClient.CanUseSessionById(session);
                var canObj = can.JObjParse();
                if (Convert.ToInt32(canObj["Code"]) != 1)
                {
                    return JsonConvert.SerializeObject(new { Code = 0, Message = "此次请求链接已使用或过期！" });
                }
                string json = JsonConvert.SerializeObject(new { member_key = pwd1 });
                var result = serviceClient.UpdateMember(Convert.ToInt64(jObj["Message"]["member_id"]), json);
                serviceClient.ReadyToUseSessionVerify(session);
                return result;
            }
            else
            {
                var update = serviceClient.UpdateMemberKey(user, orignal, pwd1);
                return update;
            }

           
            return "";

        }

        private static string GetRequestIp()
        {
            if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
            {
                return
                    System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].Split(new char[]
                    {','})[0];
            }
            else
            {
                return System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
        }

        private static bool SendModifyPwdEmail(string user, string toMail, DateTime now, string code)
        {
            StringBuilder MailContent = new StringBuilder();
            MailContent.Append("亲爱的海曙智慧社区用户：<br/>");
            MailContent.Append("    您好！你于");
            MailContent.Append(now.ToLongTimeString());
            MailContent.Append("通过'海曙智慧社区用户'管理中心审请找回密码。<br/>");
            MailContent.Append("    为了安全起见，请用户点击以下链接重设个人密码,此链接7天有效：<br/><br/>");
            var skey = user;
            // 插入数据库
            string url = string.Format(@"{0}{1}?User={2}&Create={3}&Code={4}", StaticData.HostAddress, "MemberModify.aspx", user, now.Ticks, code);
            MailContent.Append("<a href='" + url + "'>" + url + "</a><br/><br/>");
            MailContent.Append("    (如果无法点击该URL链接地址，请将它复制并粘帖到浏览器的地址输入框，然后单击回车即可。)");
            return SendMailHelper.SendHtml(StaticData.AdminMailAddress, StaticData.AdminMailAlias, toMail, "海曙智慧社区找回密码", MailContent.ToString(), StaticData.AdminSmtpServer, StaticData.AdminMailUser, StaticData.AdminMailPwd);
        }  

    }
}