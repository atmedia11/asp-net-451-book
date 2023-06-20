<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT UserID, Password, Name, Phone From Member";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();

        Repeater1.DataSource = rd;
        Repeater1.DataBind();

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
        <h3>Repeater 컨트롤 예제2</h3>

        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table border="1">
                    <tr>
                        <td><b>아이디</b></td>
                        <td><b>암호</b></td>
                        <td><b>이름</b></td>
                        <td><b>연락처</b></td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("UserID") %></td>
                    <td><%# Eval("Password") %></td>
                    <td><%# Eval("Name") %></td>
                    <td><%# Eval("Phone") %></td>
                </tr>
            </ItemTemplate>
            <SeparatorTemplate>
                <tr>
                    <td colspan="4" style="background-color: Blue; height: 1px;"></td>
                </tr>
            </SeparatorTemplate>
            <AlternatingItemTemplate>
                <tr style="background-color: Silver;">
                    <td><%# Eval("UserID") %></td>
                    <td><%# Eval("Password") %></td>
                    <td><%# Eval("Name") %></td>
                    <td><%# Eval("Phone") %></td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>    
    </div>
    </form>
</body>
</html>
