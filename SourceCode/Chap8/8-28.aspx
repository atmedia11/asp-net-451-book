<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="UserID" DataValueField="UserID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT [UserID] FROM [Member]">
        </asp:SqlDataSource>
        <br /><br />
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource2">
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Member] WHERE ([UserID] = @UserID)">
            <SelectParameters>
                <asp:ControlParameter Name="UserID" Type="String" ControlID="DropDownList1" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>    
    </div>
    </form>
</body>
</html>
