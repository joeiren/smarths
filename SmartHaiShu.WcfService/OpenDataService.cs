using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using SmartHaiShu.WcfService.OpenDataLogic;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService
{
    public class OpenDataService : IOpenDataService
    {
        private readonly BankLocationLogic _bankLocationLogic = new BankLocationLogic();
        private readonly BusRouteLogic _busRouteLogic = new BusRouteLogic();
        private readonly CarServiceLogic _carLogic = new CarServiceLogic();
        private readonly DrugStoreLogic _drugStoreLogic = new DrugStoreLogic();
        private readonly DzkBizLogic _dzkLogic = new DzkBizLogic();
        private readonly EducationLogic _educationLogic = new EducationLogic();
        private readonly HotelLogic _hotelLogic = new HotelLogic();
        private readonly MarketLogic _marketLogic = new MarketLogic();
        private readonly CommunityNoticeLogic _noticeLogic = new CommunityNoticeLogic();
        private readonly RetirementLogic _retirementLogic = new RetirementLogic();
        private readonly BikeLocationLogic _bikeLocationLogic = new BikeLocationLogic();

        /// <summary>
        ///     社区简介
        /// </summary>
        /// <param name="community"></param>
        /// <returns></returns>
        public string GetCommunityIntroduction(string community)
        {
            try
            {
                b_t_ufp_3_2_1 result = _noticeLogic.LoadCommunityIntroduction(community);

                if (result != null)
                {
                    // 处理 TelBook
                    var telReset = new List<string>();
                    foreach (string tel in result.TEL_BOOK.Split('\n'))
                    {
                        string real = tel.Trim();
                        if (string.IsNullOrWhiteSpace(real))
                        {
                            continue;
                        }
                        char first = real.ToCharArray().FirstOrDefault();
                        if (first >= 0x4e00 && first <= 0x9fbb)
                        {
                            // 汉字
                            telReset.Add(tel);
                        }
                        else
                        {
                            int index = Math.Max(0, telReset.Count - 1);
                            bool isNumber = false;
                            if (!string.IsNullOrWhiteSpace(telReset[index]))
                            {
                                string orignal = telReset[index].TrimEnd();
                                int length = orignal.Length;
                                isNumber = Char.IsNumber(orignal.ToCharArray().ElementAt(length - 1));
                            }

                            if (isNumber)
                            {
                                telReset[index] = string.Format("{0}、{1}", telReset[index], real);
                            }
                            else
                            {
                                telReset[index] = telReset + real;
                            }
                        }
                    }
                    result.TEL_BOOK = string.Join("\n", telReset);
                    var introduction = new
                    {
                        Street = result.STREET_NAME,
                        Community = result.COMMUNITY_NAME,
                        Introduction = result.INTRODUCTION,
                        TelBook = result.TEL_BOOK,
                        Address = result.ADDRESS,
                        ZipCode = result.ZIP_CODE
                    };

                    return new ResultFormat(1, introduction).ToString();
                }
                return new ResultFormat(0, "无此社区简介").ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取社区名字
        /// </summary>
        /// <param name="address"></param>
        /// <returns></returns>
        public string GetCommunityName(string address)
        {
            try
            {
                string name = _dzkLogic.LocateCommunityName(address);
                if (!string.IsNullOrEmpty(name))
                {
                    return new ResultFormat(1, name).ToString();
                }
                return new ResultFormat(0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取社区通告
        /// </summary>
        /// <param name="noticeId"></param>
        /// <returns></returns>
        public string GetCommunityNotice(string noticeId)
        {
            try
            {
                b_t_ufp_3_2_2 notices = _noticeLogic.LoadSpecificNotice(noticeId);

                if (notices != null)
                {
                    var result = new
                    {
                        Id = notices.UUID,
                        Title = notices.TITLE,
                        Content = notices.CONTENT,
                        ReleaseTime = notices.RELEASE_TIME
                    };
                    return new ResultFormat(1, result).ToString();
                }
                return new ResultFormat(0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex + ex.Message + ex.StackTrace);
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取社区通告标题(最近10条)
        /// </summary>
        /// <param name="community"></param>
        /// <returns></returns>
        public string GetCommunityNoticeTitles(string community)
        {
            try
            {
                IEnumerable<b_t_ufp_3_2_2> notices = _noticeLogic.LoadNotices(community);
                if (notices != null)
                {
                    var result = (from it in notices
                        select new
                        {
                            Id = it.UUID,
                            Title = it.TITLE,
                            ReleaseTime = it.RELEASE_TIME
                        }).ToList();
                    return new ResultFormat(1, result).ToString();
                }
                return new ResultFormat(0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.Message);
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取社区通告条数
        /// </summary>
        /// <param name="community"></param>
        /// <returns></returns>
        public string GetCommunityNoticeCount(string community)
        {
            try
            {
                int count = _noticeLogic.LoadNoticeCount(community);
                return new ResultFormat(1, count).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.Message);
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     按页获取社区通告标题
        /// </summary>
        /// <param name="community"></param>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetCommunityNoticeTitleByPage(string community, int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_3_2_2> result = _noticeLogic.LoadNotices(community, pageNo, pageSize);
                var notice = (from it in result
                    select new
                    {
                        Id = it.UUID,
                        Title = it.TITLE,
                        ReleaseTime = it.RELEASE_TIME
                    }).ToList();
                return new ResultFormat(1, notice).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.Message);
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     按页获取社区通告（标题和内容）
        /// </summary>
        /// <param name="community"></param>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetCommunityNoticeByPage(string community, int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_3_2_2> result = _noticeLogic.LoadNotices(community, pageNo, pageSize);
                var notice = (from it in result
                    select new
                    {
                        Id = it.UUID,
                        Title = it.TITLE,
                        Content = it.CONTENT,
                        ReleaseTime = it.RELEASE_TIME
                    }).ToList();
                return new ResultFormat(1, notice).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取社区风采条数
        /// </summary>
        /// <param name="community"></param>
        /// <returns></returns>
        public string GetCommunityFCCount(string community)
        {
            try
            {
                int result = _noticeLogic.LoadFCCount(community);
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     分页获取社区风采(标题)
        /// </summary>
        /// <param name="community">社区名称</param>
        /// <param name="pageNo">页号（大于0）</param>
        /// <param name="pageSize">每页条数（小于20）</param>
        /// <returns></returns>
        public string GetCommunityFCTitles(string community, int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_3_2_5> fcs = _noticeLogic.LoadFC(community, pageNo, pageSize);
                var result = (from it in fcs
                    select new
                    {
                        Id = it.UUID,
                        Title = it.TITLE,
                        ReleaseTime = it.RELEASE_TIME
                    }).ToList();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     分页获取社区风采(标题和内容)
        /// </summary>
        /// <param name="community"></param>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetCommunityFCByPage(string community, int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_3_2_5> fcs = _noticeLogic.LoadFC(community, pageNo, pageSize);
                var result = (from it in fcs
                    select new
                    {
                        Id = it.UUID,
                        Title = it.TITLE,
                        Content = it.CONTENT,
                        ReleaseTime = it.RELEASE_TIME
                    }).ToList();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取指定id的社区风采内容
        /// </summary>
        /// <param name="fcId"></param>
        /// <returns></returns>
        public string GetCommunityFC(string fcId)
        {
            try
            {
                b_t_ufp_3_2_5 notices = _noticeLogic.LoadSpecificFC(fcId);
                if (notices != null)
                {
                    var result = new
                    {
                        Id = notices.UUID,
                        Title = notices.TITLE,
                        Content = notices.CONTENT,
                        ReleaseTime = notices.RELEASE_TIME
                    };
                    return new ResultFormat(1, result).ToString();
                }
                return new ResultFormat(0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     停水通知条数
        /// </summary>
        /// <returns></returns>
        public string GetWaterNoticeCount()
        {
            try
            {
                int result = _noticeLogic.WaterNoticeCount();
                return new ResultFormat(1, result.ToString()).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     停水通知
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetWaterNotice(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_3_2_3> result = _noticeLogic.LoadWaterNotice(pageNo, pageSize);

                var notice = (from it in result
                    select new
                    {
                        StartTime = it.START_TIME,
                        EndTime = it.END_TIME,
                        Range = it.RANGE1,
                        Reason = it.REASON,
                        ReleaseTime = it.RELEASE_TIME
                    }).ToList();

                return new ResultFormat(1, notice).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取停电通知条数
        /// </summary>
        /// <returns></returns>
        public string GetElectricNoticeCount()
        {
            try
            {
                int result = _noticeLogic.ElectricNoticeCount();
                return new ResultFormat(1, result.ToString()).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取停电通知
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetElectricNotice(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_3_2_4> result = _noticeLogic.LoadElectricNotice(pageNo, pageSize);

                var notice = (from it in result
                    select new
                    {
                        Blackout_time = it.BLACKOUT,
                        Range = it.RANGE1,
                        Line = it.LINE,
                        ReleaseTime = it.RELEASE_TIME
                    }).ToList();

                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     公交线路
        /// </summary>
        /// <param name="routeName"></param>
        /// <returns></returns>
        public string GetBusRoute(string routeName)
        {
            try
            {
                IEnumerable<b_t_ufp_4_2_7> result = _busRouteLogic.LoadBusRoute(routeName);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Line = it.LINE,
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     公交线路列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetBusRouteList(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_4_2_7> result = _busRouteLogic.LoadBusRouteList(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Line = it.LINE,
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取汽车4S店列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetCar4SLocation(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_4_3_1> result = _carLogic.Load4SLocation(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Brand = it.BRAND,
                        Tel = it.TEL,
                        Address = it.ADDRESS
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     汽车维修店列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetCarRepairLocation(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_4_3_2> result = _carLogic.LoadCarRepairLocation(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Level = it.LEVEL,
                        Type = it.TYPE1,
                        Address = it.ADDRESS
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     汽车年检点列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetCarAnnualCheck(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_4_3_3> result = _carLogic.LoadCarAnnualCheck(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Address = it.ADDRESS,
                        Tel = it.TEL
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     培训驾校列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetCarSchool(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_4_3_5> result = _carLogic.LoadCarSchool(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Address = it.ADDRESS,
                        Tel = it.TEL,
                        Level = it.LEVEL
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     星级酒店
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetStarHotels(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_4_5_1> result = _hotelLogic.LoadStarHotelList(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Address = it.ADDRESS,
                        Tel = it.TEL,
                        Level = it.LEVEL,
                        BusLine = it.LINE,
                        Content = it.CONTENT
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     花级酒店
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetFlowerHotels(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_4_5_2> result = _hotelLogic.LoadFlowerHotelList(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Address = it.ADDRESS,
                        Tel = it.TEL,
                        Level = it.LEVEL,
                        BusLine = it.LINE,
                        Content = it.CONTENT
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     学前教育 幼儿园列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetChildSchool(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_6_1_1> result = _educationLogic.LoadChildSchool(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Address = it.ADDRESS,
                        Tel = it.TEL,
                        Level = it.LEVEL,
                        Url = it.URL
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     义务教育 （小学，初中）列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetPrimarySchool(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_6_1_2> result = _educationLogic.LoadPrimarySchool(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Address = it.ADDRESS,
                        Type = it.TYPE1,
                        WorkTime = it.WORK_TIME,
                        TelContacts = it.TEL_CONTACTS,
                        ComplaintTel = it.COMPLAINT_TEL,
                        Seat = it.SEAT,
                        WebSite = it.WEB_SITE,
                        Introduction = it.INTRODUCTION
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     养老院列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetRetirementHome(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_8_4> result = _retirementLogic.LoadRetirementHome(pageNo, pageSize);
                var routes = (from it in result
                    select new
                    {
                        Name = it.NAME,
                        Address = it.ADDRESS,
                        Fanwei = it.FANWEI,
                        Tel = it.TEL,
                        TelR = it.TELR,
                    }).ToList();

                return new ResultFormat(1, routes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     超市记录的条数
        /// </summary>
        /// <returns></returns>
        public string GetMarketCount()
        {
            try
            {
                int result = _marketLogic.MarketCount();
                return new ResultFormat(1, result.ToString()).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     按页获取超市记录
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetMarket(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_0003_cs> result = _marketLogic.LoadMarket(pageNo, pageSize);
                var markets = (from it in result
                    select new
                    {
                        Name = it.QYMC,
                        Range = it.JYFW,
                        Address = it.JYDZ,
                        Id = it.UUID,
                        Type = it.JYBZ,
                        ReleaseTime = it.RELEASE_TIME,
                        CheckTime = it.CHECK_TIME
                    }).ToList();

                return new ResultFormat(1, markets).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     药店记录的条数
        /// </summary>
        /// <returns></returns>
        public string GetDrugStoreCount()
        {
            try
            {
                int result = _drugStoreLogic.DrugStoreCount();
                return new ResultFormat(1, result.ToString()).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     按页获取药店记录
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetDrugStore(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_0003_ydml> result = _drugStoreLogic.LoadDrugStore(pageNo, pageSize);
                var markets = (from it in result
                    select new
                    {
                        Name = it.QYMC,
                        Range = it.JYFW,
                        Address = it.JYDZ,
                        Id = it.UUID,
                        Type = it.JYBZ,
                        ReleaseTime = it.RELEASE_TIME,
                        CheckTime = it.CHECK_TIME
                    }).ToList();

                return new ResultFormat(1, markets).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     获取银行网点条数
        /// </summary>
        /// <returns></returns>
        public string GetBankLocationCount()
        {
            try
            {
                int result = _bankLocationLogic.BankLocationCount();
                return new ResultFormat(1, result.ToString()).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        ///     按页获取银行网点记录
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetBankLocation(int pageNo, int pageSize)
        {
            try
            {
                IEnumerable<b_t_ufp_0003_yh> result = _bankLocationLogic.LoadBankLocation(pageNo, pageSize);
                var markets = (from it in result
                    select new
                    {
                        Name = it.QYMC,
                        Range = it.JYFW,
                        Address = it.JYDZ,
                        Id = it.UUID,
                        Type = it.JYBZ,
                        ReleaseTime = it.RELEASE_TIME,
                        CheckTime = it.CHECK_TIME
                    }).ToList();

                return new ResultFormat(1, markets).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 自行车分布点位条数
        /// </summary>
        /// <returns></returns>
        public string GetBikeLocationCount()
        {
            try
            {
                int result = _bikeLocationLogic.BikeLocationCount();
                return new ResultFormat(1, result.ToString(CultureInfo.InvariantCulture)).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 按页获取自行车分布记录
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public string GetBikeLocation(int pageNo, int pageSize)
        {
            try
            {
                var result = _bikeLocationLogic.LoadBikeLocation(pageNo, pageSize);
                var bikes = (from it in result
                               select new
                               {
                                   Code = it.CODE,
                                   Name = it.NAME,
                                   Address = it.ADDRESS,
                                   Content = it.CONTENT,
                                   ReleaseTime = DateTime.Parse(it.RELEASE_TIME).ToString("yyyy-MM-dd"),
                                   CheckTime = it.CHECK_TIME
                               }).ToList();

                return new ResultFormat(1, bikes).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

    }
}