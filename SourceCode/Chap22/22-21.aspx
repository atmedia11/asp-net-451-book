<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        List<int> numbers = new List<int> { 1, 9, 2, 3, 7, 8, 0 };

        var query = numbers
            .Where(n => n > 2)
            .OrderBy(n => n)
            .Select(n => new { Number = n, SquareNumber = n * n });
        
        foreach (var num in query)
        {
            Response.Write(num.Number + " : " + num.SquareNumber + "<br />");
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
