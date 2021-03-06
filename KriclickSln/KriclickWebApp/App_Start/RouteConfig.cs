﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace KriclickWebApp
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.LowercaseUrls = true;

            routes.MapRoute(
                name: "Feedback",
                url: "feedbacks",
                defaults: new { controller = "home", action = "feedback", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "HowItWorks",
                url: "how-it-works",
                defaults: new { controller = "home", action = "howitworks", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Help",
                url: "help",
                defaults: new { controller = "home", action = "Help", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "BusinessProfileSettings",
                url: "Settings",
                defaults: new { controller = "account", action = "ProfileSettings", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "UserProfile",
                url: "{username}",
                defaults: new { controller = "account", action = "userprofile", id = UrlParameter.Optional }
            );            

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
