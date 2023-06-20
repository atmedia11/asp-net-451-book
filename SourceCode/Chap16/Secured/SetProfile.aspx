<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ListItem item = ddlBackColor.Items.FindByValue(Profile.MainBackColor);
            if (item != null)
                item.Selected = true;

            if (Profile.EnableCalendar) // 캘린더 사용
                rbYes.Checked = true;
            else // 캘린더 미사용
                rbNo.Checked = true;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Profile.MainBackColor = ddlBackColor.SelectedItem.Value;
        if (rbYes.Checked)
            Profile.EnableCalendar = true; // 캘린더 사용
        else
            Profile.EnableCalendar = false; // 캘린더 미사용

        Response.Redirect("~/Default.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    메인 페이지 배경 색깔 : 
    <asp:DropDownList ID="ddlBackColor" runat="server">
        <asp:ListItem Value="">기본</asp:ListItem>
        <asp:ListItem Value="gold">Gold</asp:ListItem>
        <asp:ListItem Value="salmon">Salmon</asp:ListItem>
        <asp:ListItem Value="cyan">Cyan</asp:ListItem>
    </asp:DropDownList><br />
    캘런더 사용 여부 :
    <asp:RadioButton ID="rbYes" runat="server" Text="사용" GroupName="CheckCalendar" Checked="true" />
    <asp:RadioButton ID="rbNo" runat="server" Text="미사용" GroupName="CheckCalendar" /><br /><br />
    <asp:Button ID="btnSave" runat="server" Text="설정 저장" OnClick="btnSave_Click"/>
</asp:Content>

