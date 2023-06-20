<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_PreInit(object sender, EventArgs e)
    {
        Response.Write("PreInit 이벤트 발생<br />");
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        Response.Write("Init 이벤트 발생<br />");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("Load 이벤트 발생<br />");
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        Response.Write("PreRender 이벤트 발생<br />");
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
    
    </div>
    </form>
</body>
</html>
