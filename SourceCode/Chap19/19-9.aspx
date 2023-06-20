<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToLongTimeString();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--ScriptManagerProxy 컨트롤에 대한 자세한 설명은 http://msdn.microsoft.com/ko-kr/library/system.web.ui.scriptmanagerproxy(v=vs.110).aspx 페이지를 참고하자.--%>
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        <Scripts>
            <%--참조할 스크립트 선언--%>
        </Scripts>
        <Services>
            <%--참조할 웹 서비스 선언--%>
        </Services>
    </asp:ScriptManagerProxy>
    <%--만약 위의 ScriptManagerProxy 컨트롤 대신 아래의 주석 처리된 ScriptManager 컨트롤을 사용하면 오류가 발생한다. 왜냐하면 웹 페이지에는 ScriptManager 컨트롤이 하나만 포함될 수 있는데 이미 마스터 페이지에 ScriptManager 컨트롤이 포함되어 있기 때문이다.--%>
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>UpdatePanel (콘텐츠 페이지)</legend>
                웹 서버의 현재 시간 : <asp:Label ID="lblTime" runat="server"></asp:Label><br />
                <asp:Button ID="btnInner" runat="server" Text="내부 버튼" />
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

