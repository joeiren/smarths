using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


namespace SmartHaiShu.WcfService
{
    public partial class SmartHsService
    {
        /// <summary>
        /// 查找所有街道列表
        /// </summary>
        /// <returns></returns>
        public string FindAllStreet()
        {
            try
            {
                var streets = _communityLogic.FindAllStreets().ToList();
                return new ResultFormat(1, streets).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 查找所有社区按街道分组
        /// </summary>
        /// <returns></returns>
        public string FindStreetGroup()
        {
            try
            {
                var streets = _communityLogic.FindAllStreets().ToList();
                var list = new List<dynamic>();
                foreach (var street in streets)
                {
                    var comms = _communityLogic.FindCommunitiesByStreet(street.community_id);
                    dynamic jObj = new ExpandoObject();
                    jObj.street_id = street.community_id;
                    jObj.name = street.name;
                    var commList = new List<dynamic>();
                    foreach (var comm in comms)
                    {
                        commList.Add(new
                        {
                            community_id = comm.community_id,
                            community_name = comm.name
                        });
                    }
                    jObj.child_community = commList;
                    list.Add(jObj);
                }

                return new ResultFormat(1, list).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 根据街道查找所有社区
        /// </summary>
        /// <param name="street"></param>
        /// <returns></returns>
        public string FindCommunityByStreet(int street)
        {
            try
            {
                var communities = _communityLogic.FindCommunitiesByStreet(street).ToList();
                return new ResultFormat(1, communities).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }

        /// <summary>
        /// 根据id查找社区
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string FindCommunity(int id)
        {
            try
            {
                var communities = _communityLogic.FindCommunityWithParent(id);
                return new ResultFormat(1, communities).ToString();
            }
            catch (Exception ex)
            {
                return new ResultFormat(0, ex.ToString()).ToString();
            }
        }
    }
}
