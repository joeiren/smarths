using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;


namespace SmartHaiShu.BizLogic.Interface
{
    public interface IGlobalTypeConfigLogic : IBaseLogic <global_type_config>
    {
        IEnumerable <global_type_config> FindTypeByCategory(int categoryId);

    }
}
