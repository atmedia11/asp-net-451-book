<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
            Image1.ImageUrl = "~/Images/banner1.gif";
        else
            Image1.ImageUrl = "~/Images/banner2.gif";

        Image1.AlternateText = DropDownList1.SelectedItem.Text;
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
        <h3>Image 컨트롤 예제</h3>
        
        <asp:Image ID="Image1" runat="server" />
        <br /><br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true">
            <asp:ListItem>이미지 1</asp:ListItem>
            <asp:ListItem>이미지 2</asp:ListItem>
        </asp:DropDownList>
    </div>
    </form>
</body>
</html>
