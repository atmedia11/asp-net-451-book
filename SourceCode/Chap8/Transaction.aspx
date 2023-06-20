<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql1 = "INSERT INTO Member(UserID, Password, Name, Phone) VALUES('xxxx', '0000', 'xxxx', '000-000-000')";
        SqlCommand cmd1 = new SqlCommand(sql1, con);

        string sql2 = "INSERT INTO Cart(UserID, ItemName, Qty, Price) VALUES('yyyy', '생수', 6, 5000)";
        SqlCommand cmd2 = new SqlCommand(sql2, con);

        SqlTransaction tran = null;

        try
        {
            con.Open();
            tran = con.BeginTransaction(); // 트랜잭션 시작.

            cmd1.Transaction = tran; // 트랜잭션에 cmd1 포함.
            cmd2.Transaction = tran; // 트랜잭션에 cmd2 포함.

            cmd1.ExecuteNonQuery();
            cmd2.ExecuteNonQuery(); // 여기서 오류 발생.

            tran.Commit(); // 트랜잭션 COMMIT.
        }
        catch (Exception ex)
        {
            tran.Rollback(); // 트랜잭션 ROLLBACK.
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
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
        <asp:Button ID="btnInsert" runat="server" Text="입력" onclick="btnInsert_Click" />    
    </div>
    </form>
</body>
</html>
