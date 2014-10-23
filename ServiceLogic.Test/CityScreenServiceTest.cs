using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SmartHaiShu.CityScreenServices;
using SmartHaiShu.CityScreenServices.SocialInsureService;


namespace ServiceLogic.Test
{
    [TestClass]
    public class CityScreenServiceTest
    {
        [TestMethod]
        public void SocialInsureTest()
        {
            var query = new SocialInsureQuery();
            query.Query("","");
        }

        [TestMethod]
        public void WeatherTest()
        {
            var weather = new WeatherQuery();
            var result =weather.QueryToday();
        }

        [TestMethod]
        public void NewsTest()
        {
            var query = new NewsQuery();
            var news = query.EducationNews(10,0);
            news = query.FavorableNews(10, 0);
            news = query.HealthNews(10, 0);
            news = query.PriceNews(10, 0);
            news = query.TripNews(10, 0);
        }

        [TestMethod]
        public void PriceTest()
        {
            var query = new PriceQuery();
            query.QueryAllCategorys();
        }
    }
}
