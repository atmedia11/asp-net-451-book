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
        <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
            <ItemTemplate>
                <div>
                    <%# Eval("UserID") %>, <%# Eval("Password") %>, <%# Eval("Name") %>, <%# Eval("Phone") %>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="2">
            <Fields>
                <asp:NumericPagerField />
            </Fields>
        </asp:DataPager>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="Member" SelectMethod="SelectMemberPaging" SelectCountMethod="SelectMemberCount" EnablePaging="true">
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
