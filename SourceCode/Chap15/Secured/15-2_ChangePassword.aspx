<%@ Page Title="" Language="C#" MasterPageFile="~/15-2_MasterPage.master" %>

<script runat="server">

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(User.Identity.Name, txtOldPassword.Text))
        {
            MembershipUser user = Membership.GetUser();
            user.ChangePassword(txtOldPassword.Text, txtNewPassword.Text);
            lblChangePasswordMessage.Text = "암호가 수정되었습니다.";
        }
        else
        {
            lblChangePasswordMessage.Text = "기존의 암호가 정확하지 않습니다.";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    암호: <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="암호를 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator><br />
    새 암호: <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="새 암호를 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator><br />
    새 암호 확인: <asp:TextBox ID="txtNewPasswordConfirm" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPasswordConfirm" ErrorMessage="새 암호 확인을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToValidate="txtNewPasswordConfirm" ControlToCompare="txtNewPassword" ErrorMessage="암호가 일치하지 않습니다." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:CompareValidator>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="CreateUser" /><br />
    <asp:Button ID="btnUpdate" runat="server" Text="암호 변경" onclick="btnUpdate_Click" ValidationGroup="CreateUser"/>    
    <asp:Button ID="btnCancel" runat="server" Text="취소" /><br />
    <asp:Label ID="lblChangePasswordMessage" runat="server" Text=""></asp:Label>
</asp:Content>

