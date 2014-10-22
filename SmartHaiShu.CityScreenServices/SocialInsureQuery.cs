using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.CityScreenServices.SocialInsureService;
using SmartHaiShu.Utility;


namespace SmartHaiShu.CityScreenServices
{
    public class SocialInsureQuery
    {
        public IEnumerable <MonthInsure> Query(string idCard, string pwd)
        {
            try
            {
                SocialInsureService.SocialInsureService service = new SocialInsureService.SocialInsureService();
                AccountInfo account;
                MedicalInsure medicalInsure;

                var monthInfo = service.GetSocialInsure(idCard, pwd, out account, out medicalInsure);
                return monthInfo;
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return null;
            }
        }
    }
}
