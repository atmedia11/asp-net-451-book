<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        DetailsView1.DataBind();
    }

    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = DropDownList1.SelectedValue;
    }

    protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        Response.Write(DropDownList1.SelectedValue + " 정보 조회가 완료되었습니다.");
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
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserID" DataValueField="UserID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT [UserID] FROM [Member]">
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="확인" OnClick="Button1_Click" />
        <br /><br />
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource2">
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Member] WHERE ([UserID] = @UserID)" OnSelecting="SqlDataSource2_Selecting" OnSelected="SqlDataSource2_Selected">
            <SelectParameters>
                <asp:Parameter Name="UserID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>    
    </div>
    </form>
</body>
</html>
