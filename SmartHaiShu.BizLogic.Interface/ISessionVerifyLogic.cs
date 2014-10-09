using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using SmartHaisuModel;

namespace SmartHaiShu.BizLogic.Interface
{
    public interface ISessionVerifyLogic: IBaseLogic<session_verify>
    {
        bool HasExpired(DateTime create, string key, string confirmCode);

        bool Existed(Expression<Func<session_verify, bool>> whereLambda);

        Tuple<bool, string> UseSessionCode(long id);
    }
}
