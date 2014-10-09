using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using Newtonsoft.Json.Linq;

namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class NoticeInfo : System.Web.UI.Page
    {

        public List<NoticeInfoVO> NoticeList
        {
            get;
            set;
        }

        public string FirstContent
        {
            get;
            set;
        }
        private string _testCommunity = "牡丹社区";
        private const int PageSize = 10;
        private HSOpenDataService.OpenDataServiceClient _openServiceClient = new HSOpenDataService.OpenDataServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            NoticeList = new List<NoticeInfoVO>();
            if (!IsPostBack)
            {
                var type = Request.QueryString["Type"];
                var pageNo = Convert.ToInt32(Request.QueryString["PageNo"]);
                if (pageNo == 0)
                {
                    pageNo = 1;
                }
                if (!string.IsNullOrEmpty(type) && type == "1")
                {
                }
                else
                {
                    var json = _openServiceClient.GetCommunityNoticeCount(_testCommunity);
                    var count = json.JobjMessageConvert<int>();
                    if (json.JObjCodeTrue() && count > 0)
                    {
                        json = _openServiceClient.GetCommunityNoticeTitleByPage(_testCommunity, pageNo, PageSize);
                        if (json.JObjCodeTrue())
                        {
                            NoticeList = (from jobj in json.JObjMessageToken()
                                          select new NoticeInfoVO() {
                                              Id = jobj["Id"].ValueOrDefault<string>(),
                                              Title = jobj["Title"].ValueOrDefault<string>(),
                                              ReleaseTime = jobj["ReleaseTime"].ValueOrDefault<string>()
                                          }).ToList();
                        }
                    }
                }
                
            }
            Repeater1.DataSource = NoticeList;
            Repeater1.DataBind();

            if (NoticeList.Any())
            {
                var json = _openServiceClient.GetCommunityNotice(NoticeList.First().Id);
                if (json.JObjCodeTrue())
                {
                    var firstContent = json.JObjMessageInner("Content").Value<string>();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "setActiveContent",
              "<script language='javascript'>setActiveContent(" +  NoticeList.First().Id + ",'"+ firstContent.Replace("\r\n","")+"');</script>");
                }
            }
        }
    }


    
}