using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EnvisionedBlog.Web.Startup))]
namespace EnvisionedBlog.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
