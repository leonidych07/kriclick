using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Kriclick.Common.Models
{
    public class UserProfileViewModel : UserCommonProfileModel
    {
        public UserProfileViewModel()
        {
            BusinessProfileViewModel = new BusinessProfileViewModel();
        }
        public BusinessProfileViewModel BusinessProfileViewModel { get; set; }
    }

    public class BusinessProfileViewModel
    {
        [Required(ErrorMessage = "Please select industry type")]
        public Nullable<short> IndustryTypeId { get; set; }

        [Required(ErrorMessage = "Please enter company name")]
        public string CompanyName { get; set; }

        [Required(ErrorMessage = "Please enter address")]
        public string Address { get; set; }
        [Url]
        public string Website { get; set; }

        public bool IsSpotFinder { get; set; }
    }

    public class UserCommonProfileModel
    {
        [Key]
        public long UserProfileId { get; set; }

        public string UserId { get; set; }

        public byte UserTypeId { get; set; }

        [Required(ErrorMessage = "Please enter username")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Please enter password")]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Please enter confirm password")]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Password does not match the confirm password")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Please enter first name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Please enter last name")]
        public string LastName { get; set; }

        public string LogoURL { get; set; }

        [Required(ErrorMessage = "Please enter phone no")]
        //[RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Please enter phone no in this format (111-111-1111)")]
        public string PhoneNo { get; set; }

        [Required(ErrorMessage = "Please select state")]
        public Nullable<int> StateId { get; set; }

        [Required(ErrorMessage = "Please enter city")]
        public string City { get; set; }

        [Required(ErrorMessage = "Please enter zip")]
        public string ZipCode { get; set; }

        public System.DateTime CreatedDate { get; set; }

        public Nullable<System.DateTime> LastModifiedDate { get; set; }

        public Nullable<bool> IsVerified { get; set; }

        public Nullable<decimal> OverallRating { get; set; }

        public string Location { get; set; }

        public string fb { get; set; }

        public string twitter { get; set; }

        public string Instagram { get; set; }

        public string googleplus { get; set; }

        public string pinterest { get; set; }

        public string StateName { get; set; }

        public string EmailId { get; set; }

        public string youtubeurl { get; set; }

        public string ProfileHeaderURL { get; set; }
    }

    public class UserPasswordModel
    {
        [Required(ErrorMessage = "Please enter password")]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Please enter confirm password")]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Password does not match the confirm password")]
        public string ConfirmPassword { get; set; }
    }
}