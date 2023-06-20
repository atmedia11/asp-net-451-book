<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    delegate int PerformCalculation(int x);

    void MyCal(int x, PerformCalculation cal)
    {
        Response.Write(cal(x));
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        MyCal(10, x => x * x);
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
