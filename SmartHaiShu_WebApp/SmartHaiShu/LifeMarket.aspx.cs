﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartHaiShu.Utility;
using SmartHaiShu_WebApp.HSOpenDataService;


namespace SmartHaiShu_WebApp.SmartHaiShu
{
    public partial class LifeMarket : Page
    {
        protected const int PageSize = 10;
        protected const int PageListNumber = 5;
        private readonly OpenDataServiceClient _serviceClient = new OpenDataServiceClient();

        protected int TotalCount
        {
            get;
            set;
        }

        protected int TotalPage
        {
            get;
            set;
        }

        protected int PageNo
        {
            get;
            set;
        }

        public int Page1
        {
            get;
            set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
                PageNo = Convert.ToInt32(Request.QueryString["PageNo"]);
                PageNo = Math.Max(PageNo, 1);
                var json = _serviceClient.GetMarketCount();

                if (json.JObjCodeTrue())
                {
                    TotalCount = json.JobjMessageConvert <int>();
                    if (TotalCount > 0)
                    {
                        json = _serviceClient.GetMarket(PageNo, PageSize);
                        if (json.JObjCodeTrue())
                        {

                            RepeaterMarket.DataSource = from item in json.JObjMessageToken()
                                                   select new
                                                   {
                                                       Name = item["Name"].ValueOrDefault <string>(),
                                                       Range = item["Range"].ValueOrDefault <string>(),
                                                       Address = item["Address"].ValueOrDefault <string>(),
                                                       Id = item["Id"].ValueOrDefault<string>(),
                                                       Type = item["Type"].ValueOrDefault <string>(),
                                                   };
                        }
                    }
                }
            }
            TotalPage = TotalCount/PageSize + (TotalCount%PageSize == 0 ? 0 : 1);
            Page1 = (Math.Max(PageNo, 1) - 1)/PageListNumber*PageListNumber + 1;
            RepeaterMarket.DataBind();

            Page.ClientScript.RegisterStartupScript(GetType(), "pageNoSelector",
                "<script language='javascript'>pageNoSelector(" + PageNo + "," + TotalPage + ");</script>");
        }
    }
}