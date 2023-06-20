<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        string s = "선택한 항목: ";
        for (int i = 0; i < ListBox1.Items.Count; i++)
        {
            if (ListBox1.Items[i].Selected)
            {
                s += ListBox1.Items[i].Text + " ";
            }
        }
        Label1.Text = s;
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
        <h3>ListBox 컨트롤 예제</h3>
        
        <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
            <asp:ListItem Value="1" Text="Item1"></asp:ListItem>
            <asp:ListItem Value="2" Text="Item2"></asp:ListItem>
            <asp:ListItem Value="3" Text="Item3"></asp:ListItem>
        </asp:ListBox>
        <asp:Button ID="Button1" runat="server" Text="확인" OnClick="Button1_Click" /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>        
    </div>
    </form>
</body>
</html>
