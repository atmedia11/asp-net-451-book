<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.Entity.Core.Objects" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        MyDBEntities context = new MyDBEntities();
        
        ObjectResult<usp_SelectMemberByUserID_Result> results = context.usp_SelectMemberByUserID("aaaa");
        
        usp_SelectMemberByUserID_Result result = results.Single();

        Response.Write(result.UserID + " " + result.Name + " " + result.Password + " " + result.Phone);
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
