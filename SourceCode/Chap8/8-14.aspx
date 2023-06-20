<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT UserID, Password, Name, Phone From Member";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();

        GridView1.DataSource = rd;
        GridView1.DataBind();

        rd.Close();
        con.Close();
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
        <h3>GridView 컨트롤 예제1</h3>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true">
        </asp:GridView>    
    </div>
    </form>
</body>
</html>
