<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    delegate int PerformCalculation(int x, int y);

    void MyCal(int x, int y, PerformCalculation cal)
    {
        Response.Write(cal(x, y) + "<br />");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        MyCal(10, 20, delegate(int x, int y) { return x + y; });
        MyCal(10, 20, delegate(int x, int y) { return x - y; });
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
