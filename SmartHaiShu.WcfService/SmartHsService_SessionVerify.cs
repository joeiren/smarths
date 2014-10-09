using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService
{
    public partial class SmartHsService
    {
        /// <summary>
        /// 插入一条验证序列
        /// </summary>
        /// <param name="dateTicks"></param>
        /// <param name="key"></param>
        /// <param name="confirm"></param>
        /// <returns></returns>
        public string AddSessionVerify(long dateTicks, string key, string confirm)
        {
            try
            {
                var result = _sessionVerifyLogic.Add(new session_verify(){create_datetime = new DateTime(dateTicks), session_key = key, verify_code = confirm});
                return new ResultFormat(1, result).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 使用验证序列
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string ReadyToUseSessionVerify(long id)
        {
            try
            {
                var result = _sessionVerifyLogic.UseSessionCode(id);
                if (result.Item1)
                {
                    return new ResultFormat(1, string.Empty).ToString();
                }
                else
                {
                    return new ResultFormat(0, result.Item2).ToString();
                }
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 查验是否可以使用该验证序列
        /// </summary>
        /// <param name="dateTicks"></param>
        /// <param name="key"></param>
        /// <param name="confirm"></param>
        /// <returns></returns>
        public string CanUseSession(long dateTicks, string key, string confirm)
        {
            try
            {
                var result = _sessionVerifyLogic.Existed(it=> it.create_datetime == new DateTime(dateTicks) && it.session_key==key && it.verify_code == confirm && it.type==0);
                if (result)
                {
                    var session = _sessionVerifyLogic.Find(
                        it =>
                            it.create_datetime == new DateTime(dateTicks) && it.session_key == key &&
                            it.verify_code == confirm && it.type == 0).FirstOrDefault();
                    if (session != null)
                    {
                        return new ResultFormat(1, session.id).ToString();
                    }
                }
                return new ResultFormat(0, string.Empty).ToString();
                
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 查验是否可以使用该验证序列
        /// </summary>
        /// <param name="sessionId"></param>
        /// <returns></returns>
        public string CanUseSessionById(long sessionId)
        {
            try
            {
                var can = _sessionVerifyLogic.CanUse(sessionId);
                return new ResultFormat(can? 1:0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString(); 
            }
        }
    }
}
