<%@ Page Language="C#" %>
<%@ Register src="CountAfterLoading.ascx" tagname="CountAfterLoading" tagprefix="uc1" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnInner_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
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
                    <asp:Button ID="btnInner" runat="server" Text="내부 버튼" OnClick="btnInner_Click" />
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel><br />

        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <img src="Images/ajax-loader.gif" alt="loader" /> 업데이트 처리중 입니다...
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    </form>
</body>
</html>
