using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KriclickWebApp.Controllers
{
    public class PostingController : Controller
    {
        //[Authorize]
        //
        // GET: /Posting/
        public ActionResult Index()
        {
            return View();
        }
	}
}