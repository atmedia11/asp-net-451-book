<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Label1.Text = String.Format("X: {0}, Y: {1}", e.X, e.Y);
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Label2.Text = "<확인> 버튼이 클릭되었습니다.";
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
        <h3>ImageButton 컨트롤 예제</h3>        

        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/ImageButton1.gif" OnClick="ImageButton1_Click" />
        <asp:Label ID="Label1" runat="server"></asp:Label> 
        <br /><br />
        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/ImageButton2.gif" OnClick="ImageButton2_Click" /> 
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
