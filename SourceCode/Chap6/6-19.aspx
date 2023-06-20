<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
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
        <h3>Panel 컨트롤 예제</h3>
    
        <asp:Button ID="Button1" runat="server" Text="Panel1 보임" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Panel1 안보임" OnClick="Button2_Click" />
        <br /><br />
        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="Button" />
        </asp:Panel>
    </div>
    </form>
</body>
</html>
