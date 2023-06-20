<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
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
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "MySelectedItem")
        {
            Label1.Text = e.CommandArgument.ToString();
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
        <h3>GridView 컨트롤 예제6</h3>

        선택한 회원: <asp:Label ID="Label1" runat="server"></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="아이디" />
                <asp:BoundField DataField="Password" HeaderText="암호" />
                <asp:BoundField DataField="Name" HeaderText="이름" />
                <asp:BoundField DataField="Phone" HeaderText="연락처" />
                <asp:TemplateField HeaderText="명령">
                    <ItemTemplate>
                        <asp:Button ID="btnPrintUserID" runat="server" Text="항목 선택" CommandName="MySelectedItem" CommandArgument='<%# Eval("UserID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
