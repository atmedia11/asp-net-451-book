<%@ Page Language="C#" %>
<%@ Register src="CountAfterLoading.ascx" tagname="CountAfterLoading" tagprefix="uc1" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnInner_Click(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToLongTimeString();
        UpdatePanel2.Update();
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <fieldset>
                    <legend>UpdatePanel1</legend>
                    <asp:Button ID="btnInner" runat="server" Text="내부 버튼" OnClick="btnInner_Click" />
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel><br />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <fieldset>
                    <legend>UpdatePanel2</legend>
                    웹 서버의 현재 시간 : <asp:Label ID="lblTime" runat="server"></asp:Label>
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>    
    </div>
    </form>
</body>
</html>
