<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("다시 게시: " + TextBox1.Text);
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
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="다시 게시" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="페이지 간 게시" PostBackUrl="4-7-2.aspx" />
    </div>
    </form>
</body>
</html>
