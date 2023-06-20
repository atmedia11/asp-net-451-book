<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindUserID();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "DELETE FROM Member WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", DropDownList1.SelectedValue);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Label1.Text = DropDownList1.SelectedValue + "의 정보가 삭제되었습니다.";

        BindUserID();
    }

    // 드롭다운리스트에 회원 아이디 바인딩
    void BindUserID()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT UserID FROM Member", con);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();
        DropDownList1.DataSource = rd;
        DropDownList1.DataValueField = "UserID";
        DropDownList1.DataTextField = "UserID";
        DropDownList1.DataBind();

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
        <h3>연결기반 삭제 예제</h3>

        아이디 선택 : 
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="삭제" OnClick="Button1_Click" />
        <br /><br />
        <asp:Label ID="Label1" runat="server"></asp:Label>    
    </div>
    </form>
</body>
</html>
