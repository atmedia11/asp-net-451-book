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

        ListView1.DataSource = rd;
        ListView1.DataBind();

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
        <h3>ListView 컨트롤 예제2</h3>

        <asp:ListView ID="ListView1" runat="server" GroupItemCount="3">
            <LayoutTemplate>
                <table border="1">
                    <tr id="groupPlaceholder" runat="server"></tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td>
                    아이디: <%# Eval("UserID") %><br />
                    암호: <%# Eval("Password") %><br />
                    이름: <%# Eval("Name") %><br />
                    연락처: <%# Eval("Phone") %>
                </td>
            </ItemTemplate>
            <EmptyItemTemplate>
                <td style="text-align: center;">
                    정보 없음
                </td>
            </EmptyItemTemplate>
            <EmptyDataTemplate>
                조회된 회원 정보가 없습니다.
            </EmptyDataTemplate>
        </asp:ListView>    
    </div>
    </form>
</body>
</html>
