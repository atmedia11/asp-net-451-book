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
        BindMember();
    }

    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.NewMode == DetailsViewMode.Edit)
        {
            DetailsView1.ChangeMode(DetailsViewMode.Edit);
        }
        else if (e.NewMode == DetailsViewMode.Insert)
        {
            DetailsView1.ChangeMode(DetailsViewMode.Insert);
        }
        else if (e.CancelingEdit)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        }

        BindMember();
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        string userID = DropDownList1.SelectedValue;
        string password = e.NewValues["Password"].ToString();
        string name = e.NewValues["Name"].ToString();
        string phone = e.NewValues["Phone"].ToString();

        UpdateMember(userID, password, name, phone);

        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        BindMember();
    }

    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        string userID = DropDownList1.SelectedValue;

        DeleteMember(userID);

        BindUserID();
        BindMember();
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        string userID = e.Values["UserID"].ToString();
        string password = e.Values["Password"].ToString();
        string name = e.Values["Name"].ToString();
        string phone = e.Values["Phone"].ToString();

        InsertMember(userID, password, name, phone);

        BindUserID();
        DropDownList1.SelectedValue = userID;
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
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

        DetailsView1.DataSource = rd;
        DetailsView1.DataBind();

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
        <h3>DetailsView 컨트롤 예제</h3>
                
        회원 선택: 
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <br /><br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" OnModeChanging="DetailsView1_ModeChanging" OnItemUpdating="DetailsView1_ItemUpdating" OnItemDeleting="DetailsView1_ItemDeleting" OnItemInserting="DetailsView1_ItemInserting">
            <Fields>
                <asp:TemplateField HeaderText="아이디">
                    <ItemTemplate>
                        <%# Eval("UserID") %>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="암호">
                    <ItemTemplate>
                        <%# Eval("Password") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="이름">
                    <ItemTemplate>
                        <%# Eval("Name") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="연락처">
                    <ItemTemplate>
                        <%# Eval("Phone") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="false">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="편집" CommandName="Edit" />
                        <asp:Button ID="btnDelete" runat="server" Text="삭제" CommandName="Delete" OnClientClick="return confirm('삭제 하시겠습니까?');" />
                        <asp:Button ID="btnCreate" runat="server" Text="입력" CommandName="New" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" Text="업데이트" CommandName="Update" />
                        <asp:Button ID="btnCancel" runat="server" Text="취소" CommandName="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Button ID="btnInsert" runat="server" Text="저장" CommandName="Insert" />
                        <asp:Button ID="btnCancel" runat="server" Text="취소" CommandName="Cancel" />
                    </InsertItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>    
    </div>
    </form>
</body>
</html>
