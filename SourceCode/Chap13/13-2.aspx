<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/13-2.aspx?MyTheme=Spring");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/13-2.aspx?MyTheme=Winter");
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        switch (Request.QueryString["MyTheme"])
        {
            case "Spring":
                Page.Theme = "Spring";
                break;
            case "Winter":
                Page.Theme = "Winter";
                break;
            default:
                Page.Theme = "Spring";
                break;
        }
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
        테마 선택 :
        <asp:Button ID="Button1" runat="server" Text="봄 테마" OnClick="Button1_Click" /> 
        <asp:Button ID="Button2" runat="server" Text="겨울 테마" OnClick="Button2_Click" /><br />
        <asp:TextBox ID="TextBox1" runat="server" Text="TextBox"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
