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
    
    public partial class FAQ
    {
        public int FAQId { get; set; }
        public Nullable<int> FAQCategoryId { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<System.DateTime> LastModifiedDate { get; set; }
    
        public virtual FAQCategory FAQCategory { get; set; }
    }
}
