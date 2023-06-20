<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    void MyCal(int x, int y, Func<int, int, int> cal)
    {
        Response.Write(cal(x, y) + "<br />");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        MyCal(10, 20, (x, y) => x + y);
        MyCal(10, 20, (x, y) => x - y);
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
