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
        <asp:SiteMapPath ID="SiteMapPath1" runat="server">
        </asp:SiteMapPath>

        <%--<br /><br />
        <asp:SiteMapPath ID="SiteMapPath2" runat="server" PathSeparator=" | ">
        </asp:SiteMapPath>--%>

        <%--<br /><br />
        <asp:SiteMapPath ID="SiteMapPath3" runat="server" PathDirection="CurrentToRoot">
        </asp:SiteMapPath>--%>

        <%--<br /><br />
        <asp:SiteMapPath ID="SiteMapPath4" runat="server" ParentLevelsDisplayed="2">
        </asp:SiteMapPath>--%>

        <%--<br /><br />
        <asp:SiteMapPath ID="SiteMapPath5" runat="server">
            <RootNodeTemplate>
                <b><a href='<%# Eval("URL") %>'>홈</a></b>
            </RootNodeTemplate>
            <NodeTemplate>
                <a href='<%# Eval("URL") %>'><%# Eval("Title") %></a>
            </NodeTemplate>
            <CurrentNodeTemplate>
                <%# Eval("Title") %> [<%# Eval("Description") %>]
            </CurrentNodeTemplate>
            <PathSeparatorTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/right_arrow.jpg" ImageAlign="Middle" />
            </PathSeparatorTemplate>
        </asp:SiteMapPath>--%>
    </div>
    </form>
</body>
</html>
