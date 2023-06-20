<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        // SqlConnection 개체 생성
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        // SqlCommand 개체 생성
        string sql = "SELECT UserID, Password, Name, Phone From Member WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);        
        cmd.Parameters.AddWithValue("@UserID", TextBox1.Text);

        // SqlConnection 개체 열기
        con.Open();

        // SqlDataReader 개체 생성
        SqlDataReader rd = cmd.ExecuteReader();

        // 데이터 조회 및 출력
        if (rd.Read())
        {
            Label1.Text = String.Format("{0}, {1}, {2}, {3}<br />", rd["UserID"], rd["Password"], rd["Name"], rd["Phone"]);
        }

        // SqlDataReader 개체 및 SqlConnection 개체 닫기
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
        <h3>연결기반 조회 예제2</h3>

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="조회" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>    
    </div>
    </form>
</body>
</html>
