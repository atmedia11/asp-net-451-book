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

        string sqlSelect = "SELECT UserID, Password, Name, Phone FROM Member";
        string sqlUpdate = "UPDATE Member SET Password = @Password, Name = @Name, Phone = @Phone WHERE UserID = @UserID";
        SqlCommand cmdSelect = new SqlCommand(sqlSelect, con);
        SqlCommand cmdUpdate = new SqlCommand(sqlUpdate, con);
        cmdUpdate.Parameters.AddWithValue("@Password", TextBox1.Text);
        cmdUpdate.Parameters.AddWithValue("@Name", TextBox2.Text);
        cmdUpdate.Parameters.AddWithValue("@Phone", TextBox3.Text);
        cmdUpdate.Parameters.AddWithValue("@UserID", DropDownList1.SelectedValue);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmdSelect;
        ad.UpdateCommand = cmdUpdate;
        DataSet ds = new DataSet();
        ad.Fill(ds);

        DataTable dt = ds.Tables[0];
        DataRow[] rows = dt.Select("UserID = '" + DropDownList1.SelectedValue + "'");
        if (rows.Length > 0)
        {
            rows[0]["Password"] = TextBox1.Text;
            rows[0]["Name"] = TextBox2.Text;
            rows[0]["Phone"] = TextBox3.Text;

            ad.Update(ds);

            Label2.Text = Label1.Text + "의 정보가 수정되었습니다.";
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

    // 회원 정보 바인딩
    void SetInfo()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT UserID, Password, Name, Phone FROM Member WHERE UserID = @UserID", con);
        cmd.Parameters.AddWithValue("@UserID", DropDownList1.SelectedValue);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;
        DataSet ds = new DataSet();
        ad.Fill(ds);

        DataTable dt = ds.Tables[0];
        if (dt.Rows.Count > 0)
        {
            DataRow row = dt.Rows[0];
            Label1.Text = row["UserID"].ToString();
            TextBox1.Text = row["Password"].ToString();
            TextBox2.Text = row["Name"].ToString();
            TextBox3.Text = row["Phone"].ToString();
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
        <h3>비연결기반 수정 예제</h3>

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
