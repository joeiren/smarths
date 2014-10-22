using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.CityScreenServices;
using SmartHaiShu.Utility;


namespace SmartHaiShu.WcfService
{
    public partial class SmartHsService
    {
        /// <summary>
        /// 今天天气情况
        /// </summary>
        /// <returns></returns>
        public string WeatherInfoToday()
        {
            try
            {
                var result = new WeatherQuery().QueryToday();
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 未来天气情况
        /// </summary>
        /// <returns></returns>
        public string WeatherInfoFuture()
        {
            try
            {
                var result = new WeatherQuery().QueryFurther();
                
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 社保查询
        /// </summary>
        /// <param name="cardId">账户/身份证</param>
        /// <param name="pwd">查询密码</param>
        /// <returns></returns>
        public string SocialInsureQuery(string cardId, string pwd)
        {
            try
            {
                var result = new SocialInsureQuery().Query(cardId, pwd);
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 违章查询验证码图片
        /// </summary>
        /// <returns></returns>
        public byte[] GetTrafficCodeImg()
        {
            try
            {
                var result = new TrafficVioQuery().CodeImg();
                return result;
            }
            catch (Exception)
            {

                return null;
            }
        }
    }
}
