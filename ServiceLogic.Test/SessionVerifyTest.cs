using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json.Linq;
using SmartHaiShu.WcfService;

namespace ServiceLogic.Test
{
    [TestClass]
    public class SessionVerifyTest
    {
        [TestMethod]
        public void AddSessionVerifyTest()
        {
            SmartHsService service = new SmartHsService();
            var tick = DateTime.Now.Ticks;
            var userKey = "121212";
            var code = Guid.NewGuid().ToString();
            var result = service.AddSessionVerify(tick, "121212", code);
            var jobj = JObject.Parse(result);
            Assert.AreEqual(jobj["Code"],1);
        }


        [TestMethod]
        public void ReadyToUserSessionVerifyTest()
        {
            //SmartHsService service = new SmartHsService();
            //long tick = 635454421094814502;
            //var userKey = "121212";
            //var code = "53c6d582-73bb-418e-b218-219d13e4478e";
            //var result = service.ReadyToUseSessionVerify(tick, "121212", code);
            //var jobj = JObject.Parse(result);
            //Assert.AreEqual(jobj["Code"], 1);
        }
    }
}
