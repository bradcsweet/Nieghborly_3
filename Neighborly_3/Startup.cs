using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Neighborly_3.Startup))]
namespace Neighborly_3
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
