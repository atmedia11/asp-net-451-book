<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    delegate int PerformCalculation(int x, int y);    
    
    int Plus(int x, int y) { return x + y; }

    int Minus(int x, int y) { return x - y; }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        PerformCalculation cal = new PerformCalculation(Plus);
        Response.Write(cal(10, 20) + "<br />");

        cal = new PerformCalculation(Minus);
        Response.Write(cal(10, 20));
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
