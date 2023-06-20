<%@ Page Language="C#" %>
<%@ Register src="CountAfterLoading.ascx" tagname="CountAfterLoading" tagprefix="uc1" %>

<!DOCTYPE html>

<script runat="server">

    protected void Timer1_Tick(object sender, EventArgs e)
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
                    웹 서버의 현재 시간 : <asp:Label ID="lblTime" runat="server"></asp:Label>
                    <asp:Timer ID="Timer1" runat="server" Interval="2000" ontick="Timer1_Tick"></asp:Timer>
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>    
    </div>
    </form>
</body>
</html>
