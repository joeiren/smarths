using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using SmartHaisuModel;


namespace SmartHaiShu.BizLogic.Interface
{
    public interface IInteractPostLogic : IBaseLogic <interact_post>
    {
        IEnumerable <interact_post> LoadPostListByPage(int pageNo, int pageSize);

        int Count();
    }
}
