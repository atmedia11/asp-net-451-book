<%@ Page Title="" Language="C#" MasterPageFile="~/15-2_MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated) // 인증된 사용자라면
        {
            if (!Page.IsPostBack)
            {
                MembershipUser user = Membership.GetUser();
                lblUserName.Text = user.UserName;
                txtEmail.Text = user.Email;
                txtQuestion.Text = user.PasswordQuestion;
            }
        }
        else
        {
            Response.Redirect(FormsAuthentication.LoginUrl);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(User.Identity.Name, txtPassword.Text))
        {
            MembershipUser user = Membership.GetUser();
            user.Email = txtEmail.Text;
            Membership.UpdateUser(user);
            user.ChangePasswordQuestionAndAnswer(txtPassword.Text, txtQuestion.Text, txtAnswer.Text);
            lblMessage.Text = "정보가 수정되었습니다.";
        }
        else
        {
            lblMessage.Text = "암호가 정확하지 않습니다.";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    정보 수정<br />
    사용자 이름:<asp:Label ID="lblUserName" runat="server"></asp:Label><br />
    전자 메일:<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="전자 메일을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="UpdateUser"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="전자 메일이 정확하지 않습니다." Text="*" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red" ValidationGroup="UpdateUser"></asp:RegularExpressionValidator><br />
    보안 질문:<asp:TextBox ID="txtQuestion" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtQuestion" ErrorMessage="보안 질문을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="UpdateUser"></asp:RequiredFieldValidator><br />
    보안 대답:<asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAnswer" ErrorMessage="보안 대답을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="UpdateUser"></asp:RequiredFieldValidator><br />
    암호:<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="암호를 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="UpdateUser"></asp:RequiredFieldValidator><br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="UpdateUser" />
    <asp:Button ID="btnSave" runat="server" Text="저장" onclick="btnSave_Click" ValidationGroup="UpdateUser" /><br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>

