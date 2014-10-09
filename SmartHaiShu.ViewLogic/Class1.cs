using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.Text;
using SmartHaiShu.ViewLogic.SmartHsServiceProxy;


namespace SmartHaiShu.ViewLogic
{
    public class Class1
    {
        public static string Test()
        {
            SmartHsServiceProxy.SmartHsServiceClient smartClient = new SmartHsServiceClient();
            using (var scope = new OperationContextScope(smartClient.InnerChannel))
            {
                // 注意namespace必须和ServiceContract中定义的namespace保持一致，默认是：http://smarths-ndtv.com 
                var myNamespace = "http://smarths-ndtv.com";
                // 注意Header的名字中不能出现空格，因为要作为Xml节点名。  
                var user = MessageHeader.CreateHeader("user", myNamespace, "test");
                var pwd = MessageHeader.CreateHeader("pwd", myNamespace, "test123");
                OperationContext.Current.OutgoingMessageHeaders.Add(user);
                OperationContext.Current.OutgoingMessageHeaders.Add(pwd);
                var result = smartClient.AddMember(string.Empty);
                return null;
            }  
        }
    }
}
