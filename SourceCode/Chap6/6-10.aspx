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
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.microsoft.co.kr" Text="한국 마이크로소프트 웹 사이트로 이동"></asp:HyperLink>
        <br /><br />
        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Images/microsoft.gif" NavigateUrl="http://www.microsoft.co.kr" Target="_blank"></asp:HyperLink>    
    </div>
    </form>
</body>
</html>
