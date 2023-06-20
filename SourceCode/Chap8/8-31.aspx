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
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" DataSourceID="ObjectDataSource1" DataTextField="UserID" DataValueField="UserID">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectMember" TypeName="Member">
        </asp:ObjectDataSource>
        <br /><br />
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="ObjectDataSource2">
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectMemberByUserID" TypeName="Member">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="userID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
