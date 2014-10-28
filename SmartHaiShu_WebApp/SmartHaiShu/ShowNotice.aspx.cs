﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSOpenDataService;
using SmartHaiShu_WebApp.SmartHaiShu.CityScreenService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class ShowNotice : System.Web.UI.Page
    {
        public string InfoTitle
        {
            get;
            set;
        }

        public string InfoContent
        {
            get;
            set;
        }

        public string ReleaseTime
        {
            get;
            set;
        }

        private OpenDataServiceClient _serviceClient = new OpenDataServiceClient();
        private NewsQuery _newsQuery = new NewsQuery();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string type = Request.QueryString["Type"];
                string id = Request.QueryString["Id"];
                switch (Convert.ToInt32(type))
                {
                    case 1://通告
                        var result = _serviceClient.GetCommunityNotice(id);
                        if (result.JObjCodeTrue())
                        {
                            InfoContent = result.JObjMessageInner("Content").ValueOrDefault<string>();
                            InfoTitle = result.JObjMessageInner("Title").ValueOrDefault<string>();
                            ReleaseTime = result.JObjMessageInner("ReleaseTime").ValueOrDefault <string>();
                        }
                        break;
                    case 2://风采
                        result = _serviceClient.GetCommunityFC(id);
                        if (result.JObjCodeTrue())
                        {
                            InfoContent = result.JObjMessageInner("Content").ValueOrDefault<string>();
                            InfoTitle = result.JObjMessageInner("Title").ValueOrDefault<string>();
                            ReleaseTime = result.JObjMessageInner("ReleaseTime").ValueOrDefault <string>();
                        }
                        break;
                    case 3: //
                        var news =_newsQuery.QuerySpecial(Convert.ToInt64(id));
                        if (news != null)
                        {
                            InfoContent = news.Contents;
                            InfoTitle = news.Title;
                            ReleaseTime = news.LastModifyTime != null
                                ? news.LastModifyTime.Value.ToString("yyyy-MM-dd")
                                : string.Empty;
                        }
                        else
                        {
                            InfoTitle = "null";

                        }
                        break;
                   
                    default:
                        break;
                }
            }
        }
    }
}