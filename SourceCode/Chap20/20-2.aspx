<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            System.Drawing.Color myColor = System.Drawing.Color.FromName("Red");
            TextBox1.BackColor = myColor;
            TextBox2.BackColor = myColor;
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
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" EnableViewState="false"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" />    
    </div>
    </form>
</body>
</html>
