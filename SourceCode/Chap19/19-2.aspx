<%@ Page Language="C#" %>
<%@ Register src="CountAfterLoading.ascx" tagname="CountAfterLoading" tagprefix="uc1" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToLongTimeString();
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
        <uc1:CountAfterLoading ID="CountAfterLoading1" runat="server" /><br /><br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <fieldset>
                    <legend>UpdatePanel</legend>
                    웹 서버의 현재 시간 : <asp:Label ID="lblTime" runat="server"></asp:Label><br />
                    <asp:Button ID="btnInner" runat="server" Text="내부 버튼 (PostBackTrigger 적용)" />
                </fieldset>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnOuter" />
                <asp:PostBackTrigger ControlID="btnInner" />
            </Triggers>
        </asp:UpdatePanel><br />
        <asp:Button ID="btnOuter" runat="server" Text="외부 버튼 (AsyncPostBackTrigger 적용)" />
    </div>
    </form>
</body>
</html>
