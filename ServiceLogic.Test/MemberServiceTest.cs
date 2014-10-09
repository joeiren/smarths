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
    public class MemberServiceTest
    {
        [TestMethod]
        public void AddMember_ParameterEmty_Test()
        {
            SmartHsService service = new SmartHsService();
            var result = service.AddMember(string.Empty);
            Assert.AreEqual(JObject.Parse(result)["Code"], 0);
        }

        [TestMethod]
        public void AddMember_WithCommunity_Test()
        {
            SmartHsService service = new SmartHsService();
            member mem = new member
            {
                address = "user1",
                default_community = 11,
                last_ip = "10.12.12.12",
                last_time = DateTime.Now,
                last_way = 1,
                mail = "test@mial.com",
                member_key = "user1",
                name = "first",
                phone = "123000"
            };
            var json = JsonConvert.SerializeObject(mem, Formatting.Indented);
            var result = service.AddMember(json);

            Assert.AreEqual(JObject.Parse(result)["Code"], 1);
        }

        [TestMethod]
        public void AddMember_WithoutCommunity_Test()
        {
            SmartHsService service = new SmartHsService();
            member mem = new member
            {
                address = "test asd",
                last_ip = "10.12.12.12",
                last_time = DateTime.Now,
                last_way = 1,
                mail = "test@mial.com",
                member_key = "user123",
                name = "user1",
                phone = "123000"
            };
            var json = JsonConvert.SerializeObject(mem, Formatting.Indented);
            var result = service.AddMember(json);

            Assert.AreEqual(JObject.Parse(result)["Code"], 1);
        }

        [TestMethod]
        public void UpdateMember_WithCommunity_Test()
        {
            SmartHsService service = new SmartHsService();
            member mem = new member();
            mem.address = "test update  address";
            mem.default_community = 31;
            mem.phone = "123000";
            var json = JsonConvert.SerializeObject(mem, Formatting.None);
            var result = service.UpdateMember(4, json);
            
            Assert.AreEqual(JObject.Parse(result)["Code"], 1);
        }

        [TestMethod]
        public void Login_Test()
        {
            SmartHsService service = new SmartHsService();
            var result = service.Login("121212", "121212", "10.26.23.254", 1);
            Assert.AreEqual(JObject.Parse(result)["Code"], 1);
        }
    }
}
