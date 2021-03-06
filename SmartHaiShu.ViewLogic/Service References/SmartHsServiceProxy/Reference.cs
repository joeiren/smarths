﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34014
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartHaiShu.ViewLogic.SmartHsServiceProxy {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://smarths-ndtv.com", ConfigurationName="SmartHsServiceProxy.ISmartHsService")]
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
        string ReadyToUseSessionVerify(long dateTicks, string key, string confirm);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://smarths-ndtv.com/ISmartHsService/CanUseSession", ReplyAction="http://smarths-ndtv.com/ISmartHsService/CanUseSessionResponse")]
        string CanUseSession(long dateTicks, string key, string confirm);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ISmartHsServiceChannel : SmartHaiShu.ViewLogic.SmartHsServiceProxy.ISmartHsService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class SmartHsServiceClient : System.ServiceModel.ClientBase<SmartHaiShu.ViewLogic.SmartHsServiceProxy.ISmartHsService>, SmartHaiShu.ViewLogic.SmartHsServiceProxy.ISmartHsService {
        
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
        
        public string ReadyToUseSessionVerify(long dateTicks, string key, string confirm) {
            return base.Channel.ReadyToUseSessionVerify(dateTicks, key, confirm);
        }
        
        public string CanUseSession(long dateTicks, string key, string confirm) {
            return base.Channel.CanUseSession(dateTicks, key, confirm);
        }
    }
}
