using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.BizLogic.Interface;
using SmartHaiShu.Repository.Implement;
using SmartHaisuModel;


namespace SmartHaiShu.BizLogic.Implement
{
    public class InteractPostLogic : BaseLogic <interact_post>, IInteractPostLogic
    {
        public InteractPostLogic() : base(RepositoryFactory.InteractPostRepo)
        {
        }

        public IEnumerable <interact_post> LoadPostListByPage(int pageNo, int pageSize)
        {
            return
                CurrentRepository.Find(it => it.state.HasValue && it.state.Value != 0).OrderByDescending(
                                                                                                         it =>
                                                                                                             it
                                                                                                                 .release_time)
                                 .Skip(pageSize*Math.Max(0, pageNo - 1)).Take(pageSize);
        }

        public int Count()
        {
            return CurrentRepository.Count(it => it.state.HasValue && it.state.Value != 0);
        }
    }
}