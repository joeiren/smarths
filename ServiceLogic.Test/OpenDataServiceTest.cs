using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SmartHaiShu.WcfService;
using SmartHaisuModel;

namespace ServiceLogic.Test
{
    [TestClass]
    public class OpenDataServiceTest
    {
        [TestMethod]
        public void GetCommunityIntroduction_Test()
        {
            OpenDataService service = new OpenDataService();
            var result = service.GetCommunityIntroduction("华兴社区");
            //var introduction = JsonConvert.DeserializeObject(result);
            var jobj = JObject.Parse(result);
            Assert.AreEqual(jobj["Code"], 1);
            if ((int) jobj["Code"] == 1)
            {
                var msg = jobj["Message"];
                var telbook1 = msg["TelBook"].Value<string>();
            }
   
        }


        [TestMethod]
        public void GetCommunityNotice_Test()
        {
            OpenDataService service = new OpenDataService();
            var result = service.GetCommunityNotice("联南社区");
            //var introduction = JsonConvert.DeserializeObject(result);
            var jobj = JObject.Parse(result);
            Assert.AreEqual(jobj["Code"], 1);
            if ((int)jobj["Code"] == 1)
            {
                var msg = jobj["Message"];
                var telbook1 = msg["TelBook"].Value<string>();
            }


            //Assert.AreEqual(introduction["Code"], 1);

        }
    }
}
