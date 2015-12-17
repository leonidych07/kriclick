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
using Kriclick.DLL;

namespace KriclickWebApp.Controllers
{
    [Authorize]
    public partial class AccountController : Controller
    {
        public AccountController()
            : this(new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
        {
        }

        public AccountController(UserManager<ApplicationUser> userManager)
        {
            UserManager = userManager;
        }

        public UserManager<ApplicationUser> UserManager { get; private set; }

        //
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                UserRegistrationBLL userRegistrationBLL = new UserRegistrationBLL();
                AspNetUser aspNetUser = userRegistrationBLL.FindUserInDB(model.UserName);
                string UserName = string.Empty;

                if(aspNetUser != null)
                {
                    UserName = aspNetUser.UserName;
                }

                var user = await UserManager.FindAsync(UserName, model.Password);
                if (user != null)
                {
                    if (userRegistrationBLL.CheckIfProfileComplete(user.Id) != "-1")
                    {
                        await SignInAsync(user, model.RememberMe);
                        return RedirectToLocal(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("CreateProfile", new { UserId = user.Id });
                    }
                }
                else
                {
                    ViewBag.WrongUserNameandPwd = "1";
                    //ModelState.AddModelError("", "Invalid username or password.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {


            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            string sResult = string.Empty;
            Guid guide = new Guid();
            var password = guide + "@";
            string RoleName = "User";
            model.Password = password;
            model.ConfirmPassword = password;
            UserRegistrationBLL userRegistrationBLL = new UserRegistrationBLL();

            if (ModelState.IsValid)
            {
                sResult = userRegistrationBLL.CheckUserNameAndEmailAddressInDB(model.UserName.Trim(), model.UserName.Trim());
                
                if (sResult == "-1" || sResult == "-2")
                {
                    string UserId = UserManager.FindByEmail(model.UserName).Id.ToString();
                    ViewBag.UserID = UserId;
                    ViewBag.ProfileExistsOrNot = new UserRegistrationBLL().CheckIfProfileComplete(UserId);
                    ViewBag.UserAlreadyExists = "1";
                    return View(model);
                }                
                
                var user = new ApplicationUser() { UserName = model.UserName.Trim(), Email = model.UserName.Trim() };
                var result = await UserManager.CreateAsync(user, model.Password);

                if (result.Succeeded)
                {
                    UserManager.AddToRole(user.Id, RoleName);

                    //Genrate Registration Token
                    //var provider = new DpapiDataProtectionProvider("Asp.net");
                    //UserManager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(
                    //provider.Create("EmailConfirmation"));

                    //   string code = UserManager.GeneratePasswordResetToken(user.Id);
                    // var callbackUrl = Url.Action("VerifyPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);


                    /*var provider = new DpapiDataProtectionProvider("Asp.net");
                    UserManager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(
                    provider.Create("EmailConfirmation"));
                    var code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);*/                    

                    string code = DateTime.Now.ToFileTime().ToString();
                    var callbackUrl = Url.Action("CreateProfile", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                    
                    //callbackUrl must be send to email
                    bool sentmail = EmailService.SendRegEmail("Kriclick Registration Verification", "<a href=" + callbackUrl + "> Click here to confirm<a/>", model.UserName);
                    //await SignInAsync(user, isPersistent: false);

                    return RedirectToAction("RegisterConfirmation");
                }
                else
                {
                    IEnumerable<string> iErrors = result.Errors.Where(t => t.Contains("is already taken"));
                    if (iErrors.Count() > 0)
                    {
                        ViewBag.UserID = UserManager.FindByEmail(model.UserName).Id.ToString();
                        ViewBag.ProfileExistsOrNot = new UserRegistrationBLL().CheckIfProfileComplete(ViewBag.UserID.ToString());
                        ViewBag.UserAlreadyExists = "1";
                    }
                    AddErrors(result);
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        [AllowAnonymous]
        public ActionResult RegisterConfirmation()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult CreatePassword()
        {
            string userId = Request.QueryString["userId"];
            string code = Request.QueryString["code"];

            ViewBag.UserId = userId;
            ViewBag.code = code;

            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> CreatePassword(AddPasswordViewModel model, string userId, string code)
        {
            if (string.IsNullOrEmpty(userId) || string.IsNullOrEmpty(code))
            {
                return View();
            }

            if (ModelState.IsValid)
            {
                var provider = new DpapiDataProtectionProvider("Asp.net");
                UserManager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(
                provider.Create("EmailConfirmation"));
                var user = UserManager.FindById(userId);

                if (user != null)
                {
                    String hashedNewPassword = UserManager.PasswordHasher.HashPassword(model.Password);

                    var result = UserManager.ResetPassword(user.Id, code, model.Password);

                    if (result.Succeeded)
                    {
                        await SignInAsync(user, isPersistent: false);
                        //ModelState.AddModelError("", "Please return to the login page and enjoy with new password.");
                    }
                    else
                    {
                        ModelState.AddModelError("", "It's not a valid, this attempt is already processed.");
                    }

                    return RedirectToAction("VerifyPassword");
                }
                else
                {

                }
            }
            return View();
        }

        [AllowAnonymous]
        //public async Task<ActionResult> ConfirmEmail(string userId, string code)
        public ActionResult ConfirmEmail(string userId, string code)
        {
            try
            {
                if (userId == null || code == null)
                {
                    return View("Error");
                }

                /*var provider = new DpapiDataProtectionProvider("Asp.net");
                UserManager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(
                provider.Create("EmailConfirmation"));
                var result = await UserManager.ConfirmEmailAsync(userId, code);*/

                UserRegistrationBLL userRegistrationBLL = new UserRegistrationBLL();

                int result = userRegistrationBLL.UpdateEmailConfirmation(userId);
                ViewBag.UserId = userId;
                TempData["ViewBagUserId"] = userId;

                if (result == -2)
                {
                    ViewBag.AlreadyConfirmed = "1";
                }

                if (userRegistrationBLL.CheckIfProfileComplete(userId) == "-1")
                {
                    ViewBag.GoToProfileURL = "-1";
                }
                return View("ConfirmEmail");

                //AddErrors(result);
            }
            catch
            {
                return View("Error");
            }
            return View();
        }

        // POST: /Account/Disassociate
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Disassociate(string loginProvider, string providerKey)
        {
            ManageMessageId? message = null;
            IdentityResult result = await UserManager.RemoveLoginAsync(User.Identity.GetUserId(), new UserLoginInfo(loginProvider, providerKey));
            if (result.Succeeded)
            {
                message = ManageMessageId.RemoveLoginSuccess;
            }
            else
            {
                message = ManageMessageId.Error;
            }
            return RedirectToAction("Manage", new { Message = message });
        }

        //
        // GET: /Account/Manage
        public ActionResult Manage(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
                : message == ManageMessageId.SetPasswordSuccess ? "Your password has been set."
                : message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
                : message == ManageMessageId.Error ? "An error has occurred."
                : "";
            ViewBag.HasLocalPassword = HasPassword();
            ViewBag.ReturnUrl = Url.Action("Manage");
            return View();
        }

        //
        // POST: /Account/Manage
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Manage(ManageUserViewModel model)
        {
            bool hasPassword = HasPassword();
            ViewBag.HasLocalPassword = hasPassword;
            ViewBag.ReturnUrl = Url.Action("Manage");
            if (hasPassword)
            {
                if (ModelState.IsValid)
                {
                    IdentityResult result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Manage", new { Message = ManageMessageId.ChangePasswordSuccess });
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }
            else
            {
                // User does not have a password so remove any validation errors caused by a missing OldPassword field
                ModelState state = ModelState["OldPassword"];
                if (state != null)
                {
                    state.Errors.Clear();
                }

                if (ModelState.IsValid)
                {
                    IdentityResult result = await UserManager.AddPasswordAsync(User.Identity.GetUserId(), model.NewPassword);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Manage", new { Message = ManageMessageId.SetPasswordSuccess });
                    }
                    else
                    {
                        AddErrors(result);
                    }
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // Request a redirect to the external login provider
            return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }

            // Sign in the user with this external login provider if the user already has a login
            var user = await UserManager.FindAsync(loginInfo.Login);
            if (user != null)
            {
                UserRegistrationBLL userRegistrationBLL = new UserRegistrationBLL();

                if (userRegistrationBLL.CheckIfProfileComplete(user.Id) != "-1")
                {

                    await SignInAsync(user, isPersistent: false);
                    return RedirectToLocal(returnUrl);

                }
                else
                {
                    return RedirectToAction("CreateProfile", new { UserId = user.Id });
                }
            }
            else
            {
                // If the user does not have an account, then prompt the user to create an account
                ViewBag.ReturnUrl = returnUrl;
                ViewBag.LoginProvider = loginInfo.Login.LoginProvider;

                // Get the information about the user from the external login provider
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                var newuser = new ApplicationUser() { UserName = loginInfo.DefaultUserName };
                var result = await UserManager.CreateAsync(newuser);
                if (result.Succeeded)
                {
                    await UserManager.AddToRoleAsync(newuser.Id, "User");
                    result = await UserManager.AddLoginAsync(newuser.Id, info.Login);
                    if (result.Succeeded)
                    {
                        //await SignInAsync(newuser, isPersistent: false);
                        // return RedirectToLocal(returnUrl);
                        return RedirectToAction("CreateProfile", new { UserId = newuser.Id });
                    }
                }
                AddErrors(result);
                return RedirectToAction("CreateProfile", new { UserId = newuser.Id });
                //  return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { UserName = loginInfo.DefaultUserName });
            }
        }

        //
        // POST: /Account/LinkLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LinkLogin(string provider)
        {
            // Request a redirect to the external login provider to link a login for the current user
            return new ChallengeResult(provider, Url.Action("LinkLoginCallback", "Account"), User.Identity.GetUserId());
        }

        //
        // GET: /Account/LinkLoginCallback
        public async Task<ActionResult> LinkLoginCallback()
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync(XsrfKey, User.Identity.GetUserId());
            if (loginInfo == null)
            {
                return RedirectToAction("Manage", new { Message = ManageMessageId.Error });
            }
            var result = await UserManager.AddLoginAsync(User.Identity.GetUserId(), loginInfo.Login);
            if (result.Succeeded)
            {
                return RedirectToAction("Manage");
            }
            return RedirectToAction("Manage", new { Message = ManageMessageId.Error });
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Manage");
            }

            if (ModelState.IsValid)
            {
                // Get the information about the user from the external login provider
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                var user = new ApplicationUser() { UserName = model.UserName };
                var result = await UserManager.CreateAsync(user);
                if (result.Succeeded)
                {
                    result = await UserManager.AddLoginAsync(user.Id, info.Login);
                    if (result.Succeeded)
                    {
                        await SignInAsync(user, isPersistent: false);
                        return RedirectToLocal(returnUrl);
                    }
                }
                AddErrors(result);
            }

            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut();
            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult RemoveAccountList()
        {
            var linkedAccounts = UserManager.GetLogins(User.Identity.GetUserId());
            ViewBag.ShowRemoveButton = HasPassword() || linkedAccounts.Count > 1;
            return (ActionResult)PartialView("_RemoveAccountPartial", linkedAccounts);
        }
        public ActionResult LogOut()
        {
            AuthenticationManager.SignOut();
            return RedirectToAction("Index", "Home");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && UserManager != null)
            {
                UserManager.Dispose();
                UserManager = null;
            }
            base.Dispose(disposing);
        }

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private async Task SignInAsync(ApplicationUser user, bool isPersistent)
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = await UserManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);
            AuthenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private bool HasPassword()
        {
            var user = UserManager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                return user.PasswordHash != null;
            }
            return false;
        }

        public enum ManageMessageId
        {
            ChangePasswordSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            Error
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        private class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties() { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}