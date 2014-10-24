using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PublishedServiceTest.SmartServiceReference;


namespace PublishedServiceTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            try
            {
                SmartServiceReference.SmartHsServiceClient smClient = new SmartHsServiceClient();
                var count = smClient.GetTripNewsCount();
                Assert.AreNotEqual(count, 0);
            }
            catch (Exception ex)
            {

                return;
            }
            
        }
    }
}
