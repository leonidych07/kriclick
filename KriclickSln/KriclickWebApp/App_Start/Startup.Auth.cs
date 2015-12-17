using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Google;
using Owin;

namespace KriclickWebApp
{
    public partial class Startup
    {
        // For more information on configuring authentication, please visit http://go.microsoft.com/fwlink/?LinkId=301864
        public void ConfigureAuth(IAppBuilder app)
        {
                        // Enable the application to use a cookie to store information for the signed in user
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login")
            });

            // Use a cookie to temporarily store information about a user logging in with a third party login provider
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Uncomment the following lines to enable logging in with third party login providers
            //app.UseMicrosoftAccountAuthentication(
            //    clientId: "",
            //    clientSecret: "");

            //app.UseTwitterAuthentication(
            //   consumerKey: "",
            //   consumerSecret: "");


            //app.UseFacebookAuthentication(
            //   appId: "1684675281777996",
            //   appSecret: "af72a3d9e9cb7a998dc0214da26cf70a");


            //var googleOAuth2AuthenticationOptions = new GoogleOAuth2AuthenticationOptions
            //{
            //    ClientId = "841999960290-5s58o4iujbamdk3hv52idmmapspn21vp.apps.googleusercontent.com",
            //    ClientSecret = "5R51ZxJJrJOU6-WqA6-Ma3bZ",
            //};
            //app.UseGoogleAuthentication(googleOAuth2AuthenticationOptions);

            //app.UseGoogleAuthentication(
            //    clientId: "841999960290-5s58o4iujbamdk3hv52idmmapspn21vp.apps.googleusercontent.com",
            //    clientSecret: "5R51ZxJJrJOU6-WqA6-Ma3bZ");

            SetExternalAuthentication(app);
        }

        private void SetExternalAuthentication(IAppBuilder app)
        {
            string FBAppId = "", FBAppSecret = "", GoogleClientId = "", GoogleClientSecret = "";
            string SiteUrl = System.Web.HttpContext.Current.Request.Url.GetLeftPart(System.UriPartial.Authority) + System.Web.HttpContext.Current.Request.ApplicationPath;

            if (SiteUrl.Contains("localhost"))
            {
                FBAppId = System.Web.Configuration.WebConfigurationManager.AppSettings["LocalHostFBAppId"].ToString();
                FBAppSecret = System.Web.Configuration.WebConfigurationManager.AppSettings["LocalHostFBAppSecret"].ToString();

                GoogleClientId = System.Web.Configuration.WebConfigurationManager.AppSettings["LocalHostGoogleClientId"].ToString();
                GoogleClientSecret = System.Web.Configuration.WebConfigurationManager.AppSettings["LocalHostGoogleClientSecret"].ToString();
            }
            else
            {
                FBAppId = System.Web.Configuration.WebConfigurationManager.AppSettings["DevSiteFBAppId"].ToString();
                FBAppSecret = System.Web.Configuration.WebConfigurationManager.AppSettings["DevSiteFBAppSecret"].ToString();

                GoogleClientId = System.Web.Configuration.WebConfigurationManager.AppSettings["DevSiteGoogleClientId"].ToString();
                GoogleClientSecret = System.Web.Configuration.WebConfigurationManager.AppSettings["DevSiteGoogleClientSecret"].ToString();
            }

            app.UseFacebookAuthentication(appId: FBAppId, appSecret: FBAppSecret);

            var googleOAuth2AuthenticationOptions = new GoogleOAuth2AuthenticationOptions { ClientId = GoogleClientId, ClientSecret = GoogleClientSecret };
            app.UseGoogleAuthentication(googleOAuth2AuthenticationOptions);
        }
    }
}