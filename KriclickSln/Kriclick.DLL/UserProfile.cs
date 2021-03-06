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
    
    public partial class UserProfile
    {
        public UserProfile()
        {
            this.UserReviews = new HashSet<UserReview>();
        }
    
        public long UserProfileId { get; set; }
        public string UserId { get; set; }
        public Nullable<byte> UserTypeId { get; set; }
        public Nullable<short> IndustryTypeId { get; set; }
        public string FirstName { get; set; }
        public string LogoURL { get; set; }
        public string CompanyName { get; set; }
        public string PhoneNo { get; set; }
        public string Address { get; set; }
        public Nullable<int> StateId { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string Website { get; set; }
        public Nullable<bool> IsSpotFinder { get; set; }
        public Nullable<bool> IsVerified { get; set; }
        public Nullable<decimal> OverallRating { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<System.DateTime> LastModifiedDate { get; set; }
        public string Location { get; set; }
        public string fb { get; set; }
        public string twitter { get; set; }
        public string Instagram { get; set; }
        public string googleplus { get; set; }
        public string pinterest { get; set; }
        public string LastName { get; set; }
        public string ProfileHeaderURL { get; set; }
        public string youtubeurl { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual IndustryType IndustryType { get; set; }
        public virtual State State { get; set; }
        public virtual UserType UserType { get; set; }
        public virtual ICollection<UserReview> UserReviews { get; set; }
    }
}
