using Kriclick.Common.Models;
using Kriclick.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kriclick.BLL
{
    public class UserRegistrationBLL
    {
        /// <summary>
        /// This method is used to user registration
        /// </summary>
        /// <param name="userProfileViewModel"></param>
        /// <returns></returns>
        public long UserRegistration(UserProfileViewModel userProfileViewModel)
        {
            long iResult = -1;
            try
            {
                using (KriclickDBEntities dbContext = new KriclickDBEntities())
                {
                    AspNetUser dbaspnetUser = dbContext.AspNetUsers.Where(t => t.UserName.ToLower() == userProfileViewModel.Username.ToLower() && t.Id.ToLower() != userProfileViewModel.UserId.ToLower()).FirstOrDefault();
                    if (dbaspnetUser != null)
                    {
                        iResult = -2;
                        return iResult;
                    }

                    dbaspnetUser = dbContext.AspNetUsers.Where(t => t.Id.ToLower() == userProfileViewModel.UserId.ToLower()).FirstOrDefault();
                    if (dbaspnetUser != null)
                    {
                        dbaspnetUser.UserName = userProfileViewModel.Username.Trim();
                    }

                    UserProfile userProfile = new UserProfile();

                    userProfile.UserTypeId = userProfileViewModel.UserTypeId;
                    userProfile.FirstName = userProfileViewModel.FirstName;
                    userProfile.LastName = userProfileViewModel.LastName;
                    userProfile.LogoURL = userProfileViewModel.LogoURL;
                    userProfile.PhoneNo = userProfileViewModel.PhoneNo;
                    userProfile.StateId = userProfileViewModel.StateId;
                    userProfile.City = userProfileViewModel.City;
                    userProfile.ZipCode = userProfileViewModel.ZipCode;
                    userProfile.IsVerified = userProfileViewModel.IsVerified;
                    userProfile.CreatedDate = DateTime.Now;
                    userProfile.UserId = userProfileViewModel.UserId;

                    if (userProfileViewModel.UserTypeId == (int)Kriclick.Common.Enums.UserType.Business)
                    {
                        userProfile.IndustryTypeId = userProfileViewModel.BusinessProfileViewModel.IndustryTypeId;
                        userProfile.CompanyName = userProfileViewModel.BusinessProfileViewModel.CompanyName;
                        userProfile.Address = userProfileViewModel.BusinessProfileViewModel.Address;
                        userProfile.Website = userProfileViewModel.BusinessProfileViewModel.Website;
                        userProfile.IsSpotFinder = userProfileViewModel.BusinessProfileViewModel.IsSpotFinder;
                    }

                    dbContext.UserProfiles.Add(userProfile);
                    dbContext.SaveChanges();
                    iResult = userProfile.UserProfileId;
                }
            }
            catch
            {
                iResult = -1;
            }
            return iResult;
        }

        /// <summary>
        /// This method is used to check username
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string CheckUserName(string userName, string userId)
        {
            string sResult = "1";
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                AspNetUser dbaspnetUser = dbContext.AspNetUsers.Where(t => t.UserName.ToLower() == userName.ToLower() && t.Id.ToLower() != userId.ToLower()).FirstOrDefault();

                if (dbaspnetUser != null)
                {
                    sResult = "-1";
                }
            }
            return sResult;
        }

        /// <summary>
        /// This method is used to get user profile by id
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public UserProfileViewModel GetUserProfileById(string userId)
        {
            UserProfileViewModel userProfileViewModel = new UserProfileViewModel();

            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                UserProfile userProfile = dbContext.UserProfiles.Where(t => t.UserId.ToLower() == userId.ToLower()).FirstOrDefault();
                if (userProfile != null)
                {
                    AspNetUser dbaspnetUser = dbContext.AspNetUsers.Where(t => t.Id.ToLower() == userProfile.UserId.ToLower()).FirstOrDefault();

                    if (dbaspnetUser != null)
                    {
                        userProfileViewModel.Username = dbaspnetUser.UserName;
                        userProfileViewModel.EmailId = dbaspnetUser.Email;
                    }

                    userProfileViewModel.UserProfileId = userProfile.UserProfileId;
                    userProfileViewModel.UserId = userProfile.UserId;
                    userProfileViewModel.UserTypeId = (byte)userProfile.UserTypeId;

                    userProfileViewModel.FirstName = userProfile.FirstName;
                    userProfileViewModel.LastName = userProfile.LastName;

                    userProfileViewModel.LogoURL = userProfile.LogoURL;
                    userProfileViewModel.ProfileHeaderURL = userProfile.ProfileHeaderURL;

                    userProfileViewModel.PhoneNo = userProfile.PhoneNo;
                    userProfileViewModel.StateId = userProfile.StateId;

                    userProfileViewModel.StateName = (userProfile.StateId == null) ? string.Empty : userProfile.State.StateName;

                    userProfileViewModel.City = userProfile.City;
                    userProfileViewModel.ZipCode = userProfile.ZipCode;
                    userProfileViewModel.CreatedDate = userProfile.CreatedDate;
                    userProfileViewModel.LastModifiedDate = userProfile.LastModifiedDate;
                    userProfileViewModel.IsVerified = userProfile.IsVerified;
                    userProfileViewModel.OverallRating = userProfile.OverallRating;
                    userProfileViewModel.Location = userProfile.Location;

                    userProfileViewModel.fb = userProfile.fb;
                    userProfileViewModel.twitter = userProfile.twitter;
                    userProfileViewModel.Instagram = userProfile.Instagram;
                    userProfileViewModel.googleplus = userProfile.googleplus;
                    userProfileViewModel.pinterest = userProfile.pinterest;
                    userProfileViewModel.youtubeurl = userProfile.youtubeurl;

                    userProfileViewModel.BusinessProfileViewModel.IndustryTypeId = userProfile.IndustryTypeId;
                    userProfileViewModel.BusinessProfileViewModel.CompanyName = userProfile.CompanyName;
                    userProfileViewModel.BusinessProfileViewModel.Address = userProfile.Address;
                    userProfileViewModel.BusinessProfileViewModel.Website = userProfile.Website;
                    userProfileViewModel.BusinessProfileViewModel.IsSpotFinder = (userProfile.IsSpotFinder == null) ? false : true;
                }
                return userProfileViewModel;
            }
        }

        /// <summary>
        /// This method is used to update email confirmation
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public int UpdateEmailConfirmation(string userId)
        {
            int iResult = -1;
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                AspNetUser dbaspnetUser = dbContext.AspNetUsers.Where(t => t.Id.ToLower() == userId.ToLower()).FirstOrDefault();

                if (dbaspnetUser != null)
                {
                    if (dbaspnetUser.EmailConfirmed)
                    {
                        iResult = -2;
                        return iResult;
                    }
                    dbaspnetUser.EmailConfirmed = true;
                    dbContext.SaveChanges();
                    iResult = 1;
                }
            }
            return iResult;
        }

        /// <summary>
        /// This method is used to get name by user id
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string GetNameByUserID(string userId)
        {
            string iResult = "";
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                UserProfile dbUserProfile = dbContext.UserProfiles.Where(t => t.UserId.ToLower() == userId.ToLower()).FirstOrDefault();

                if (dbUserProfile != null)
                {
                    iResult = dbUserProfile.FirstName;
                }
            }
            return iResult;
        }

        /// <summary>
        /// This method is used to chek if profile is complete or not
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string CheckIfProfileComplete(string userId)
        {
            string sResult = "1";
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                UserProfile dbUserProfile = dbContext.UserProfiles.Where(t => t.UserId.ToLower() == userId.ToLower()).FirstOrDefault();

                if (dbUserProfile == null)
                {
                    sResult = "-1";
                }
            }
            return sResult;
        }

        /// <summary>
        /// This method is used to updated user profile
        /// </summary>
        /// <param name="userProfileViewModel"></param>
        /// <returns></returns>
        public long UpdateUserProfile(UserProfileViewModel userProfileViewModel)
        {
            long iResult = -1;
            try
            {
                using (KriclickDBEntities dbContext = new KriclickDBEntities())
                {
                    #region Check username in db
                    AspNetUser dbaspnetUser = dbContext.AspNetUsers.Where(t => t.UserName.ToLower() == userProfileViewModel.Username.ToLower() && t.Id.ToLower() != userProfileViewModel.UserId.ToLower()).FirstOrDefault();
                    if (dbaspnetUser != null)
                    {
                        iResult = -2;
                        return iResult;
                    }
                    #endregion

                    #region Check email in db
                    dbaspnetUser = dbContext.AspNetUsers.Where(t => t.Email.ToLower() == userProfileViewModel.EmailId.ToLower() && t.Id.ToLower() != userProfileViewModel.UserId.ToLower()).FirstOrDefault();
                    if (dbaspnetUser != null)
                    {
                        iResult = -3;
                        return iResult;
                    }
                    #endregion

                    dbaspnetUser = dbContext.AspNetUsers.Where(t => t.Id.ToLower() == userProfileViewModel.UserId.ToLower()).FirstOrDefault();
                    if (dbaspnetUser != null)
                    {
                        dbaspnetUser.UserName = userProfileViewModel.Username.Trim();
                        dbaspnetUser.Email = userProfileViewModel.EmailId.Trim();
                    }

                    #region Update userprofile
                    UserProfile dbuserProfile = dbContext.UserProfiles.Where(t => t.UserProfileId == userProfileViewModel.UserProfileId).FirstOrDefault();

                    //dbuserProfile.UserTypeId = userProfileViewModel.UserTypeId;
                    dbuserProfile.FirstName = userProfileViewModel.FirstName;
                    dbuserProfile.LastName = userProfileViewModel.LastName;
                    //dbuserProfile.LogoURL = userProfileViewModel.LogoURL;
                    dbuserProfile.PhoneNo = userProfileViewModel.PhoneNo;
                    dbuserProfile.StateId = userProfileViewModel.StateId;
                    dbuserProfile.City = userProfileViewModel.City;
                    dbuserProfile.ZipCode = userProfileViewModel.ZipCode;
                    dbuserProfile.IsVerified = userProfileViewModel.IsVerified;
                    dbuserProfile.LastModifiedDate = DateTime.Now;

                    if (userProfileViewModel.UserTypeId == (int)Kriclick.Common.Enums.UserType.Business)
                    {
                        dbuserProfile.IndustryTypeId = userProfileViewModel.BusinessProfileViewModel.IndustryTypeId;
                        dbuserProfile.CompanyName = userProfileViewModel.BusinessProfileViewModel.CompanyName;
                        dbuserProfile.Address = userProfileViewModel.BusinessProfileViewModel.Address;
                        dbuserProfile.Website = userProfileViewModel.BusinessProfileViewModel.Website;
                        dbuserProfile.IsSpotFinder = userProfileViewModel.BusinessProfileViewModel.IsSpotFinder;
                    }

                    dbuserProfile.fb = userProfileViewModel.fb;
                    dbuserProfile.twitter = userProfileViewModel.twitter;
                    dbuserProfile.Instagram = userProfileViewModel.Instagram;
                    dbuserProfile.googleplus = userProfileViewModel.googleplus;
                    dbuserProfile.youtubeurl = userProfileViewModel.youtubeurl;

                    #endregion

                    dbContext.SaveChanges();
                    iResult = 1;
                }
            }
            catch (Exception ex)
            {
                iResult = -1;
            }
            return iResult;
        }

        /// <summary>
        /// This method is used to update user profile image
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="LogoURL"></param>
        /// <returns></returns>
        public int UpdateUserProfileImage(string userId, string LogoURL)
        {
            int iResult = -1;
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                UserProfile dbUserProfile = dbContext.UserProfiles.Where(t => t.UserId.ToLower() == userId.ToLower()).FirstOrDefault();

                if (dbUserProfile != null)
                {
                    dbUserProfile.LogoURL = LogoURL;
                    dbContext.SaveChanges();
                    iResult = 1;
                }
            }
            return iResult;
        }

        /// <summary>
        /// This method is used to update user profile header image
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="ProfileHeaderURL"></param>
        /// <returns></returns>
        public int UpdateUserProfileHeaderImage(string userId, string ProfileHeaderURL)
        {
            int iResult = -1;
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                UserProfile dbUserProfile = dbContext.UserProfiles.Where(t => t.UserId.ToLower() == userId.ToLower()).FirstOrDefault();

                if (dbUserProfile != null)
                {
                    dbUserProfile.ProfileHeaderURL = ProfileHeaderURL;
                    dbContext.SaveChanges();
                    iResult = 1;
                }
            }
            return iResult;
        }

        /// <summary>
        /// This method is used to check username and email id in DB
        /// </summary>
        /// <param name="emailId"></param>
        /// <param name="userName"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string CheckUserNameAndEmailAddressInDB(string emailId, string userName, string userId = "")
        {
            string sResult = string.Empty;
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                AspNetUser dbaspnetUser = dbContext.AspNetUsers.Where(t => t.Email.ToLower() == emailId.ToLower() && t.Id.ToLower() != userId.ToLower()).FirstOrDefault();

                if (dbaspnetUser != null)
                {
                    sResult = "-1";
                    return sResult;
                }

                dbaspnetUser = dbContext.AspNetUsers.Where(t => t.UserName.ToLower() == userName.ToLower() && t.Id.ToLower() != userId.ToLower()).FirstOrDefault();

                if (dbaspnetUser != null)
                {
                    sResult = "-2";
                    return sResult;
                }
            }
            sResult = "1";
            return sResult;
        }

        /// <summary>
        /// This method is used to get user by email address or username
        /// </summary>
        /// <param name="usernameOremail"></param>
        /// <returns></returns>
        public AspNetUser FindUserInDB(string usernameOremail)
        {
            using (KriclickDBEntities dbContext = new KriclickDBEntities())
            {
                AspNetUser dbaspnetUser = dbContext.AspNetUsers.Where(t => t.Email.ToLower() == usernameOremail.ToLower() || t.UserName.ToLower() == usernameOremail.ToLower()).FirstOrDefault();
                return dbaspnetUser;                
            }
        }
    }
}
