<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <%: System.Web.Optimization.Styles.Render("~/bundle/jqueryUICSS") %>
    <%: System.Web.Optimization.Scripts.Render("~/bundle/jqueryUI") %>
    <script>
        $(document).ready(function () {
            $('input[type=submit]').button();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">    
        <input type="submit" value="Button" />
    </form>
</body>
</html>
