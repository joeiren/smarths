using System;
using System.Collections.Generic;
using System.Linq;

using System.Text;

namespace SmartHaiShu.CityScreenServices
{
    public class TrafficVioQuery
    {
        public string Query()
        {
           TrafficVioService.TrafficVioService service = new TrafficVioService.TrafficVioService();
            //service.LoginPass();
            return "";
        }

        public byte[] CodeImg()
        {
            TrafficVioService.TrafficVioService service = new TrafficVioService.TrafficVioService();
            return service.GetSecodePic();
        }
    }
}
