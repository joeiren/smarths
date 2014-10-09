using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;


namespace SmartHaiShu.WcfService
{
    /// <summary>
    /// 数据开放平台相关数据
    /// </summary>
    [ServiceContract]
    public interface IOpenDataService
    {
        [OperationContract]
        string GetCommunityIntroduction(string community);

        [OperationContract]
        string GetCommunityName(string address);

        [OperationContract]
        string GetCommunityNotice(string noticeId);

        [OperationContract]
        string GetCommunityNoticeTitles(string community);

        [OperationContract]
        string GetCommunityNoticeCount(string community);
       
        [OperationContract]
        string GetCommunityNoticeTitleByPage(string community, int pageNo, int pageSize);

        [OperationContract]
        string GetCommunityNoticeByPage(string community, int pageNo, int pageSize);

        [OperationContract]
        string GetCommunityFCCount(string community);

        [OperationContract]
        string GetCommunityFCTitles(string community, int pageNo, int pageSize);

        [OperationContract]
        string GetCommunityFCByPage(string community, int pageNo, int pageSize);

        [OperationContract]
        string GetCommunityFC(string fcId);

        [OperationContract]
        string GetWaterNoticeCount();

        [OperationContract]
        string GetWaterNotice(int pageNo, int pageSize);

        [OperationContract]
        string GetElectricNoticeCount();

        [OperationContract]
        string GetElectricNotice(int pageNo, int pageSize);

        [OperationContract]
        string GetBusRoute(string routeName);

        [OperationContract]
        string GetBusRouteList(int pageNo, int pageSize);

        [OperationContract]
        string GetCar4SLocation(int pageNo, int pageSize);

        [OperationContract]
        string GetCarRepairLocation(int pageNo, int pageSize);

        [OperationContract]
        string GetCarAnnualCheck(int pageNo, int pageSize);

        [OperationContract]
        string GetCarSchool(int pageNo, int pageSize);

        [OperationContract]
        string GetStarHotels(int pageNo, int pageSize);

        [OperationContract]
        string GetFlowerHotels(int pageNo, int pageSize);

        [OperationContract]
        string GetChildSchool(int pageNo, int pageSize);

        [OperationContract]
        string GetPrimarySchool(int pageNo, int pageSize);

        [OperationContract]
        string GetRetirementHome(int pageNo, int pageSize);

        [OperationContract]
        string GetMarketCount();

        [OperationContract]
        string GetMarket(int pageNo, int pageSize);

        [OperationContract]
        string GetDrugStoreCount();

        [OperationContract]
        string GetDrugStore(int pageNo, int pageSize);

        [OperationContract]
        string GetBankLocationCount();

        [OperationContract]
        string GetBankLocation(int pageNo, int pageSize);

        [OperationContract]
        string GetBikeLocationCount();

        [OperationContract]
        string GetBikeLocation(int pageNo, int pageSize);
    }
}
