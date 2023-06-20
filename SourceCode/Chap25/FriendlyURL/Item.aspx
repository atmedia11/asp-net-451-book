<%@ Page Language="C#" %>
<%@ Import Namespace="Microsoft.AspNet.FriendlyUrls" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {   
        IList<string> segments = Request.GetFriendlyUrlSegments();
        if (segments.Count() > 0)
        {
            foreach (string seg in segments)
                Response.Write(seg + "<br />");
        }

        HyperLink1.NavigateUrl = FriendlyUrl.Href("~/Item", "shoes", "nike");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server">나이키</asp:HyperLink><br />
        <a href="/Item/shoes/adidas">아디다스</a>
    </div>
    </form>
</body>
</html>
