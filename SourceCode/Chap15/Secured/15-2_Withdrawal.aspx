<%@ Page Title="" Language="C#" MasterPageFile="~/15-2_MasterPage.master" %>

<script runat="server">

    protected void btnWithdraw_Click(object sender, EventArgs e)
    {
        if (Membership.DeleteUser(User.Identity.Name))
        {
            FormsAuthentication.SignOut();
            Response.Redirect(FormsAuthentication.DefaultUrl);
        }
        else
        {
            lblMessage.Text = "회원 탈퇴가 정상적으로 이루어지지 않았습니다.";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    탈퇴 하시겠습니까? 
    <asp:Button ID="btnWithdraw" runat="server" Text="확인" onclick="btnWithdraw_Click" />
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
</asp:Content>

