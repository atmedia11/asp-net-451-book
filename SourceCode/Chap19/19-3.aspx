<%@ Page Language="C#" %>
<%@ Register src="CountAfterLoading.ascx" tagname="CountAfterLoading" tagprefix="uc1" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string currentTime = DateTime.Now.ToLongTimeString();
        lblTime1.Text = currentTime;
        lblTime2.Text = currentTime;
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
                    <legend>UpdatePanel1</legend>
                    웹 서버의 현재 시간1 : <asp:Label ID="lblTime1" runat="server"></asp:Label><br />
                    <asp:Button ID="btnInner1" runat="server" Text="내부 버튼1" />
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel><br />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <fieldset>
                    <legend>UpdatePanel2</legend>
                    웹 서버의 현재 시간2 : <asp:Label ID="lblTime2" runat="server"></asp:Label><br />
                    <asp:Button ID="btnInner2" runat="server" Text="내부 버튼2" />
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>    
    </div>
    </form>
</body>
</html>
