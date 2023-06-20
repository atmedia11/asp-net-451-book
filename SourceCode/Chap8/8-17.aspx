<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT M.UserID, C.ItemName, C.Qty, C.Price FROM Member M INNER JOIN Cart C ON M.UserID = C.UserID";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();

        GridView1.DataSource = rd;
        GridView1.DataBind();

        rd.Close();
        con.Close();
    }

    public int GetAmount(int qty, int price)
    {
        return qty * price;
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
        <h3>GridView 컨트롤 예제4</h3>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="아이디">
                    <ItemTemplate>
                        <%# Eval("UserID") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="물품">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemName") %>' ForeColor="Blue"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="수량">
                    <ItemTemplate>
                        <%# Eval("Qty") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="단가">
                    <ItemTemplate>
                        <%# Eval("Price") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="합계">
                    <ItemTemplate>
                        <%# GetAmount((int)Eval("Qty"), (int)Eval("Price")) %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>    
    </div>
    </form>
</body>
</html>
