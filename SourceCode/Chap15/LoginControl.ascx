<%@ Control Language="C#" ClassName="LoginControl" %>

<script runat="server">

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(txtUserName.Text, txtPassword.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, chkRememberMe.Checked);
        }
        else
        {
            lblLoginMessage.Text = "아이디가 존재하지 않거나 암호가 정확하지 않습니다.";
        }
    }
</script>

사용자 이름:<br /><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br />
암호:<br /><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
<asp:CheckBox ID="chkRememberMe" runat="server" />사용자 이름 및 암호 저장<br />
<asp:Button ID="btnLogin" runat="server" Text="로그인" onclick="btnLogin_Click" /><br />
<asp:Label ID="lblLoginMessage" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label><br />
<a href="15-2_CreateUserWizard.aspx">회원가입</a>
<a href="15-2_PasswordRecovery.aspx">암호 찾기</a>