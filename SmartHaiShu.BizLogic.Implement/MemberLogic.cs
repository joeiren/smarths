using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.BizLogic.Interface;
using SmartHaisuModel;
using SmartHaiShu.Repository.Implement;

namespace SmartHaiShu.BizLogic.Implement
{
    public class MemberLogic : BaseLogic<member>,IMemberLogic
    {
        public MemberLogic() : base(RepositoryFactory.MemberRepo) { }
        public bool Exist(string userName)
        {
            return CurrentRepository.Exist(it => it.name == userName);
        }

        public member Find(string userName)
        {
            return CurrentRepository.Find(it => it.name == userName).FirstOrDefault();
        }
    }
}
