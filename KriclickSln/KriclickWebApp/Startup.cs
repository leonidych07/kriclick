using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(KriclickWebApp.Startup))]
namespace KriclickWebApp
{
    public partial class Startup
    {

        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
