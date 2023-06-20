<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindUserID();
            BindMember();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FormView1.ChangeMode(FormViewMode.ReadOnly);
        BindMember();
    }

    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Edit)
        {
            FormView1.ChangeMode(FormViewMode.Edit);
        }
        else if (e.NewMode == FormViewMode.Insert)
        {
            FormView1.ChangeMode(FormViewMode.Insert);
        }
        else if (e.CancelingEdit)
        {
            FormView1.ChangeMode(FormViewMode.ReadOnly);
        }

        BindMember();
    }

    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        string userID = DropDownList1.SelectedValue;
        string password = e.NewValues["Password"].ToString();
        string name = e.NewValues["Name"].ToString();
        string phone = e.NewValues["Phone"].ToString();

        UpdateMember(userID, password, name, phone);

        FormView1.ChangeMode(FormViewMode.ReadOnly);
        BindMember();
    }

    protected void FormView1_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        string userID = DropDownList1.SelectedValue;

        DeleteMember(userID);

        BindUserID();
        BindMember();
    }

    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        string userID = e.Values["UserID"].ToString();
        string password = e.Values["Password"].ToString();
        string name = e.Values["Name"].ToString();
        string phone = e.Values["Phone"].ToString();

        InsertMember(userID, password, name, phone);

        BindUserID();
        DropDownList1.SelectedValue = userID;
        FormView1.ChangeMode(FormViewMode.ReadOnly);
        BindMember();
    }

    void BindUserID()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT UserID From Member";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();

        DropDownList1.DataSource = rd;
        DropDownList1.DataTextField = "UserID";
        DropDownList1.DataValueField = "UserID";
        DropDownList1.DataBind();

        rd.Close();
        con.Close();
    }

    void BindMember()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT UserID, Password, Name, Phone From Member WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", DropDownList1.SelectedValue);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();

        FormView1.DataSource = rd;
        FormView1.DataBind();

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

    void InsertMember(string userID, string password, string name, string phone)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "INSERT INTO Member(UserID, Password, Name, Phone) VALUES(@UserID, @Password, @Name, @Phone)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", userID);
        cmd.Parameters.AddWithValue("@Password", password);
        cmd.Parameters.AddWithValue("@Name", name);
        cmd.Parameters.AddWithValue("@Phone", phone);

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
        <h3>FormView 컨트롤 예제</h3>
                
        회원 선택: 
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <br /><br />
        <asp:FormView ID="FormView1" runat="server" OnModeChanging="FormView1_ModeChanging" OnItemUpdating="FormView1_ItemUpdating" OnItemDeleting="FormView1_ItemDeleting" OnItemInserting="FormView1_ItemInserting">
            <ItemTemplate>
                <table border="1">
                    <tr>
                        <td style="background-color: Silver; width: 60px;">아이디</td>
                        <td style="width: 120px;"><%# Eval("UserID") %></td>
                        <td style="background-color: Silver; width: 60px;">암호</td>
                        <td style="width: 120px;"><%# Eval("Password") %></td>
                    </tr>
                    <tr>
                        <td style="background-color: Silver;">이름</td>
                        <td><%# Eval("Name") %></td>
                        <td style="background-color: Silver;">연락처</td>
                        <td><%# Eval("Phone") %></td>
                    </tr>
                </table>
                <p>
                    <asp:Button ID="btnEdit" runat="server" Text="편집" CommandName="Edit" />
                    <asp:Button ID="btnCreate" runat="server" Text="입력" CommandName="New" />
                    <asp:Button ID="btnDelete" runat="server" Text="삭제" CommandName="Delete" OnClientClick="return confirm('삭제 하시겠습니까?');" />
                </p>
            </ItemTemplate>
            <EditItemTemplate>
                <table border="1">
                    <tr>
                        <td style="background-color: Silver; width: 60px;">아이디</td>
                        <td style="width: 120px;"><%# Eval("UserID") %></td>
                        <td style="background-color: Silver; width: 60px;">암호</td>
                        <td style="width: 120px;"><asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="background-color: Silver;">이름</td>
                        <td><asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox></td>
                        <td style="background-color: Silver;">연락처</td>
                        <td><asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox></td>
                    </tr>
                </table>
                <p>
                    <asp:Button ID="btnUpdate" runat="server" Text="업데이트" CommandName="Update" />
                    <asp:Button ID="btnCancel" runat="server" Text="취소" CommandName="Cancel" />
                </p>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table border="1">
                    <tr>
                        <td style="background-color: Silver; width: 60px;">아이디</td>
                        <td style="width: 120px;"><asp:TextBox ID="txtUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox></td>
                        <td style="background-color: Silver; width: 60px;">암호</td>
                        <td style="width: 120px;"><asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="background-color: Silver;">이름</td>
                        <td><asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox></td>
                        <td style="background-color: Silver;">연락처</td>
                        <td><asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox></td>
                    </tr>
                </table>
                <p>
                    <asp:Button ID="btnInsert" runat="server" Text="저장" CommandName="Insert" />
                    <asp:Button ID="btnCancel" runat="server" Text="취소" CommandName="Cancel" />
                </p>
            </InsertItemTemplate>
        </asp:FormView>    
    </div>
    </form>
</body>
</html>
