<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>RegularExpressionValidator 컨트롤 예제</h3>
        
        우편번호: 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 예) 123-456<br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="우편번호 형식이 잘못되었습니다." ValidationExpression="\d{3}-\d{3}" ControlToValidate="TextBox1" SetFocusOnError="True"></asp:RegularExpressionValidator><br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </div>
    </form>
</body>
</html>
