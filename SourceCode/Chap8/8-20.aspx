<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindList();
        }
    }

    void BindList()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string sql = "SELECT UserID, Password, Name, Phone From Member";
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;

        DataSet ds = new DataSet();
        ad.Fill(ds);

        ListView1.DataSource = ds;
        ListView1.DataBind();
    }

    protected void DataPager1_PreRender(object sender, EventArgs e)
    {
        BindList();
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
        <h3>ListView 컨트롤 예제1</h3>

        <asp:ListView ID="ListView1" runat="server">
            <LayoutTemplate>
                <table border="1">
                    <tr>
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
        </asp:ListView>

        <asp:DataPager ID="DataPager1" runat="server" PageSize="3" PagedControlID="ListView1" OnPreRender="DataPager1_PreRender">
            <Fields>
                <asp:TemplatePagerField>
                    <PagerTemplate>
                        <%# Container.TotalRowCount > 0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>
                        /
                        <%# Math.Ceiling((double)Container.TotalRowCount / Container.PageSize) %> Page
                        (총 <%# Container.TotalRowCount%> 회원)
                    </PagerTemplate>
                </asp:TemplatePagerField>
                <asp:NextPreviousPagerField ShowPreviousPageButton="true" ShowNextPageButton="false" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowNextPageButton="true" />
            </Fields>
        </asp:DataPager>
    </div>
    </form>
</body>
</html>
