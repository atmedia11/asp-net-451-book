<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindList();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindList();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Value.ToString();

        string password = e.NewValues["Password"].ToString();
        string name = e.NewValues["Name"].ToString();
        string phone = e.NewValues["Phone"].ToString();

        UpdateMember(userID, password, name, phone);
        GridView1.EditIndex = -1;
        BindList();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindList();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Value.ToString();

        DeleteMember(userID);
        BindList();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label1.Text = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();
    }

    void BindList()
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

    void UpdateMember(string userID, string password, string name, string phone)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "UPDATE Member SET Password = @Password, Name = @Name, Phone = @Phone WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@Password", password);
        cmd.Parameters.AddWithValue("@Name", name);
        cmd.Parameters.AddWithValue("@Phone", phone);
        cmd.Parameters.AddWithValue("@UserID", userID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    void DeleteMember(string userID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "DELETE FROM Member WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", userID);

        con.Open();
        cmd.ExecuteNonQuery();
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
        <h3>GridView 컨트롤 예제3</h3>

        선택한 회원: <asp:Label ID="Label1" runat="server"></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="UserID" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
            <Columns>
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ShowSelectButton="true" HeaderText="명령" />
                <asp:BoundField DataField="UserID" HeaderText="아이디" ReadOnly="true" />
                <asp:BoundField DataField="Password" HeaderText="암호" />
                <asp:BoundField DataField="Name" HeaderText="이름" />
                <asp:BoundField DataField="Phone" HeaderText="연락처" />
            </Columns>
            <SelectedRowStyle BackColor="Silver" />
        </asp:GridView>    
    </div>
    </form>
</body>
</html>
