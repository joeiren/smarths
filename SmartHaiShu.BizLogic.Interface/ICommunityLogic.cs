using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.BizLogic.Interface
{
    public interface ICommunityLogic : IBaseLogic<community>
    {
        IEnumerable<community> FindAllStreets();

        IEnumerable<v_community> FindCommunitiesByStreet(int praentId);

        v_community FindCommunityWithParent(int communityId);

    }
}
