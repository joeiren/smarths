using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.BizLogic.Interface;
using SmartHaiShu.Repository.Implement;
using SmartHaisuModel;


namespace SmartHaiShu.BizLogic.Implement
{
    public class GlobalTypeConfigLogic : BaseLogic<global_type_config>, IGlobalTypeConfigLogic
    {
        public GlobalTypeConfigLogic() : base(RepositoryFactory.GlobalTypeConfigRepo)
        {
            
        }
        public IEnumerable<global_type_config> FindTypeByCategory(int categoryId)
        {
            return CurrentRepository.Find(it => it.category_id == categoryId && it.valid).OrderBy(it => it.type_id);
        }
    }
}
