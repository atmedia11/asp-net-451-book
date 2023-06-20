<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        int i = 10;
        
        Response.Write(i.MySquare() + "<br />"); // 10 * 10 = 100 출력.
        Response.Write(20.MySquare() + "<br />"); // 20 * 20 = 400 출력.

        Response.Write(i.MyCal(20, 30)); // 10 + 20 + 30 = 60 출력.
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
