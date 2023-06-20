<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = DropDownList1.SelectedIndex;
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
        <h3>MultiView와 View 컨트롤 예제</h3>
        
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>View1</asp:ListItem>
            <asp:ListItem>View2</asp:ListItem>            
        </asp:DropDownList>
        <hr />
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                View1<br />
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Button" />                
            </asp:View>
            <asp:View ID="View2" runat="server">
                View2<br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/microsoft.gif" />
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
