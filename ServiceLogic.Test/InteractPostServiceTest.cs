using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SmartHaiShu.Utility;
using SmartHaiShu.WcfService;


namespace ServiceLogic.Test
{
    [TestClass]
    public class InteractPostServiceTest
    {
        [TestMethod]
        public void AddPostTest()
        {
            SmartHsService service = new SmartHsService();
            var result = service.AddInteractPost("test post", "互帮互助test post 内容", "Post 招聘", "手机号：13900087666", 106, 8);
            Assert.IsTrue(result.JObjCodeTrue());
            Assert.AreNotEqual(result.JobjMessageConvert<long>(), 0);
        }


        [TestMethod]
        public void PostCountTest()
        {
            SmartHsService service = new SmartHsService();
            var result = service.GetPostCount();
            Assert.IsTrue(result.JObjCodeTrue());
            Assert.AreNotEqual(result.JobjMessageConvert<long>(), 0);
        }

        [TestMethod]
        public void GetPostTitlesTest()
        {
            SmartHsService service = new SmartHsService();
            var result = service.GetPostTitlesByPage(1,5);
            Assert.IsTrue(result.JObjCodeTrue());
            Assert.AreNotEqual(result.JObjMessageToken().Count(), 0);
        }

        [TestMethod]
        public void GetPostsTest()
        {
            SmartHsService service = new SmartHsService();
            var result = service.GetPostsByPage(1, 5);
            Assert.IsTrue(result.JObjCodeTrue());
            Assert.AreNotEqual(result.JObjMessageToken().Count(), 0);
        }

        [TestMethod]
        public void GetSpecialPostTest()
        {
            SmartHsService service = new SmartHsService();
            var result = service.GetSpecialInteractPost(2);
            Assert.IsTrue(result.JObjCodeTrue());
            Assert.AreNotEqual(result.JObjMessageToken().Count(), 0);
        }

    }
}
