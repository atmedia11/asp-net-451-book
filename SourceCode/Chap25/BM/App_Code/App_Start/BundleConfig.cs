using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Optimization;

public class BundleConfig
{
    public static void RegisterBundles(BundleCollection bundles)
    {
        Bundle jqueryUI = new ScriptBundle("~/bundle/jqueryUI")
            .Include("~/Scripts/jquery-{version}.js",
            "~/Scripts/jquery-ui-{version}.js");
        bundles.Add(jqueryUI);

        Bundle jqueryUICSS = new StyleBundle("~/bundle/jqueryUICSS")
            .IncludeDirectory("~/Content/themes/base", "*.css");
        bundles.Add(jqueryUICSS);
    }
}