<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Text = "새로운 값을 입력하세요."; // 초기화
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(TextBox1.Text);
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
        <asp:Button ID="Button1" runat="server" Text="확인" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
