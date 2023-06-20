<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        MyDBEntities context = new MyDBEntities();
        
        var query =
            from member in context.Members
            orderby member.UserID descending
            select member;
        
        GridView1.DataSource = query.ToList();
        GridView1.DataBind();
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
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>    
    </div>
    </form>
</body>
</html>
