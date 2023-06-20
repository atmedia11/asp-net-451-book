<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<script type="text/javascript">
    function MultipleOfThree(source, arguments) {
        var val = arguments.Value;

        if (val % 3 == 0)
            arguments.IsValid = true;
        else
            arguments.IsValid = false;
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
        <h3>CustomValidator 컨트롤 예제</h3>
        
        3의 배수를 입력 하세요 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="3의 배수가 아닙니다." ClientValidationFunction="MultipleOfThree" ControlToValidate="TextBox1"></asp:CustomValidator><br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </div>
    </form>
</body>
</html>
