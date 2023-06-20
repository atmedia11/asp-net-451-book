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
        <h3>RequiredFieldValidator 컨트롤 예제2</h3>
        
        이름: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="이름을 입력하세요." ControlToValidate="TextBox1" ValidationGroup="Name" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
        <asp:Button ID="Button1" runat="server" Text="Button1" ValidationGroup="Name" />
        <br /><br />
        취미: <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="">-- 취미 선택--</asp:ListItem>
            <asp:ListItem Value="1">독서</asp:ListItem>
            <asp:ListItem Value="2">영화</asp:ListItem>
            <asp:ListItem Value="3">음악</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="취미를 선택하세요." ControlToValidate="DropDownList1" ValidationGroup="Hobby" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
        <asp:Button ID="Button2" runat="server" Text="Button2" ValidationGroup="Hobby" />
    </div>
    </form>
</body>
</html>
