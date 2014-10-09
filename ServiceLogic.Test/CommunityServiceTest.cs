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
    public class CommunityServiceTest
    {
        [TestMethod]
        public void FindAllStreetTest()
        {
            SmartHsService service = new SmartHsService();
            var result = service.FindAllStreet();
            var community = JsonConvert.DeserializeObject<community>(result);
            Assert.AreEqual(JObject.Parse(result)["Code"], 1);
        }

        [TestMethod]
        public void FindCommunityByStreetTest()
        {
            SmartHsService service = new SmartHsService();
            var result = service.FindCommunityByStreet(3);
            var community = JsonConvert.DeserializeObject(result);
            Assert.AreEqual(JObject.Parse(result)["Code"], 1);
        }

        [TestMethod]
        public void FindStreetGroupTest()
        {
            SmartHsService service = new SmartHsService();
            var result = service.FindStreetGroup();
           
        }
    }
}
