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

        // 데이터 바인딩
        Repeater1.DataSource = rd;
        Repeater1.DataBind();

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
        <h3>Repeater 컨트롤 예제1</h3>

        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                아이디: <%# Eval("UserID") %> <br />
                암호: <%# Eval("Password") %> <br />
                이름: <%# Eval("Name") %> <br />
                연락처: <%# Eval("Phone") %>
                <hr />
            </ItemTemplate>
        </asp:Repeater>    
    </div>
    </form>
</body>
</html>
