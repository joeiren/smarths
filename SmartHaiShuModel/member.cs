//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartHaisuModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class member
    {
        // Primitive properties
    
        public long member_id { get; set; }
        public string name { get; set; }
        public string member_key { get; set; }
        public string phone { get; set; }
        public string mail { get; set; }
        public string address { get; set; }
        public Nullable<int> default_community { get; set; }
        public string last_ip { get; set; }
        public Nullable<System.DateTime> last_time { get; set; }
        public Nullable<int> last_way { get; set; }
    
        // Navigation properties
    
        public virtual community community { get; set; }
    
    }
}
