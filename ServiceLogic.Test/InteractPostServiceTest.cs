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
            var result = service.AddInteractPost("test post111", "互帮互助test post 内容", "Post 招聘", "手机号：te9090090", 108, 15);

            result = service.AddInteractPost("mCake寻找周末营业员兼职", "本店主要经营和销售蛋糕，面包类食品，牛奶，酸奶等食品。\r\n现急需一名女性营业员，年龄在18-35岁，高中以上学历。本市户口为佳。\r\n时间为周六，周日一天或者两天。上班时间8:30 -- 18:30。\r\n本店为汪弄社区东边，卖鱼路xxx号的MyCake蛋糕店。\r\n待遇面议。", "兼职", "手机：186xxxx9800 。 微信号：mCake2010", 105, 16);
            result = service.AddInteractPost("寻狗启示", "本人于昨日（2014-09-10）丢失。。。", "寻物", "手机号：13655xxxxxx12", 107, 16);
            result = service.AddInteractPost("兼职营业员 ", "本人于急需一名。。。", "兼职", "qq：655xxxxxx12", 107, 16);
            result = service.AddInteractPost("test post111", "互帮互助test post 内容", "Post 招聘", "手机号：te9090090", 108, 15);
            result = service.AddInteractPost("test 222", "互帮互助test post 内容", "Post 招聘", "手机号：te9090090", 108, 15);
            result = service.AddInteractPost("test post123", "互帮互助test post 内容", "招聘", "手机号：te9090090", 108, 15);
            result = service.AddInteractPost("test df标题", "互帮互助test post 内容", "招聘", "手机号：te9090090", 108, 15);
            result = service.AddInteractPost("test post标题", "互帮互助test post 内容", "招聘", "手机号：te9090090", 108, 15);
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
