using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.BizLogic.Interface;
using SmartHaiShu.Repository.Implement;
using SmartHaiShu.Repository.Interface;
using SmartHaisuModel;

namespace SmartHaiShu.BizLogic.Implement
{
    public class CommunityLogic : BaseLogic<community>, ICommunityLogic
    {
        public CommunityLogic()
            : base(RepositoryFactory.CommunityRepo)
        {
        }

        public IEnumerable<community> FindAllStreets()
        {
            var repository = CurrentRepository as CommunityRepository;
            return repository != null ? repository.FindAllStreets() : null;
        }

        public IEnumerable<v_community> FindCommunitiesByStreet(int praentId)
        {
            var repository = CurrentRepository as CommunityRepository;
            return repository != null ? repository.FindCommunitiesByParentId(praentId) : null;
        }

        public v_community FindCommunityWithParent(int communityId)
        {
            var repository = CurrentRepository as CommunityRepository;
            return repository != null ? repository.FindCommunityWithParent(communityId) : null;
        }
    }
}
