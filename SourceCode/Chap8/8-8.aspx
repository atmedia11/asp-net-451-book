<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sqlSelect = "SELECT UserID, Password, Name, Phone FROM Member";
        string sqlInsert = "INSERT INTO Member(UserID, Password, Name, Phone) VALUES(@UserID, @Password, @Name, @Phone)";
        SqlCommand cmdSelect = new SqlCommand(sqlSelect, con);
        SqlCommand cmdInsert = new SqlCommand(sqlInsert, con);
        cmdInsert.Parameters.AddWithValue("@UserID", TextBox1.Text);
        cmdInsert.Parameters.AddWithValue("@Password", TextBox2.Text);
        cmdInsert.Parameters.AddWithValue("@Name", TextBox3.Text);
        cmdInsert.Parameters.AddWithValue("@Phone", TextBox4.Text);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmdSelect;
        ad.InsertCommand = cmdInsert;
        DataSet ds = new DataSet();
        ad.Fill(ds);

        DataTable dt = ds.Tables[0];
        DataRow row = dt.NewRow();
        row["UserID"] = TextBox1.Text;
        row["Password"] = TextBox2.Text;
        row["Name"] = TextBox3.Text;
        row["Phone"] = TextBox4.Text;
        dt.Rows.Add(row);

        ad.Update(ds);

        Label1.Text = TextBox1.Text + "의 정보가 입력되었습니다.";
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
        <h3>비연결기반 입력 예제</h3>

        아이디 : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        암호 : <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        이름 : <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
        연락처 : <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="입력" OnClick="Button1_Click" /><br /><br />
        <asp:Label ID="Label1" runat="server"></asp:Label>    
    </div>
    </form>
</body>
</html>
