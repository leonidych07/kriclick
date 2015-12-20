using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using KriclickWebApp.Models;
using Microsoft.Owin.Security.DataProtection;
using Microsoft.AspNet.Identity.Owin;
using Kriclick.Common;
//using Kriclick.BLL;
using Kriclick.Common.Models;
using Kriclick.BLL;
using System.IO;

namespace KriclickWebApp.Controllers
{
    [Authorize]
    public partial class AccountController : Controller
    {
        [AllowAnonymous]
        public ActionResult CreateProfile(string UserId)
        {
            if (string.IsNullOrEmpty(UserId))
            {
                return RedirectToAction("Index", "Home");
            }

            UserRegistrationBLL userRegistrationBLL = new UserRegistrationBLL();
            UserProfileViewModel userProfileViewModel = userRegistrationBLL.GetUserProfileById(UserId);

            if (userProfileViewModel != null)
            {
                if (userProfileViewModel.UserTypeId == (int)Kriclick.Common.Enums.UserType.Personal)
                {
                    return RedirectToAction("UserProfile", "Account", new { username = userProfileViewModel.Username });
                }
                else if (userProfileViewModel.UserTypeId == (int)Kriclick.Common.Enums.UserType.Business)
                {
                    return RedirectToAction("UserProfile", "Account", new { username = userProfileViewModel.Username });
                }
            }

            ViewBag.State = CommonBLL.GetStateList();
            ViewBag.IndustryList = CommonBLL.GetIndustryTypeList();
            var userid = TempData["ViewBagUserId"];
            ViewBag.UserId = UserId;

            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> CreateProfile(UserProfileViewModel userProfileViewModel, HttpPostedFileBase LogoURL)
        {
            return await CreateUserProfile(userProfileViewModel, LogoURL);
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> CreateBusinessProfile(UserProfileViewModel userProfileViewModel, HttpPostedFileBase LogoURL)
        {
            return await CreateUserProfile(userProfileViewModel, LogoURL);
        }

        public async Task<ActionResult> CreateUserProfile(UserProfileViewModel userProfileViewModel, HttpPostedFileBase LogoURL)
        {
            ViewBag.State = CommonBLL.GetStateList();
            ViewBag.IndustryList = CommonBLL.GetIndustryTypeList();
            string logoUrlPath = "";

            if (ModelState.IsValid)
            {
                if (LogoURL != null)
                {
                    logoUrlPath = GetUploadedFilePath(LogoURL, userProfileViewModel.UserId);
                    userProfileViewModel.LogoURL = logoUrlPath;
                }

                UserRegistrationBLL registration = new UserRegistrationBLL();
                registration.UserRegistration(userProfileViewModel);

                var removeresult = await UserManager.RemovePasswordAsync(userProfileViewModel.UserId);

                var addpasswordresult = await UserManager.AddPasswordAsync(userProfileViewModel.UserId, userProfileViewModel.Password);

                var user = UserManager.FindById(userProfileViewModel.UserId);

                await SignInAsync(user, isPersistent: false);
                string code = DateTime.Now.ToFileTime().ToString();
                return RedirectToAction("ConfirmEmail", "Account", new { userId = userProfileViewModel.UserId, code = code });
            }
            return RedirectToAction("CreateProfile", new { UserId = userProfileViewModel.UserId });
        }

        public ActionResult PersonalProfileSettings()
        {
            UserProfileViewModel Result = new UserProfileViewModel();
            if (User.Identity.IsAuthenticated)
            {
                string userID = User.Identity.GetUserId();
                UserRegistrationBLL userBll = new UserRegistrationBLL();
                Result = userBll.GetUserProfileById(userID);
                if (!string.IsNullOrEmpty(Result.LogoURL))
                {
                    ViewBag.Imageurl = (!string.IsNullOrEmpty(Result.LogoURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/" + Result.LogoURL : string.Empty;
                    Result.LogoURL = ViewBag.Imageurl;
                }
                ViewBag.State = CommonBLL.GetStateList();
                ViewBag.UserId = userID;
            }
            return View(Result);
        }

        [HttpPost]
        public async Task<ActionResult> PersonalProfileSettings(UserProfileViewModel userProfileViewModel)
        {
            UserProfileViewModel Result = new UserProfileViewModel();
            if (User.Identity.IsAuthenticated)
            {
                var valueToClean = ModelState["Password"];
                valueToClean.Errors.Clear();
                valueToClean = ModelState["ConfirmPassword"];
                valueToClean.Errors.Clear();
                ViewBag.State = CommonBLL.GetStateList();

                if (ModelState.IsValid)
                {
                    string userID = User.Identity.GetUserId();
                    UserRegistrationBLL userBll = new UserRegistrationBLL();
                    Result = userBll.GetUserProfileById(userID);

                    if (!string.IsNullOrEmpty(Result.LogoURL))
                    {
                        ViewBag.Imageurl = (!string.IsNullOrEmpty(Result.LogoURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/" + Result.LogoURL : string.Empty;
                    }

                    ViewBag.UserId = userID;

                    if (string.IsNullOrEmpty(userProfileViewModel.EmailId))
                    {
                        ViewBag.ResultMessage = "-4";
                        return View(Result);
                    }

                    UserRegistrationBLL register = new UserRegistrationBLL();
                    userProfileViewModel.UserId = userID;
                    userProfileViewModel.UserProfileId = Result.UserProfileId;

                    if (!string.IsNullOrEmpty(userProfileViewModel.Password))
                    {
                        var removeresult = await UserManager.RemovePasswordAsync(userProfileViewModel.UserId);

                        var addpasswordresult = await UserManager.AddPasswordAsync(userProfileViewModel.UserId, userProfileViewModel.Password);

                        var user = UserManager.FindById(userProfileViewModel.UserId);

                        await SignInAsync(user, isPersistent: false);
                    }
                    long iResult = register.UpdateUserProfile(userProfileViewModel);

                    ViewBag.ResultMessage = iResult.ToString();

                }
            }

            return View(Result);
        }

        public ActionResult BusinessProfileSettings()
        {
            UserProfileViewModel Result = new UserProfileViewModel();
            if (User.Identity.IsAuthenticated)
            {
                string userID = User.Identity.GetUserId();
                UserRegistrationBLL userBll = new UserRegistrationBLL();
                Result = userBll.GetUserProfileById(userID);
                if (!string.IsNullOrEmpty(Result.LogoURL))
                {
                    ViewBag.Imageurl = (!string.IsNullOrEmpty(Result.LogoURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/" + Result.LogoURL : string.Empty;
                    Result.LogoURL = ViewBag.Imageurl;
                }
                ViewBag.State = CommonBLL.GetStateList();
                ViewBag.UserId = userID;
                ViewBag.IndustryList = CommonBLL.GetIndustryTypeList();
            }
            return View(Result);
        }

        [HttpPost]
        public async Task<ActionResult> BusinessProfileSettings(UserProfileViewModel userProfileViewModel)
        {
            UserProfileViewModel Result = new UserProfileViewModel();
            if (User.Identity.IsAuthenticated)
            {
                var valueToClean = ModelState["Password"];
                valueToClean.Errors.Clear();
                valueToClean = ModelState["ConfirmPassword"];
                valueToClean.Errors.Clear();
                ViewBag.State = CommonBLL.GetStateList();
                ViewBag.IndustryList = CommonBLL.GetIndustryTypeList();

                if (ModelState.IsValid)
                {
                    string userID = User.Identity.GetUserId();
                    UserRegistrationBLL userBll = new UserRegistrationBLL();
                    Result = userBll.GetUserProfileById(userID);
                    if (!string.IsNullOrEmpty(Result.LogoURL))
                    {
                        ViewBag.Imageurl = (!string.IsNullOrEmpty(Result.LogoURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/" + Result.LogoURL : string.Empty;
                    }

                    ViewBag.UserId = userID;

                    if (string.IsNullOrEmpty(userProfileViewModel.EmailId))
                    {
                        ViewBag.ResultMessage = "-4";
                        return View(Result);
                    }

                    UserRegistrationBLL register = new UserRegistrationBLL();
                    userProfileViewModel.UserId = userID;
                    userProfileViewModel.UserProfileId = Result.UserProfileId;
                    userProfileViewModel.UserTypeId = Result.UserTypeId;

                    if (!string.IsNullOrEmpty(userProfileViewModel.Password))
                    {
                        var removeresult = await UserManager.RemovePasswordAsync(userProfileViewModel.UserId);

                        var addpasswordresult = await UserManager.AddPasswordAsync(userProfileViewModel.UserId, userProfileViewModel.Password);

                        var user = UserManager.FindById(userProfileViewModel.UserId);

                        await SignInAsync(user, isPersistent: false);
                    }

                    long iResult = register.UpdateUserProfile(userProfileViewModel);
                    ViewBag.ResultMessage = iResult.ToString();
                }
            }
            return View(Result);
        }

        [HttpPost]
        public async Task<bool> UpdatePassword(UserPasswordModel userPasswordModel)
        {
            bool result = false;
            if (User.Identity.IsAuthenticated)
            {
                string userID = User.Identity.GetUserId();
                if (!string.IsNullOrEmpty(userPasswordModel.Password))
                {
                    if (ModelState.IsValid)
                    {
                        var removeresult = await UserManager.RemovePasswordAsync(userID);

                        var addpasswordresult = await UserManager.AddPasswordAsync(userID, userPasswordModel.Password);

                        var user = UserManager.FindById(userID);

                        await SignInAsync(user, isPersistent: false);
                        result = true;
                    }
                }
            }
            return result;
        }

        public string GetUserIdFromRoute()
        {
            string userID = string.Empty; 
            string UserName = string.Empty;

            if (ControllerContext.RouteData.Values["username"] == null)
            {
                userID = string.Empty;
                return userID;
            }

            UserName = (string.IsNullOrEmpty(ControllerContext.RouteData.Values["username"].ToString())) ? string.Empty : ControllerContext.RouteData.Values["username"].ToString();
            var CurrentUser = UserManager.FindByName(UserName);

            if (CurrentUser == null)
            {
                userID = string.Empty;
            }
            else
            {
                userID = CurrentUser.Id;
            }
            return userID;
        }

        [AllowAnonymous]
        public ActionResult UserProfile()
        {
            string userID = GetUserIdFromRoute();            

            UserProfileViewModel Result = new UserProfileViewModel();
            UserRegistrationBLL userBll = new UserRegistrationBLL();

            if (userID == string.Empty)
            {
                Result.UserId = Guid.Empty.ToString();
                return View(Result);
            }

            Result = userBll.GetUserProfileById(userID);
            Result.ProfileHeaderURL = (!string.IsNullOrEmpty(Result.ProfileHeaderURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/UserProfileHeaderImages/" + Result.ProfileHeaderURL : string.Empty;
            Result.LogoURL = (!string.IsNullOrEmpty(Result.LogoURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/" + Result.LogoURL : string.Empty;

            return View(Result);
        }

        [AllowAnonymous]
        public ActionResult PersonalProfile(string Username = "")
        {
            //UserProfileViewModel Result = new UserProfileViewModel();
            
            //string userID = (string.IsNullOrEmpty(Username)) ? User.Identity.GetUserId() : GetUserIdFromRoute();
            //UserRegistrationBLL userBll = new UserRegistrationBLL();
            //Result = userBll.GetUserProfileById(userID);
            //Result.ProfileHeaderURL = (!string.IsNullOrEmpty(Result.ProfileHeaderURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/UserProfileHeaderImages/" + Result.ProfileHeaderURL : string.Empty;

            //if (!string.IsNullOrEmpty(Result.LogoURL))
            //{
            //    ViewBag.Imageurl = (!string.IsNullOrEmpty(Result.LogoURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/" + Result.LogoURL : string.Empty;
            //}           

            //return View(Result);
            return View();
        }

        [AllowAnonymous]
        public ActionResult BusinessProfile(string Username = "")
        {
            //UserProfileViewModel Result = new UserProfileViewModel();
           
            //string userID = (string.IsNullOrEmpty(Username)) ? User.Identity.GetUserId() : GetUserIdFromRoute();
            //UserRegistrationBLL userBll = new UserRegistrationBLL();
            //Result = userBll.GetUserProfileById(userID);
            //Result.ProfileHeaderURL = (!string.IsNullOrEmpty(Result.ProfileHeaderURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/UserProfileHeaderImages/" + Result.ProfileHeaderURL : string.Empty;

            //if (!string.IsNullOrEmpty(Result.LogoURL))
            //{
            //    ViewBag.Imageurl = (!string.IsNullOrEmpty(Result.LogoURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/" + Result.LogoURL : string.Empty;
            //}

            //return View(Result);
            return View();
        }

        public string GetUploadedFilePath(HttpPostedFileBase Reportfile, string userId)
        {
            string UploadedFolderPath = Server.MapPath("~/Uploads/");
            if (!Directory.Exists(UploadedFolderPath))
            {
                Directory.CreateDirectory(UploadedFolderPath);
            }
            var fileName = string.Format("{0}_{1}", userId, Path.GetFileName(Reportfile.FileName));

            UploadedFolderPath += fileName;

            if (System.IO.File.Exists(UploadedFolderPath))
            {
                try
                {
                    System.IO.File.Delete(UploadedFolderPath);
                }
                catch { }
            }

            try
            {
                Reportfile.SaveAs(UploadedFolderPath);
            }
            catch { }

            string fl = UploadedFolderPath.Substring(UploadedFolderPath.LastIndexOf("\\"));
            string[] split = fl.Split('\\');
            string newpath = split[1];
            string imagepath = newpath;
            return imagepath;
        }
    }
}