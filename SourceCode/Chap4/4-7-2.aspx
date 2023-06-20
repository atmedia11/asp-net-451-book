<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.PreviousPage != null)
        {
            TextBox myTextBox = (TextBox)Page.PreviousPage.FindControl("TextBox1");
            Response.Write("페이지 간 게시: " + myTextBox.Text);
        }
        else
        {
            Response.Write("페이지 간 게시가 아닙니다.");
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
