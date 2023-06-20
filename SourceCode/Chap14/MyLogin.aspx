<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsAuthenticated(TextBox1.Text, TextBox2.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, CheckBox1.Checked);
        }
        else
        {
            Label1.Text = "아이디와 암호가 일치하지 않습니다.";
        }
    }

    bool IsAuthenticated(string userID, string password)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT COUNT(UserID) FROM Member WHERE UserID = @UserID AND Password = @Password";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", userID);
        cmd.Parameters.AddWithValue("@Password", password);

        con.Open();
        int count = (int)cmd.ExecuteScalar();
        con.Close();

        return count > 0;
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
        아이디: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        암호: <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox><br />
        <asp:CheckBox ID="CheckBox1" runat="server" /> 로그인 상태 유지<br />
        <asp:Button ID="Button1" runat="server" Text="로그인" OnClick="Button1_Click" /><br />
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>    
    </div>
    </form>
</body>
</html>
