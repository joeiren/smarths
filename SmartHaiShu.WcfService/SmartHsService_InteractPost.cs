using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.BizLogic.Implement;
using SmartHaisuModel;


namespace SmartHaiShu.WcfService
{
    public partial class SmartHsService
    {
        /// <summary>
        /// 添加互帮互助
        /// </summary>
        /// <param name="title"></param>
        /// <param name="content"></param>
        /// <param name="keyword"></param>
        /// <param name="contractInfo"></param>
        /// <param name="dataSpan"></param>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public string AddInteractPost(string title, string content, string keyword, string contractInfo, int dataSpan,
                                      long memberId)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(title))
                {
                    return new ResultFormat(0, "title不能为空").ToString();
                }

                if (string.IsNullOrWhiteSpace(content))
                {
                    return new ResultFormat(0, "content不能为空").ToString();
                }
                var entity = new interact_post();
                if (memberId > 0)
                {
                    var memb = _memberLogic.FindBy(memberId);
                    if (memb != null)
                    {
                        entity.member_name = memb.name;
                        entity.member_id = memberId;
                    }
                    else
                    {
                        return new ResultFormat(0, "memberId不存在").ToString();
                    }
                }

                entity.title = title;
                entity.content = content;
                entity.keyword = keyword;
                entity.contact_info = contractInfo;
                entity.data_span = dataSpan;
                entity.release_time = DateTime.Now;
                entity.state = 1;
                var result = _interactPostLogic.Add(entity);
                if (result.member_id > 0)
                {
                    return new ResultFormat(1, result.member_id).ToString();
                }
                return new ResultFormat(0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 获取 互帮互助 条数
        /// </summary>
        /// <returns></returns>
        public string GetPostCount()
        {
            try
            {
                var count = _interactPostLogic.Count();
                return new ResultFormat(1, count).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 获取 互帮互助 列表（只包含标题）
        /// </summary>
        /// <param name="pageNo">页号(大于0)</param>
        /// <param name="pageSize">每页大小(小于20)</param>
        /// <returns></returns>
        public string GetPostTitlesByPage(int pageNo, int pageSize)
        {
            try
            {
                var result = _interactPostLogic.LoadPostListByPage(pageNo, pageSize).ToList();
                PostDataSpanTypes = _globalTypeConfigLogic.FindTypeByCategory(POST_SPAN_CATEGORY).ToList();
                
                return new ResultFormat(1,
                    from it in result
                    select new
                    {
                        Id = it.post_id,
                        Title = it.title,
                        Keyword = it.keyword,
                        Contact = it.contact_info,
                        ReleaseTime = it.release_time,
                        DateSpan = PostDataSpanTypes.Where(span =>it.data_span.HasValue && span.type_id == it.data_span).Select(type => type.type_name).FirstOrDefault()
                    }
                    ).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 获取 互帮互助 列表
        /// </summary>
        /// <param name="pageNo">页号(大于0)</param>
        /// <param name="pageSize">每页大小(小于20)</param>
        /// <returns></returns>
        public string GetPostsByPage(int pageNo, int pageSize)
        {
            try
            {
                var result = _interactPostLogic.LoadPostListByPage(pageNo, pageSize).ToList();
                PostDataSpanTypes = _globalTypeConfigLogic.FindTypeByCategory(POST_SPAN_CATEGORY).ToList();

                return new ResultFormat(1,
                    from it in result
                    select new
                    {
                        Id = it.post_id,
                        Title = it.title,
                        Keyword = it.keyword,
                        Contact = it.contact_info,
                        ReleaseTime = it.release_time,
                        Content = it.content,
                        DateSpan = PostDataSpanTypes.Where(span => it.data_span.HasValue && span.type_id == it.data_span).Select(type => type.type_name).FirstOrDefault()
                    }
                    ).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 根据id获取指定的互帮互助
        /// </summary>
        /// <param name="postId"></param>
        /// <returns></returns>
        public string GetSpecialInteractPost(long postId)
        {
            try
            {
                var result = _interactPostLogic.Find(it => it.post_id == postId).FirstOrDefault();
                if (result != null)
                {
                    PostDataSpanTypes = _globalTypeConfigLogic.FindTypeByCategory(POST_SPAN_CATEGORY).ToList();
                    return new ResultFormat(1,
                    new
                    {
                        Id = result.post_id,
                        Title = result.title,
                        Keyword = result.keyword,
                        Contact = result.contact_info,
                        ReleaseTime = result.release_time,
                        Content = result.content,
                        DateSpan = PostDataSpanTypes.Where(span => result.data_span.HasValue && span.type_id == result.data_span).Select(type => type.type_name).FirstOrDefault()
                    }
                    ).ToString();
                }
                return new ResultFormat(0, string.Empty).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 删除指定的互帮互助
        /// </summary>
        /// <param name="postId">互帮互助id</param>
        /// <returns></returns>
        public string DeleteInteractPost(long postId)
        {
            try
            {
                var entity = _interactPostLogic.Find(postId);
                if (entity != null && entity.post_id == postId)
                {
                    entity.state = 0;
                    var result = _interactPostLogic.Update(entity);
                    if (result)
                    {
                        return new ResultFormat(1, string.Empty).ToString();
                    }
                    return new ResultFormat(0, "删除失败").ToString();
                }
                else
                {
                    return new ResultFormat(0, string.Format("未找到id={0}的记录", postId)).ToString();
                }
                
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        private IEnumerable <global_type_config> PostDataSpanTypes
        {
            get;
            set;
        }
    }
}