using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;


namespace SmartHaiShu.WcfService
{
    // 注意: 使用“重构”菜单上的“重命名”命令，可以同时更改代码和配置文件中的接口名“IService1”。
    [ServiceContract(Namespace = "http://smarths-ndtv.com")]
    public interface ISmartHsService
    {
        #region Member
        [OperationContract]
        string AddMember(string memberJson);

        [OperationContract]
        string ExistMemberName(string name);

        [OperationContract]
        string FindMember(long id);

        [OperationContract]
        string FindMemberByName(string name);

        [OperationContract]
        string UpdateMember(long id, string memberJson);

        [OperationContract]
        string Login(string memberName, string password, string ip, int type);

        [OperationContract]
        string UpdateMemberKey(string name, string orignalMemberKey, string newMemberKey);
        #endregion

        #region Community
        [OperationContract]
        string FindAllStreet();

        [OperationContract]
        string FindCommunityByStreet(int street);

        [OperationContract]
        string FindCommunity(int id);

        [OperationContract]
        string FindStreetGroup();
        #endregion

        //[OperationContract]
        //string GetData(int value);

        //[OperationContract]
        //CompositeType GetDataUsingDataContract(CompositeType composite);

        [OperationContract]
        string AddSessionVerify(long dateTicks, string key, string confirm);

        [OperationContract]
        string ReadyToUseSessionVerify(long id);

        [OperationContract]
        string CanUseSession(long dateTicks, string key, string confirm);

        [OperationContract]
        string CanUseSessionById(long sessionId);

        [OperationContract]
        string FindPostSpanTypeConfig();

        [OperationContract]
        string FindTypeConfigByCategory(int categoryId);

        [OperationContract]
        string AddInteractPost(string title, string content, string keyword, string contractInfo, int dataSpan,
                               long memberId);

        [OperationContract]
        string GetPostCount();

        [OperationContract]
        string GetPostTitlesByPage(int pageNo, int pageSize);

        [OperationContract]
        string GetPostsByPage(int pageNo, int pageSize);

        [OperationContract]
        string GetSpecialInteractPost(long postId);

        [OperationContract]
        string DeleteInteractPost(long postId);

        #region CityScreen
        [OperationContract]
        string SocialInsureQuery(string cardId, string pwd);

        [OperationContract]
        string WeatherInfoToday();

        [OperationContract]
        string WeatherInfoFuture();

        [OperationContract]
        byte[] GetTrafficCodeImg();

        [OperationContract]
        string GetTrafficRecode(string no, string frameNo, string type, string vcode);
        
        [OperationContract]
        string GetFavorableNewsCount();

        [OperationContract]
        string GetFavorableNews(int pageSize, int pageNo);

        [OperationContract]
        string GetFavorableNewsTitle(int pageSize, int pageNo);

        [OperationContract]
        string GetEducationNewsCount();

        [OperationContract]
        string GetEducationleNews(int pageSize, int pageNo);

        [OperationContract]
        string GetEducationleNewsTitle(int pageSize, int pageNo);

        [OperationContract]
        string GetHealthNewsCount();

        [OperationContract]
        string GetHealthNews(int pageSize, int pageNo);

        [OperationContract]
        string GetHealthNewsTitle(int pageSize, int pageNo);

        [OperationContract]
        string GetPriceNewsCount();

        [OperationContract]
        string GetPriceeNews(int pageSize, int pageNo);

        [OperationContract]
        string GetPriceeNewsTitle(int pageSize, int pageNo);

        [OperationContract]
        string GetTripNewsCount();

        [OperationContract]
        string GetTripNews(int pageSize, int pageNo);

        [OperationContract]
        string GetTripNewsTitle(int pageSize, int pageNo);

        [OperationContract]
        string GetAllFoods();

        [OperationContract]
        string GetAllFoodCategories();

        [OperationContract]
        string GetAllMonitorSites();

        [OperationContract]
        string FilterFoodsByCategory(string category);

        [OperationContract]
        string GetFoodMonitorCount(string category, string foodname, string site);

        [OperationContract]
        string GetFoodMonitorsByPage(string category, string foodname, string site, int pageSize, int pageNo);
        #endregion
    }
}