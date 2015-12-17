using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace KriclickWebApp.Models
{
    public class UserProfileBusinessViewModel
    {
        [Key]
        public string UserID { get; set; }
        public int UserTypeId { get; set; }
        public Nullable<short> IndustryTypeId { get; set; }
        public string FullName { get; set; }
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

        public string Username { get; set; }
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}