<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindUserID();
            SetInfo();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetInfo();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "UPDATE Member SET Password = @Password, Name = @Name, Phone = @Phone WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@Password", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Name", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Phone", TextBox3.Text);
        cmd.Parameters.AddWithValue("@UserID", DropDownList1.SelectedValue);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Label2.Text = Label1.Text + "의 정보가 수정되었습니다.";
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

    // 회원 정보 바인딩
    void SetInfo()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT UserID, Password, Name, Phone FROM Member WHERE UserID = @UserID", con);
        cmd.Parameters.AddWithValue("@UserID", DropDownList1.SelectedValue);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            Label1.Text = rd["UserID"].ToString();
            TextBox1.Text = rd["Password"].ToString();
            TextBox2.Text = rd["Name"].ToString();
            TextBox3.Text = rd["Phone"].ToString();
        }

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
        <h3>연결기반 수정 예제</h3>

        아이디 선택 : 
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <br /><br />
        아이디 : <asp:Label ID="Label1" runat="server"></asp:Label><br />
        암호 : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        이름 : <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        연락처 : <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="수정" OnClick="Button1_Click" /><br /><br />
        <asp:Label ID="Label2" runat="server"></asp:Label>    
    </div>
    </form>
</body>
</html>
