using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using Newtonsoft.Json;
using SmartHaiShu.BizLogic.Implement;
using SmartHaiShu.BizLogic.Interface;
using SmartHaiShu.WcfService.OpenDataLogic;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService
{
    // 注意: 使用“重构”菜单上的“重命名”命令，可以同时更改代码和配置文件中的类名“Service1”。

    public partial class SmartHsService : ISmartHsService
    {
        //public string GetData(int value)
        //{
        //    return string.Format("You entered: {0}", value);
        //}

        //public CompositeType GetDataUsingDataContract(CompositeType composite)
        //{
        //    if (composite == null)
        //    {
        //        throw new ArgumentNullException("composite");
        //    }
        //    if (composite.BoolValue)
        //    {
        //        composite.StringValue += "Suffix";
        //    }
        //    return composite;
        //}
        private const string DefaultUri = "http://smarths-ndtv.com";
        IMemberLogic _memberLogic = new MemberLogic();
        CommunityLogic _communityLogic = new CommunityLogic();
        SessionVerifyLogic _sessionVerifyLogic = new SessionVerifyLogic();
        GlobalTypeConfigLogic _globalTypeConfigLogic = new GlobalTypeConfigLogic();
        InteractPostLogic _interactPostLogic = new InteractPostLogic();

        private static bool AuthenticationPrecondition()
        {
            var user = GetHeaderValue("user", DefaultUri);
            var pwd = GetHeaderValue("pwd", DefaultUri);

            if (!string.IsNullOrEmpty(user) && !string.IsNullOrEmpty(pwd))
            {
                return true;
            }
            return false;
        }

        private static string GetHeaderValue(string name, string ns = DefaultUri)
        {
            var headers = OperationContext.Current.IncomingMessageHeaders;
            var index = headers.FindHeader(name, ns);
            return index > -1 ? headers.GetHeader<string>(index) : null;
        }
        [Conditional("RELEASE")]
        private static void InvokeCheck()
        {
            if (!AuthenticationPrecondition())
            {
                throw new ArgumentException("Unauthorized Invoke!");
            }
        }
        
    }
}
