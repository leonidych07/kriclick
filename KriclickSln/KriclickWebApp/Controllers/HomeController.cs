using Kriclick.BLL;
using KriclickWebApp.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace KriclickWebApp.Controllers
{
    public class HomeController : Controller
    {
        public HomeController()
            : this(new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
        {
        }

        public HomeController(UserManager<ApplicationUser> userManager)
        {
            UserManager = userManager;
        }

        public UserManager<ApplicationUser> UserManager { get; private set; }
        public ActionResult Index()
        {
            if (User.Identity.IsAuthenticated)
            {
                string userID = User.Identity.GetUserId();
                UserRegistrationBLL userBll = new UserRegistrationBLL();
                var Result = userBll.GetUserProfileById(userID);
                ViewBag.UserType = Result.UserTypeId.ToString();
                ViewBag.Imageurl = string.Empty;
                if (!string.IsNullOrEmpty(Result.LogoURL))
                {
                    ViewBag.Imageurl = (!string.IsNullOrEmpty(Result.LogoURL)) ? Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + "Uploads/" + Result.LogoURL : string.Empty;
                }
            }
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}