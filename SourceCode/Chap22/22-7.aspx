﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    delegate int PerformCalculation(int x, int y);

    void MyCal(int x, int y, PerformCalculation cal)
    {
        Response.Write(cal(x, y));
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        MyCal(10, 20, (x, y) =>
            {
                if (x > y) return x;
                else return y;
            }
        );
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
