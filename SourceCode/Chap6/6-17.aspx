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
        <h3>Literal 컨트롤 예제</h3>
        
        <asp:Literal ID="Literal1" runat="server" Text="<hr />"></asp:Literal>        
        <asp:Literal ID="Literal2" runat="server" Text="<hr />" Mode="Encode"></asp:Literal>
    </div>
    </form>
</body>
</html>
