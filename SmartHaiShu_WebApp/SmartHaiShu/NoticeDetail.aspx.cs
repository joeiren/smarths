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
    public partial class NoticeDetail : System.Web.UI.Page
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

        public int PageType
        {
            get;
            set;
        }
        public int PageNo 
        { 
            get;
            set;
        }
        public int Page1 
        { 
            get;
            set;
        }

        public int TotlaPage
        {
            get;
            set;
        }

        private string _testCommunity = "牡丹社区";
        protected const int PageSize = 8;
        protected const int PageListNumber = 5;
        private HSOpenDataService.OpenDataServiceClient _openServiceClient = new HSOpenDataService.OpenDataServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            NoticeList = new List<NoticeInfoVO>();
            _testCommunity = ((SmartHaiShu)Master).CurrentCommunity;
            if (!IsPostBack)
            {
                PageType = Convert.ToInt32(Request.QueryString["Type"]);
                PageNo = Convert.ToInt32(Request.QueryString["PageNo"]);
                PageNo = Math.Max(PageNo, 1);
                TotlaPage = 0;
                int count = 0;
                if (PageType == 1)
                {
                    var json = _openServiceClient.GetCommunityFCCount("后塘河社区");
                    count = json.JobjMessageConvert<int>();
                    if (json.JObjCodeTrue() && count > 0)
                    {
                        json = _openServiceClient.GetCommunityFCByPage("后塘河社区", PageNo, PageSize);
                        if (json.JObjCodeTrue())
                        {
                            NoticeList = (from jobj in json.JObjMessageToken()
                                          select new NoticeInfoVO()
                                          {
                                              Id = jobj["Id"].ValueOrDefault<string>(),
                                              Title = jobj["Title"].ValueOrDefault<string>(),
                                              Content = jobj["Content"].ValueOrDefault<string>(),
                                              ReleaseTime = jobj["ReleaseTime"].ValueOrDefault<string>()
                                          }).ToList();
                        }
                    }
                }
                else
                {
                    var json = _openServiceClient.GetCommunityNoticeCount(_testCommunity);
                    count = json.JobjMessageConvert<int>();
                    if (json.JObjCodeTrue() && count > 0)
                    {
                        json = _openServiceClient.GetCommunityNoticeByPage(_testCommunity, PageNo, PageSize);
                        if (json.JObjCodeTrue())
                        {
                            NoticeList = (from jobj in json.JObjMessageToken()
                                          select new NoticeInfoVO()
                                          {
                                              Id = jobj["Id"].ValueOrDefault<string>(),
                                              Title = jobj["Title"].ValueOrDefault<string>(),
                                              Content = jobj["Content"].ValueOrDefault<string>(),
                                              ReleaseTime = jobj["ReleaseTime"].ValueOrDefault<string>()
                                          }).ToList();
                        }
                    }
                }
                TotlaPage = count / PageSize + (count % PageSize == 0 ? 0 : 1);
                Page1 = (Math.Max(PageNo, 1) - 1) / PageListNumber * PageListNumber + 1;

            }
            Repeater1.DataSource = NoticeList;
            Repeater1.DataBind();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "activeMenu",
              "<script language='javascript'>activeMenu(" + PageType + ");</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "pageNoSelector",
                           "<script language='javascript'>pageNoSelector(" + PageNo + ","+TotlaPage+");</script>");


            //if (NoticeList.Any())
            //{
            //    var json = _openServiceClient.GetCommunityNotice(NoticeList.First().Id);
            //    if (json.JObjCodeTrue())
            //    {
            //        var firstContent = json.JObjMessageInner("Content").Value<string>();

            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "setActiveContent",
            //  "<script language='javascript'>setActiveContent(" + NoticeList.First().Id + ",'" + firstContent.Replace("\r\n", "") + "');</script>");
            //    }
            //}
        }
    }

    public class NoticeInfoVO
    {
        public string Title
        {
            get;
            set;
        }

        public string Content
        {
            get;
            set;
        }

        public string ReleaseTime
        {
            get;
            set;
        }

        public string Id
        {
            get;
            set;
        }
    }
}