﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SmartHaiShu_WebApp.HSSmartDataService;
using SmartHaiShu_WebApp.SmartHaiShu.Cache;
using SmartHaiShu_WebApp.HSOpenDataService;
using SmartHaiShu.Utility;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class CommonInvoke : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        private static SmartHsServiceClient _clientService = new SmartHsServiceClient();
        private OpenDataServiceClient _openDataService = new OpenDataServiceClient();

        [WebMethod]
        public static string LoadStreet()
        {
            try
            {
                var list = from street in StaticData.StreetInfo
                           select new { id = street.Key, name = street.Value };
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
                                    name = (string)obj["name"]
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
        public static string GetSpecialNotice(string noticeId)
        {
            try
            {
                var json = new OpenDataServiceClient().GetCommunityNotice(noticeId);
                if (json.JObjCodeTrue())
                {
                    return json.JObjParse()["Message"].ToString();
                }
                return string.Empty;
            }

            catch (Exception)
            {
                return string.Empty;
            }
        }

        [WebMethod]
        public static string GetSpecialFC(string noticeId)
        {
            try
            {
                var json = new OpenDataServiceClient().GetCommunityFC(noticeId);
                if (json.JObjCodeTrue())
                {
                    return json.JObjParse()["Message"].ToString();
                }
                return string.Empty;
            }

            catch (Exception)
            {
                return string.Empty;
            }
        }

        [WebMethod]
        public static void SetSelectedCommunity( string street,string community)
        {
            HttpContext.Current.Session["SelectedCommunity"] = community;
            HttpContext.Current.Session["SelectedStreet"] = street;
        }

        [WebMethod]
        public static string PublishInteractPost(string title, string keywords, string contenet, int dateSpan, string contactInfo, long memberId)
        {
            try
            {
                var json = _clientService.AddInteractPost(title, contenet, keywords, contactInfo, dateSpan, memberId);
                if (json.JObjCodeTrue())
                {
                    return json;
                }
                return string.Empty;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, Message = ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

    }
}