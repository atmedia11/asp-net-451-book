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

        DataList1.DataSource = rd;
        DataList1.DataBind();

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
        <h3>DataList 컨트롤 예제</h3>

        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
            <ItemTemplate>
                아이디: <%# Eval("UserID") %> <br />
                암호: <%# Eval("Password") %> <br /> 
                이름: <%# Eval("Name") %> <br /> 
                연락처: <%# Eval("Phone") %>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div style="background-color: Silver;">
                    아이디: <%# Eval("UserID") %> <br />
                    암호: <%# Eval("Password") %> <br /> 
                    이름: <%# Eval("Name") %> <br /> 
                    연락처: <%# Eval("Phone") %>
                </div>
            </AlternatingItemTemplate>
        </asp:DataList>    
    </div>
    </form>
</body>
</html>
