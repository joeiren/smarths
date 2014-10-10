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
        /// 
        /// </summary>
        public const int POST_SPAN_CATEGORY = 11;

        /// <summary>
        /// 获取配置类型
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public string FindTypeConfigByCategory(int categoryId)
        {
            try
            {
                var result = _globalTypeConfigLogic.FindTypeByCategory(categoryId).ToList();

                var simple = from it in result
                             select new
                             {
                                 Id = it.type_id,
                                 Name = it.type_name
                             };
                return new ResultFormat(1, simple).ToString();
            }
            catch (Exception ex)
            {
                LogHelper.GetInstance().Error(ex.ToString());
                return new ResultFormat(0, ex.Message).ToString();
            }
        }

        /// <summary>
        /// 获取“互帮互助-时间范围”配置类型
        /// </summary>
        /// <returns></returns>
        public string FindPostSpanTypeConfig()
        {
            return FindTypeConfigByCategory(POST_SPAN_CATEGORY);
        }

    }
}