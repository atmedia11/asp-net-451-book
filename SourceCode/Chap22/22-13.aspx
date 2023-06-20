<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        var myStudent = new { Name = "홍길동", Score = 2 };
        Response.Write(myStudent.Name + " " + myStudent.Score + "<br />");

        //var myCar;

        var myName = "홍길동";
        //myName = 100;
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
