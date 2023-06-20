using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ExAuthTest.Startup))]
namespace ExAuthTest
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
