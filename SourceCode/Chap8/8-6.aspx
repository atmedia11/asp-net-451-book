<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT UserID, Password, Name, Phone From Member WHERE UserID = '" + TextBox1.Text + "'";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.Read())
        {
            Label1.Text = String.Format("{0}, {1}, {2}, {3}<br />", rd["UserID"], rd["Password"], rd["Name"], rd["Phone"]);
        }

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
        <h3>SQL injection attack 예제</h3>

        <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="조회" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>    
    </div>
    </form>
</body>
</html>
