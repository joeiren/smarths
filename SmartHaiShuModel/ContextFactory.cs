using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Remoting.Messaging;

namespace SmartHaisuModel
{
    public class ContextFactory
    {
        public static SmartHsContext GetSmartHsContext()
        {
            SmartHsContext context = CallContext.GetData("SmartHsContext") as SmartHsContext;
            if (context == null)
            {
                context = new SmartHsContext();
                CallContext.SetData("SmartHsContext", context);
            }
            return context;

        }

        public static HsSmartEntities GetOpenDataContext()
        {
            HsSmartEntities context = CallContext.GetData("HsSmartEntities") as HsSmartEntities;
            if (context == null)
            {
                context = new HsSmartEntities();
                CallContext.SetData("HsSmartEntities", context);
            }
            return context;

        }
    }
}
