using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.Repository.Interface;
using SmartHaisuModel;

namespace SmartHaiShu.Repository.Implement
{
    public class CommunityRepository : BaseRepository<community>, ICommunityRepository
    {
        public IEnumerable<community> FindAllStreets()
        {
            return nContext.Set<community>().Where(it => it.parent_id == 0).OrderBy(it=> it.community_id);
        }

        public IEnumerable<v_community> FindCommunitiesByParentId(int parentId)
        {
            return nContext.Set<v_community>().Where(it => it.parent_id == parentId).OrderBy(it => it.community_id);
        }

        public v_community FindCommunityWithParent(int id)
        {
            return nContext.Set<v_community>().FirstOrDefault(it => it.community_id == id);
        }
    }
}
