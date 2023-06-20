<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        ListItem item = new ListItem();
        item.Value = TextBox1.Text;
        item.Text = TextBox1.Text;
        ListBox1.Items.Add(item);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ListBox1.Items.Remove(ListBox1.SelectedItem);
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
        <asp:Button ID="Button1" runat="server" Text="항목 추가" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="선택 항목 삭제" OnClick="Button2_Click" /><br />
        <asp:ListBox ID="ListBox1" runat="server">
            <asp:ListItem>항목1</asp:ListItem>
            <asp:ListItem>항목2</asp:ListItem>
        </asp:ListBox>
    </div>
    </form>
</body>
</html>
