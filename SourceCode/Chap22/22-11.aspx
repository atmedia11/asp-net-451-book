<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    void MyCal(string name, Action<string> cal)
    {
        cal(name);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        MyCal("홍길동", x => Response.Write(x + " 안녕?"));
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
