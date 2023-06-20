<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = "인덱스: " + RadioButtonList1.SelectedIndex.ToString() + ", Value: " + RadioButtonList1.SelectedItem.Value + ", Text: " + RadioButtonList1.SelectedItem.Text;
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
        <h3>RadioButtonList 컨트롤 예제</h3>
        
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Value="A" Selected="true">Item1</asp:ListItem>
            <asp:ListItem Value="B">Item2</asp:ListItem>
            <asp:ListItem Value="C">Item3</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>        
    </div>
    </form>
</body>
</html>
