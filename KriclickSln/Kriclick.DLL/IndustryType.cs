//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Kriclick.DLL
{
    using System;
    using System.Collections.Generic;
    
    public partial class IndustryType
    {
        public IndustryType()
        {
            this.UserProfiles = new HashSet<UserProfile>();
        }
    
        public short IndustryTypeId { get; set; }
        public string IndustryType1 { get; set; }
    
        public virtual ICollection<UserProfile> UserProfiles { get; set; }
    }
}
