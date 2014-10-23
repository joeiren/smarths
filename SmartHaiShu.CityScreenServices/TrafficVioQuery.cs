using System;
using System.Collections.Generic;
using System.Linq;

using System.Text;
using SmartHaiShu.CityScreenServices.TrafficVioService;
using SmartHaiShu.Utility;


namespace SmartHaiShu.CityScreenServices
{
    public class TrafficVioQuery
    {
        public TrafficVio[] Query(string no, string frameNo, string vcode, string type)
        {
            try
            {
                TrafficVioService.TrafficVioService service = new TrafficVioService.TrafficVioService();
                string msg;
                var result = service.LoginPass(no, frameNo, vcode, type, out  msg);
                return result;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return null;
            }
            
        }

        public byte[] CodeImg()
        {
            try
            {
                TrafficVioService.TrafficVioService service = new TrafficVioService.TrafficVioService();
                return service.GetSecodePic();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return null;
            }
        }
    }
}
