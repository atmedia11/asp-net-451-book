<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // SqlConnection 개체 생성
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        // SqlCommand 개체 생성
        string sql = "SELECT UserID, Password, Name, Phone From Member";
        SqlCommand cmd = new SqlCommand(sql, con);

        // SqlDataAdapter 개체 생성
        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;

        // DataSet 개체 생성 및 데이터 채우기
        DataSet ds = new DataSet();
        ad.Fill(ds);

        // 데이터 바인딩
        DataTable dt = ds.Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Label1.Text += String.Format("{0}, {1}, {2}, {3}<br />", dt.Rows[i]["UserID"], dt.Rows[i]["Password"], dt.Rows[i]["Name"], dt.Rows[i]["Phone"]);
        }

        DropDownList1.DataSource = ds;
        DropDownList1.DataValueField = "UserID";
        DropDownList1.DataTextField = "Name";
        DropDownList1.DataBind();
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
        <h3>비연결기반 조회 예제</h3>

        <asp:Label ID="Label1" runat="server"></asp:Label><br />
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>    
    </div>
    </form>
</body>
</html>
