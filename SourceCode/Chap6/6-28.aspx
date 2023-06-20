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
        <h3>CompareValidator 컨트롤 예제</h3>
        
        비밀번호: 
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="비밀번호를 입력하세요." ControlToValidate="TextBox1" Display="Dynamic"></asp:RequiredFieldValidator><br />
        비밀번호 확인: 
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="비밀번호 확인을 입력하세요." ControlToValidate="TextBox2" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="비밀번호가 일치하지 않습니다." ControlToValidate="TextBox2" ControlToCompare="TextBox1" Display="Dynamic"></asp:CompareValidator><br />
        <asp:Button ID="Button1" runat="server" Text="Button" />    
    </div>
    </form>
</body>
</html>
