using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using SmartHaiShu.BizLogic.Implement;
using SmartHaisuModel;
using SmartHaiShu.Utility;
namespace SmartHaiShu.WcfService
{
    /// <summary>
    /// 智慧海曙社区服务
    /// </summary>
    public partial class SmartHsService
    {
        /// <summary>
        /// 添加用户（用户注册）
        /// </summary>
        /// <param name="memberJson"></param>
        /// <returns></returns>
        public string AddMember(string memberJson)
        {
            try
            {
                InvokeCheck();
                var memb = JsonConvert.DeserializeObject<member>(memberJson);
                if (memb.default_community.HasValue && memb.default_community > 0)
                {
                    var community = _communityLogic.Find((long)memb.default_community);
                    if (community == null)
                    {
                        return new ResultFormat(0, "The default_community value is not exist.").ToString();
                    }
                    memb.community = community;
                }

                if (_memberLogic.Exist(memb.name))
                {
                    return new ResultFormat(0, "用户名已存在.").ToString();
                }

                if (string.IsNullOrEmpty(memb.member_key) || (memb.member_key.Length < 6 || memb.member_key.Length > 20))
                {
                    return new ResultFormat(0, "密码长度必须是6-20位.").ToString();
                }
                else
                {
                    memb.member_key = AuthCodeSecurity.Sha256(memb.member_key);
                }

                var result = _memberLogic.Add(memb);
                if (result != null)
                {
                    return new ResultFormat(1, Convert.ToString(result.member_id)).ToString();
                }
                else
                {
                    return new ResultFormat(0, "添加用户失败！").ToString();
                }
            }
            catch (DbEntityValidationException dbEx)
            {
                return new ResultFormat(0, dbEx.Message).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 用户名是否已存在
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string ExistMemberName(string name)
        {
            try
            {
                InvokeCheck();
                var result = _memberLogic.Exist(name);
                return new ResultFormat(1, Convert.ToString(result)).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 获取用户对象
        /// </summary>
        /// <param name="id">用户id</param>
        /// <returns></returns>
        public string FindMember(long id)
        {
            try
            {
                InvokeCheck();
                MemberLogic logic = _memberLogic as MemberLogic;
                if (logic != null)
                {
                    var entity = logic.Find(id);
                    return new ResultFormat(1, new
                    {
                        member_id = entity.member_id,
                        name = entity.name,
                        phone = entity.phone,
                        mail = entity.mail,
                        address = entity.address,
                        default_community = entity.default_community
                    }).ToString();
                }
                return new ResultFormat(0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 获取用户对象
        /// </summary>
        /// <param name="name">用户名</param>
        /// <returns></returns>
        public string FindMemberByName(string name)
        {
            try
            {
                InvokeCheck();
                var result = _memberLogic.Find(name);
                if (result != null)
                {
                    return new ResultFormat(1,
                        new
                        {
                            member_id =result.member_id,
                            name = result.name,
                            phone = result.phone,
                            mail = result.mail,
                            address = result.address,
                            default_community = result.default_community
                        }).ToString();
                }
                else
                {
                    return new ResultFormat(0, "无此用户").ToString();
                }
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 更新用户
        /// </summary>
        /// <param name="id"></param>
        /// <param name="memberJson">需更新的属性</param>
        /// <returns></returns>
        public string UpdateMember(long id, string memberJson)
        {
            try
            {
                InvokeCheck();
                MemberLogic logic = _memberLogic as MemberLogic;
                member orignal = null;
                if (logic != null)
                {
                    orignal = logic.Find(id);
                }
                if (orignal == null)
                {
                    return new ResultFormat(0, "There is not exist this member id.").ToString();
                }
                var memb = JsonConvert.DeserializeObject<member>(memberJson,new JsonSerializerSettings(){NullValueHandling = NullValueHandling.Ignore });
                if (memb == null)
                {
                    return new ResultFormat(0, "The parameter 'memberJson' format is wrong.").ToString();
                }

                if (string.CompareOrdinal(memb.name, orignal.name) == 0)
                {
                    return new ResultFormat(0, "The member name can not be changed!").ToString();
                }

                if (memb.address!= null)
                {
                    orignal.address = memb.address;
                }

                if (orignal.default_community.HasValue && orignal.default_community > 0)
                {
                    if(memb.default_community.HasValue && memb.default_community > 0 && memb.default_community != orignal.default_community)
                    {
                        var comm = _communityLogic.Find(Convert.ToInt64(memb.default_community));
                        if (comm != null)
                        {
                            orignal.community = comm;
                            orignal.default_community = memb.default_community;
                        }
                    }
                }
                else
                {
                    if (memb.default_community.HasValue && memb.default_community > 0)
                    {
                        var comm = _communityLogic.Find(Convert.ToInt64(memb.default_community));
                        if (comm != null)
                        {
                            orignal.community = comm;
                            orignal.default_community = memb.default_community;
                        }
                    }
                }

                if (memb.mail != null)
                {
                    orignal.mail = memb.mail;
                }

                if (!string.IsNullOrWhiteSpace(memb.member_key))
                {
                    orignal.member_key = AuthCodeSecurity.Sha256(memb.member_key);
                }

                if (memb.phone != null)
                {
                    orignal.phone = memb.phone;
                }

                var success = _memberLogic.Update(orignal);
                return new ResultFormat(success ? 1 : 0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat( 0, ex.ToString()).ToString();
            }
            
        }

        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="memberName">用户名</param>
        /// <param name="password">密码</param>
        /// <param name="ip">ip</param>
        /// <param name="type">登陆类型：1，web 2， 手机 3，数字电视</param>
        /// <returns></returns>
        public string Login(string memberName, string password, string ip, int type)
        {
            try
            {
                InvokeCheck();
                var result = _memberLogic.Find(memberName);
                if (result != null && result.member_id > 0)
                {
                    var id = result.member_id;
                    if (System.String.CompareOrdinal(result.member_key, AuthCodeSecurity.Sha256(password)) == 0)
                    {
                        result.last_ip = ip;
                        result.last_time = DateTime.Now;
                        result.last_way = type;
                        _memberLogic.Update(result);

                        return new ResultFormat(1, new
                        {
                            address = result.address,
                            default_community = result.default_community,
                            mail = result.mail,
                            member_id = result.member_id,
                            name = result.name
                        }).ToString();
                    }
                }
                return new ResultFormat(0, "用户名或者密码错误！").ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.Message).ToString();
            }
            

        }

        /// <summary>
        /// 更新密码
        /// </summary>
        /// <param name="name"></param>
        /// <param name="orignalMemberKey"></param>
        /// <param name="newMemberKey"></param>
        /// <returns></returns>
        public string UpdateMemberKey(string name, string orignalMemberKey, string newMemberKey)
        {
            try
            {
                InvokeCheck();
                var result = _memberLogic.Find(name);
                if (result != null && result.member_key == AuthCodeSecurity.Sha256(orignalMemberKey))
                {
                    result.member_key = AuthCodeSecurity.Sha256(newMemberKey);
                    var success = _memberLogic.Update(result);
                    return new ResultFormat(success ? 1 : 0, "密码更新失败").ToString(); 
                }
                else
                {
                    return new ResultFormat(0, "原密码不正确").ToString();
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
