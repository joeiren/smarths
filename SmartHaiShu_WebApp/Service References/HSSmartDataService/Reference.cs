﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34014
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartHaiShu_WebApp.HSSmartDataService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://smarths-ndtv.com", ConfigurationName="HSSmartDataService.ISmartHsService")]
    public interface ISmartHsService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/AddMember", ReplyAction="http://smarths-ndtv.com/ISmartHsService/AddMemberResponse")]
        string AddMember(string memberJson);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/ExistMemberName", ReplyAction="http://smarths-ndtv.com/ISmartHsService/ExistMemberNameResponse")]
        string ExistMemberName(string name);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FindMember", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FindMemberResponse")]
        string FindMember(long id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FindMemberByName", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FindMemberByNameResponse")]
        string FindMemberByName(string name);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/UpdateMember", ReplyAction="http://smarths-ndtv.com/ISmartHsService/UpdateMemberResponse")]
        string UpdateMember(long id, string memberJson);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/Login", ReplyAction="http://smarths-ndtv.com/ISmartHsService/LoginResponse")]
        string Login(string memberName, string password, string ip, int type);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/UpdateMemberKey", ReplyAction="http://smarths-ndtv.com/ISmartHsService/UpdateMemberKeyResponse")]
        string UpdateMemberKey(string name, string orignalMemberKey, string newMemberKey);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FindAllStreet", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FindAllStreetResponse")]
        string FindAllStreet();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FindCommunityByStreet", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FindCommunityByStreetResponse")]
        string FindCommunityByStreet(int street);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FindCommunity", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FindCommunityResponse")]
        string FindCommunity(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FindStreetGroup", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FindStreetGroupResponse")]
        string FindStreetGroup();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/AddSessionVerify", ReplyAction="http://smarths-ndtv.com/ISmartHsService/AddSessionVerifyResponse")]
        string AddSessionVerify(long dateTicks, string key, string confirm);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/ReadyToUseSessionVerify", ReplyAction="http://smarths-ndtv.com/ISmartHsService/ReadyToUseSessionVerifyResponse")]
        string ReadyToUseSessionVerify(long id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/CanUseSession", ReplyAction="http://smarths-ndtv.com/ISmartHsService/CanUseSessionResponse")]
        string CanUseSession(long dateTicks, string key, string confirm);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/CanUseSessionById", ReplyAction="http://smarths-ndtv.com/ISmartHsService/CanUseSessionByIdResponse")]
        string CanUseSessionById(long sessionId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FindPostSpanTypeConfig", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FindPostSpanTypeConfigResponse")]
        string FindPostSpanTypeConfig();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FindTypeConfigByCategory", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FindTypeConfigByCategoryResponse")]
        string FindTypeConfigByCategory(int categoryId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/AddInteractPost", ReplyAction="http://smarths-ndtv.com/ISmartHsService/AddInteractPostResponse")]
        string AddInteractPost(string title, string content, string keyword, string contractInfo, int dataSpan, long memberId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetPostCount", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetPostCountResponse")]
        string GetPostCount();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetPostTitlesByPage", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetPostTitlesByPageResponse")]
        string GetPostTitlesByPage(int pageNo, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetPostsByPage", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetPostsByPageResponse")]
        string GetPostsByPage(int pageNo, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetSpecialInteractPost", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetSpecialInteractPostResponse")]
        string GetSpecialInteractPost(long postId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/DeleteInteractPost", ReplyAction="http://smarths-ndtv.com/ISmartHsService/DeleteInteractPostResponse")]
        string DeleteInteractPost(long postId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/SocialInsureQuery", ReplyAction="http://smarths-ndtv.com/ISmartHsService/SocialInsureQueryResponse")]
        string SocialInsureQuery(string cardId, string pwd);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/WeatherInfoToday", ReplyAction="http://smarths-ndtv.com/ISmartHsService/WeatherInfoTodayResponse")]
        string WeatherInfoToday();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/WeatherInfoFuture", ReplyAction="http://smarths-ndtv.com/ISmartHsService/WeatherInfoFutureResponse")]
        string WeatherInfoFuture();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetTrafficCodeImg", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetTrafficCodeImgResponse")]
        byte[] GetTrafficCodeImg();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetTrafficRecode", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetTrafficRecodeResponse")]
        string GetTrafficRecode(string no, string frameNo, string type, string vcode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetFavorableNewsCount", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetFavorableNewsCountResponse")]
        string GetFavorableNewsCount();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetFavorableNews", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetFavorableNewsResponse")]
        string GetFavorableNews(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetFavorableNewsTitle", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetFavorableNewsTitleResponse")]
        string GetFavorableNewsTitle(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetEducationNewsCount", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetEducationNewsCountResponse")]
        string GetEducationNewsCount();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetEducationleNews", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetEducationleNewsResponse")]
        string GetEducationleNews(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetEducationleNewsTitle", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetEducationleNewsTitleResponse")]
        string GetEducationleNewsTitle(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetHealthNewsCount", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetHealthNewsCountResponse")]
        string GetHealthNewsCount();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetHealthNews", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetHealthNewsResponse")]
        string GetHealthNews(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetHealthNewsTitle", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetHealthNewsTitleResponse")]
        string GetHealthNewsTitle(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetPriceNewsCount", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetPriceNewsCountResponse")]
        string GetPriceNewsCount();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetPriceeNews", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetPriceeNewsResponse")]
        string GetPriceeNews(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetPriceeNewsTitle", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetPriceeNewsTitleResponse")]
        string GetPriceeNewsTitle(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetTripNewsCount", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetTripNewsCountResponse")]
        string GetTripNewsCount();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetTripNews", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetTripNewsResponse")]
        string GetTripNews(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetTripNewsTitle", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetTripNewsTitleResponse")]
        string GetTripNewsTitle(int pageSize, int pageNo);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetAllFoods", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetAllFoodsResponse")]
        string GetAllFoods();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetAllFoodCategories", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetAllFoodCategoriesResponse")]
        string GetAllFoodCategories();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetAllMonitorSites", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetAllMonitorSitesResponse")]
        string GetAllMonitorSites();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/FilterFoodsByCategory", ReplyAction="http://smarths-ndtv.com/ISmartHsService/FilterFoodsByCategoryResponse")]
        string FilterFoodsByCategory(string category);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetFoodMonitorCount", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetFoodMonitorCountResponse")]
        string GetFoodMonitorCount(string category, string foodname, string site);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/GetFoodMonitorsByPage", ReplyAction="http://smarths-ndtv.com/ISmartHsService/GetFoodMonitorsByPageResponse")]
        string GetFoodMonitorsByPage(string category, string foodname, string site, int pageSize, int pageNo);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ISmartHsServiceChannel : SmartHaiShu_WebApp.HSSmartDataService.ISmartHsService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class SmartHsServiceClient : System.ServiceModel.ClientBase<SmartHaiShu_WebApp.HSSmartDataService.ISmartHsService>, SmartHaiShu_WebApp.HSSmartDataService.ISmartHsService {
        
        public SmartHsServiceClient() {
        }
        
        public SmartHsServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public SmartHsServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public SmartHsServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public SmartHsServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string AddMember(string memberJson) {
            return base.Channel.AddMember(memberJson);
        }
        
        public string ExistMemberName(string name) {
            return base.Channel.ExistMemberName(name);
        }
        
        public string FindMember(long id) {
            return base.Channel.FindMember(id);
        }
        
        public string FindMemberByName(string name) {
            return base.Channel.FindMemberByName(name);
        }
        
        public string UpdateMember(long id, string memberJson) {
            return base.Channel.UpdateMember(id, memberJson);
        }
        
        public string Login(string memberName, string password, string ip, int type) {
            return base.Channel.Login(memberName, password, ip, type);
        }
        
        public string UpdateMemberKey(string name, string orignalMemberKey, string newMemberKey) {
            return base.Channel.UpdateMemberKey(name, orignalMemberKey, newMemberKey);
        }
        
        public string FindAllStreet() {
            return base.Channel.FindAllStreet();
        }
        
        public string FindCommunityByStreet(int street) {
            return base.Channel.FindCommunityByStreet(street);
        }
        
        public string FindCommunity(int id) {
            return base.Channel.FindCommunity(id);
        }
        
        public string FindStreetGroup() {
            return base.Channel.FindStreetGroup();
        }
        
        public string AddSessionVerify(long dateTicks, string key, string confirm) {
            return base.Channel.AddSessionVerify(dateTicks, key, confirm);
        }
        
        public string ReadyToUseSessionVerify(long id) {
            return base.Channel.ReadyToUseSessionVerify(id);
        }
        
        public string CanUseSession(long dateTicks, string key, string confirm) {
            return base.Channel.CanUseSession(dateTicks, key, confirm);
        }
        
        public string CanUseSessionById(long sessionId) {
            return base.Channel.CanUseSessionById(sessionId);
        }
        
        public string FindPostSpanTypeConfig() {
            return base.Channel.FindPostSpanTypeConfig();
        }
        
        public string FindTypeConfigByCategory(int categoryId) {
            return base.Channel.FindTypeConfigByCategory(categoryId);
        }
        
        public string AddInteractPost(string title, string content, string keyword, string contractInfo, int dataSpan, long memberId) {
            return base.Channel.AddInteractPost(title, content, keyword, contractInfo, dataSpan, memberId);
        }
        
        public string GetPostCount() {
            return base.Channel.GetPostCount();
        }
        
        public string GetPostTitlesByPage(int pageNo, int pageSize) {
            return base.Channel.GetPostTitlesByPage(pageNo, pageSize);
        }
        
        public string GetPostsByPage(int pageNo, int pageSize) {
            return base.Channel.GetPostsByPage(pageNo, pageSize);
        }
        
        public string GetSpecialInteractPost(long postId) {
            return base.Channel.GetSpecialInteractPost(postId);
        }
        
        public string DeleteInteractPost(long postId) {
            return base.Channel.DeleteInteractPost(postId);
        }
        
        public string SocialInsureQuery(string cardId, string pwd) {
            return base.Channel.SocialInsureQuery(cardId, pwd);
        }
        
        public string WeatherInfoToday() {
            return base.Channel.WeatherInfoToday();
        }
        
        public string WeatherInfoFuture() {
            return base.Channel.WeatherInfoFuture();
        }
        
        public byte[] GetTrafficCodeImg() {
            return base.Channel.GetTrafficCodeImg();
        }
        
        public string GetTrafficRecode(string no, string frameNo, string type, string vcode) {
            return base.Channel.GetTrafficRecode(no, frameNo, type, vcode);
        }
        
        public string GetFavorableNewsCount() {
            return base.Channel.GetFavorableNewsCount();
        }
        
        public string GetFavorableNews(int pageSize, int pageNo) {
            return base.Channel.GetFavorableNews(pageSize, pageNo);
        }
        
        public string GetFavorableNewsTitle(int pageSize, int pageNo) {
            return base.Channel.GetFavorableNewsTitle(pageSize, pageNo);
        }
        
        public string GetEducationNewsCount() {
            return base.Channel.GetEducationNewsCount();
        }
        
        public string GetEducationleNews(int pageSize, int pageNo) {
            return base.Channel.GetEducationleNews(pageSize, pageNo);
        }
        
        public string GetEducationleNewsTitle(int pageSize, int pageNo) {
            return base.Channel.GetEducationleNewsTitle(pageSize, pageNo);
        }
        
        public string GetHealthNewsCount() {
            return base.Channel.GetHealthNewsCount();
        }
        
        public string GetHealthNews(int pageSize, int pageNo) {
            return base.Channel.GetHealthNews(pageSize, pageNo);
        }
        
        public string GetHealthNewsTitle(int pageSize, int pageNo) {
            return base.Channel.GetHealthNewsTitle(pageSize, pageNo);
        }
        
        public string GetPriceNewsCount() {
            return base.Channel.GetPriceNewsCount();
        }
        
        public string GetPriceeNews(int pageSize, int pageNo) {
            return base.Channel.GetPriceeNews(pageSize, pageNo);
        }
        
        public string GetPriceeNewsTitle(int pageSize, int pageNo) {
            return base.Channel.GetPriceeNewsTitle(pageSize, pageNo);
        }
        
        public string GetTripNewsCount() {
            return base.Channel.GetTripNewsCount();
        }
        
        public string GetTripNews(int pageSize, int pageNo) {
            return base.Channel.GetTripNews(pageSize, pageNo);
        }
        
        public string GetTripNewsTitle(int pageSize, int pageNo) {
            return base.Channel.GetTripNewsTitle(pageSize, pageNo);
        }
        
        public string GetAllFoods() {
            return base.Channel.GetAllFoods();
        }
        
        public string GetAllFoodCategories() {
            return base.Channel.GetAllFoodCategories();
        }
        
        public string GetAllMonitorSites() {
            return base.Channel.GetAllMonitorSites();
        }
        
        public string FilterFoodsByCategory(string category) {
            return base.Channel.FilterFoodsByCategory(category);
        }
        
        public string GetFoodMonitorCount(string category, string foodname, string site) {
            return base.Channel.GetFoodMonitorCount(category, foodname, site);
        }
        
        public string GetFoodMonitorsByPage(string category, string foodname, string site, int pageSize, int pageNo) {
            return base.Channel.GetFoodMonitorsByPage(category, foodname, site, pageSize, pageNo);
        }
    }
}
