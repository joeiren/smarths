using System;
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
using SmartHaiShu_WebApp.SmartHaiShu.CityScreenService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class CommonInvoke : Page
    {
        private static readonly SmartHsServiceClient _clientService = new SmartHsServiceClient();
        private OpenDataServiceClient _openDataService = new OpenDataServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string LoadStreet()
        {
            try
            {
                var list = from street in StaticData.StreetInfo
                           select new {id = street.Key, name = street.Value};
                string json = JsonConvert.SerializeObject(list);
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
                string community = new SmartHsServiceClient().FindCommunityByStreet(id);
                var jObj = JObject.Parse(community);
                if (Convert.ToInt32(jObj["Code"]) == 1)
                {
                    var list = (from obj in jObj["Message"]
                                select new
                                {
                                    id = Convert.ToInt32(obj["community_id"]),
                                    name = (string) obj["name"]
                                });

                    string result = JsonConvert.SerializeObject(list);
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
                string json = new OpenDataServiceClient().GetCommunityNotice(noticeId);
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
                string json = new OpenDataServiceClient().GetCommunityFC(noticeId);
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
        public static void SetSelectedCommunity(string street, string community)
        {
            HttpContext.Current.Session["SelectedCommunity"] = community;
            HttpContext.Current.Session["SelectedStreet"] = street;
        }

        [WebMethod]
        public static string PublishInteractPost(string title, string keywords, string contenet, int dateSpan,
                                                 string contactInfo, long memberId)
        {
            try
            {
                string json = _clientService.AddInteractPost(title, contenet, keywords, contactInfo, dateSpan, memberId);
                if (json.JObjCodeTrue())
                {
                    return json;
                }
                return string.Empty;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadFoodCategories()
        {
            try
            {
                string result = new PriceQuery().GetAllFoodCategories();
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadFoodByCategory(string category)
        {
            try
            {
                string result =
                    new PriceQuery().FilterFoodsByCategory(string.IsNullOrWhiteSpace(category) ? null : category);
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadAllFoodMonitorSites()
        {
            try
            {
                string result = new PriceQuery().GetAllMonitorSites();
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadFoodMonitorCount(string category, string foodname, string site)
        {
            try
            {
                string result = new PriceQuery().GetFoodMonitorCount(string.IsNullOrEmpty(category) ? null : category,
                    string.IsNullOrEmpty(foodname) ? null : foodname, string.IsNullOrEmpty(site) ? null : site);
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadFoodMonitorByPage(string category, string foodname, string site, int pageSize,
                                                   int pageNo)
        {
            try
            {
                string result = new PriceQuery().GetFoodMonitorsByPage(string.IsNullOrEmpty(category) ? null : category,
                    string.IsNullOrEmpty(foodname) ? null : foodname, string.IsNullOrEmpty(site) ? null : site, pageSize,
                    pageNo);
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadAllDoctorHospitals()
        {
            try
            {
                string result = new OpenDataServiceClient().GetAllDoctorHospitals();
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadDepartmentsByHospital(string hospital)
        {
            try
            {
                string result = new OpenDataServiceClient().GetDoctorDepartmentsByHostpital(hospital);
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadDoctorsByHospitalDepartment(string hospital, string department, int pageSize,
                                                             int pageNo)
        {
            try
            {
                string result = new OpenDataServiceClient().GetHospitalDoctorsBy(hospital, department, pageSize, pageNo);
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadDoctorCountByHospitalDepartment(string hospital, string department)
        {
            try
            {
                string result = new OpenDataServiceClient().GetHospitalDoctorCountBy(hospital, department);
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new {Code = 0, ex.Message};
                return JsonConvert.SerializeObject(exResult);
            }
        }


        [WebMethod]
        public static string LoadRetirementHomeCount()
        {
            try
            {
                string result = new OpenDataServiceClient().GetRetirementHomeCount();
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new { Code = 0, ex.Message };
                return JsonConvert.SerializeObject(exResult);
            }
        }

        [WebMethod]
        public static string LoadRetirementHome(int pageSize, int pageNo)
        {
            try
            {
                string result = new OpenDataServiceClient().GetRetirementHome(pageNo,pageSize);
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                var exResult = new { Code = 0, ex.Message };
                return JsonConvert.SerializeObject(exResult);
            }
        }
    }
}