using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using SmartHaiShu.BizLogic.Interface;
using SmartHaiShu.Repository.Implement;
using SmartHaisuModel;

namespace SmartHaiShu.BizLogic.Implement
{
    public class SessionVerifyLogic : BaseLogic<session_verify>, ISessionVerifyLogic
    {
        public SessionVerifyLogic()
            : base(RepositoryFactory.SessionVerifyRepo)
        {
        }

        public bool HasExpired(DateTime create, string key, string confirmCode)
        {
            var item = CurrentRepository.Find(
                it => it.create_datetime == create && it.session_key == key && it.verify_code == confirmCode)
                .FirstOrDefault();
            if (item != null)
            {
                return item.create_datetime.AddDays(7) < DateTime.Now;
            }
            return true;
        }

        public bool CanUse(long id)
        {
            var entity = CurrentRepository.Find(id);
            if (entity != null && entity.type == 0 && entity.create_datetime.AddDays(7) > DateTime.Now)
            {
                return true;
            }
            return false;
        }

        public bool Existed(Expression<Func<session_verify, bool>> whereLambda)
        {
            return CurrentRepository.Find(whereLambda).Any();
        }

        public Tuple<bool, string> UseSessionCode(long id)
        {
            try
            {
                var result = CurrentRepository.Find(id);
                if (result != null)
                {
                    if (result.type != 0 || result.create_datetime.AddDays(7) < DateTime.Now)
                    {
                        return new Tuple<bool, string>(false, "expired");
                    }
                    else
                    {
                        result.type = 1;
                        var success = CurrentRepository.Update(result);
                        return new Tuple<bool, string>(success, string.Empty);
                    }
                }
                else
                {
                    return new Tuple<bool, string>(false, "not existed");
                }

            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
    }
}
