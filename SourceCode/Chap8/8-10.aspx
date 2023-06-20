<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

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

        string sqlSelect = "SELECT * FROM Member";
        string sqlDelete = "DELETE FROM Member WHERE UserID = @UserID";
        SqlCommand cmdSelect = new SqlCommand(sqlSelect, con);
        SqlCommand cmdDelete = new SqlCommand(sqlDelete, con);
        cmdDelete.Parameters.AddWithValue("@UserID", DropDownList1.SelectedValue);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmdSelect;
        ad.DeleteCommand = cmdDelete;
        DataSet ds = new DataSet();
        ad.Fill(ds);

        DataTable dt = ds.Tables[0];
        DataRow[] rows = dt.Select("UserID = '" + DropDownList1.SelectedValue + "'");
        if (rows.Length > 0)
        {
            rows[0].Delete();

            ad.Update(ds);

            Label1.Text = DropDownList1.SelectedValue + "의 정보가 삭제되었습니다.";

            BindUserID();
        }
    }

    // 드롭다운리스트에 회원 아이디 바인딩
    void BindUserID()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT UserID FROM Member", con);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;
        DataSet ds = new DataSet();
        ad.Fill(ds);

        DropDownList1.DataSource = ds;
        DropDownList1.DataValueField = "UserID";
        DropDownList1.DataTextField = "UserID";
        DropDownList1.DataBind();
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
        <h3>비연결기반 삭제 예제</h3>

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
