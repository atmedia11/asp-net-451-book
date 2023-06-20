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

    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        ListView1.EditIndex = e.NewEditIndex;
        BindList();
    }

    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        string userID = (string)ListView1.DataKeys[e.ItemIndex].Value;

        string password = e.NewValues["Password"].ToString();
        string name = e.NewValues["Name"].ToString();
        string phone = e.NewValues["Phone"].ToString();

        UpdateMember(userID, password, name, phone);
        ListView1.EditIndex = -1;
        BindList();
    }

    protected void ListView1_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        ListView1.EditIndex = -1;
        BindList();
    }

    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string userID = (string)ListView1.DataKeys[e.ItemIndex].Value;

        DeleteMember(userID);
        BindList();
    }

    protected void ListView1_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        ListView1.SelectedIndex = e.NewSelectedIndex;
        BindList();

        Label1.Text = ListView1.DataKeys[e.NewSelectedIndex].Value.ToString();
    }

    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        string userID = e.Values["UserID"].ToString();
        string password = e.Values["Password"].ToString();
        string name = e.Values["Name"].ToString();
        string phone = e.Values["Phone"].ToString();

        InsertMember(userID, password, name, phone);
        ListView1.SelectedIndex = -1;
        BindList();
    }

    void BindList()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT UserID, Password, Name, Phone From Member";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();

        ListView1.DataSource = rd;
        ListView1.DataBind();

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
        <h3>ListView 컨트롤 예제3</h3>

        선택한 회원: <asp:Label ID="Label1" runat="server"></asp:Label><br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="UserID" InsertItemPosition="LastItem" OnItemEditing="ListView1_ItemEditing" OnItemUpdating="ListView1_ItemUpdating" OnItemCanceling="ListView1_ItemCanceling" OnItemDeleting="ListView1_ItemDeleting" OnSelectedIndexChanging="ListView1_SelectedIndexChanging" OnItemInserting="ListView1_ItemInserting">
            <LayoutTemplate>
                <table border="1">
                    <tr>
                        <td>명령</td>
                        <td>아이디</td>
                        <td>암호</td>
                        <td>이름</td>
                        <td>연락처</td>
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" Text="편집" CommandName="Edit" />
                        <asp:Button ID="btnDelete" runat="server" Text="삭제" CommandName="Delete" OnClientClick="return confirm('삭제 하시겠습니까?');" />
                        <asp:Button ID="btnSelect" runat="server" Text="선택" CommandName="Select" />
                    </td>
                    <td>
                        <%# Eval("UserID") %>
                    </td>
                    <td>
                        <%# Eval("Password") %>
                    </td>
                    <td>
                        <%# Eval("Name") %>
                    </td>
                    <td>
                        <%# Eval("Phone") %>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="btnUpdate" runat="server" Text="업데이트" CommandName="Update" />
                        <asp:Button ID="btnCancel" runat="server" Text="취소" CommandName="Cancel" />
                    </td>
                    <td>
                        <%# Eval("UserID") %>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    </td>
                </tr>
            </EditItemTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: Silver;">
                    <td>
                        <asp:Button ID="btnEdit" runat="server" Text="편집" CommandName="Edit" />
                        <asp:Button ID="btnDelete" runat="server" Text="삭제" CommandName="Delete" OnClientClick="return confirm('삭제 하시겠습니까?');" />
                        <asp:Button ID="btnSelect" runat="server" Text="선택" CommandName="Select" />
                    </td>
                    <td>
                        <%# Eval("UserID") %>
                    </td>
                    <td>
                        <%# Eval("Password") %>
                    </td>
                    <td>
                        <%# Eval("Name") %>
                    </td>
                    <td>
                        <%# Eval("Phone") %>
                    </td>
                </tr>
            </SelectedItemTemplate>
            <InsertItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="btnInsert" runat="server" Text="저장" CommandName="Insert" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    </td>
                </tr>
            </InsertItemTemplate>
        </asp:ListView>    
    </div>
    </form>
</body>
</html>
