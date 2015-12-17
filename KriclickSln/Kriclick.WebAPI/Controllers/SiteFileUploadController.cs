using Kriclick.BLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Microsoft.AspNet.Identity;

namespace Kriclick.WebAPI.Controllers
{
    public class SiteFileUploadController : ApiController
    {
        [HttpPost]
        public string UploadProfileHeader()
        {
            string imagepath = string.Empty;

            if (HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];

                string UploadedFolderPath = HttpContext.Current.Server.MapPath("~/Uploads/UserProfileHeaderImages/");
                if (!Directory.Exists(UploadedFolderPath))
                {
                    Directory.CreateDirectory(UploadedFolderPath);
                }
                string userID = User.Identity.GetUserId();

                var fileName = string.Format("{0}_{1}", userID, Path.GetFileName(httpPostedFile.FileName));

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
                    httpPostedFile.SaveAs(UploadedFolderPath);
                }
                catch { }

                string fl = UploadedFolderPath.Substring(UploadedFolderPath.LastIndexOf("\\"));
                string[] split = fl.Split('\\');
                string newpath = split[1];
                imagepath = newpath;

                UserRegistrationBLL userRegistrationBLL = new UserRegistrationBLL();
                userRegistrationBLL.UpdateUserProfileHeaderImage(userID, imagepath);

                imagepath = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath + "Uploads/UserProfileHeaderImages/" + imagepath;
            }
            return imagepath;
        }

        [HttpPost]
        public string UploadUserProfile()
        {
            string imagepath = string.Empty;

            if (HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];

                string UploadedFolderPath = HttpContext.Current.Server.MapPath("~/Uploads/");
                if (!Directory.Exists(UploadedFolderPath))
                {
                    Directory.CreateDirectory(UploadedFolderPath);
                }
                string userID = User.Identity.GetUserId();

                var fileName = string.Format("{0}_{1}", userID, Path.GetFileName(httpPostedFile.FileName));

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
                    httpPostedFile.SaveAs(UploadedFolderPath);
                }
                catch { }

                string fl = UploadedFolderPath.Substring(UploadedFolderPath.LastIndexOf("\\"));
                string[] split = fl.Split('\\');
                string newpath = split[1];
                imagepath = newpath;

                UserRegistrationBLL userRegistrationBLL = new UserRegistrationBLL();
                userRegistrationBLL.UpdateUserProfileImage(userID, imagepath);

                imagepath = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath + "Uploads/" + imagepath;
            }
            return imagepath;
        }
    }
}
