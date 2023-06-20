<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Label1.Text = LinkButton1.ID + "이 클릭 되었습니다.";
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
        <h3>LinkButton 컨트롤 예제</h3>
            
        <asp:LinkButton ID="LinkButton1" runat="server" Text="다시 게시" OnClick="LinkButton1_Click"></asp:LinkButton>
        <br /><br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
