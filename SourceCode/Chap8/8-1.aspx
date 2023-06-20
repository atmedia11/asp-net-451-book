<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // SqlConnection 개체 생성
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=MyDB;Integrated Security=True");

        // SqlCommand 개체 생성
        string sql = "SELECT UserID, Password, Name, Phone From Member";
        SqlCommand cmd = new SqlCommand(sql, con);

        // SqlConnection 개체 열기
        con.Open();

        // SqlDataReader 개체 생성
        SqlDataReader rd = cmd.ExecuteReader();

        // 데이터 조회 및 출력
        while (rd.Read())
        {
            Label1.Text += String.Format("{0}, {1}, {2}, {3}<br />", rd["UserID"], rd["Password"], rd["Name"], rd["Phone"]);
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
        <h3>연결기반 조회 예제1</h3>

        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
