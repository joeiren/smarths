using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSOpenDataService;
using Newtonsoft.Json;
using SmartHaisuModel;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class SheQuDongTai : System.Web.UI.Page
    {

        public string Introduction { get; set; }

        public List<NoticeVO> NoticeList { get; set; }

        public List<FengcaiVO> FengcaiList { get; set; }

        HSOpenDataService.OpenDataServiceClient service = new OpenDataServiceClient();
        private string _community = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            _community = ((SmartHaiShu)Master).CurrentCommunity;

            if (!IsPostBack)
            {
                var json = service.GetCommunityIntroduction(_community);
                var messageResult = json.JObjMessageToken();
                if (json.JObjCodeTrue() && messageResult != null && messageResult.Any())
                {
                    Introduction = json.JObjMessageInner("Introduction").Value<string>();
                    //Introduction = messageResult.<string>("Introduction");
                    if (!string.IsNullOrWhiteSpace(Introduction))
                    {
                        var intros = Introduction.Split(new char[]{'\n'}, StringSplitOptions.RemoveEmptyEntries);
                        Introduction = "&nbsp;&nbsp;&nbsp;&nbsp;" + String.Join("<BR>&nbsp;&nbsp;&nbsp;&nbsp;", intros);
                    }
                }

                json = service.GetCommunityNoticeCount(_community);
                int count = json.JobjMessageConvert<int>();
                if (json.JObjCodeTrue() && count > 0)
                {
                    var jsonResult = service.GetCommunityNoticeTitleByPage(_community, 1, 5);
                    NoticeList = (from jobj in jsonResult.JObjMessageToken()
                                select
                                new NoticeVO() { 
                                    Title = jobj["Title"].Value<string>(), 
                                    Id = jobj["Id"].Value<string>()
                                }).ToList();                    
                }
                RepeaterNotice.DataSource = NoticeList;
                RepeaterNotice.DataBind();
                json = service.GetCommunityFCCount(_community);
                count = json.JobjMessageConvert<int>();
                if (json.JObjCodeTrue() && count > 0)
                {

                    var jsonResult = service.GetCommunityFCTitles("后塘河社区", 1, 5);
                    FengcaiList = (from jobj in jsonResult.JObjMessageToken()
                                select
                                new FengcaiVO()
                                {
                                    Title = jobj["Title"].Value<string>(),
                                    Id = jobj["Id"].Value<string>()
                                }).ToList();                    
                }
                RepeaterFengcai.DataSource = FengcaiList;
                RepeaterFengcai.DataBind();
                
            }
            //var today = ((SmartHaiShu)this.Master).Today;
 
        }
    }

    public class NoticeVO
    {
        public string Title { get; set; }
        public string Id { get; set; }
    }

    public class FengcaiVO
    {
        public string Title { get; set; }

        public string Id { get; set; }
    }
}