using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.Repository.Interface
{
    public  interface ICommunityRepository : IBaseRepository<community>
    {
        IEnumerable<community> FindAllStreets();

        IEnumerable<v_community> FindCommunitiesByParentId(int parentId);

        v_community FindCommunityWithParent(int id);

    }
}
