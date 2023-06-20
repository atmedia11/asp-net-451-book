<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            divContainer.Style.Add(HtmlTextWriterStyle.BackgroundColor, Profile.MainBackColor);
            Calendar1.Visible = Profile.EnableCalendar;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="divContainer" runat="server">
        메인 페이지 입니다.<br />
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar><br />
        <a href="Secured/SetProfile.aspx">프로필 설정 페이지로 이동</a>
    </div>
</asp:Content>

