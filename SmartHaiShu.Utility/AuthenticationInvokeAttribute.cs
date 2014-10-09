using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SmartHaiShu.Utility
{
    [AttributeUsage(AttributeTargets.Method)]
    public class AuthenticationInvokeAttribute : Attribute
    {
        public string Uri { get; set; }

        public void CanInvoke()
        {
            
        }
    }
}
