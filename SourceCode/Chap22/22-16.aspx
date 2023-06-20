<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        List<int> numbers = new List<int> { 1, 9, 2, 3, 7, 8, 0 };

        var queryNumbers =
            from num in numbers
            where num > 5
            select new { OriginalNumber = num, SquareNumber = num * num };

        foreach (var num in queryNumbers)
        {
            Response.Write(num.OriginalNumber + " : " + num.SquareNumber + "<br />");
        }
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
