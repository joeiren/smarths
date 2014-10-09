using System.Linq;
using SmartHaisuModel;

namespace SmartHaiShu.WcfService.OpenDataLogic
{
    public class DzkBizLogic
    {
        public string LocateCommunityName(string addressSpec)
        {
            var record = (from entity in ContextFactory.GetOpenDataContext().Db_dzk_bzxxdzk
                where entity.Address.Contains(addressSpec)
                select entity).FirstOrDefault();
            return record != null ? record.SQ : string.Empty;
        }
    }
}
