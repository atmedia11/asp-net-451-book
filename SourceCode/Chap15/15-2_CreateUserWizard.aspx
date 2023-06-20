<%@ Page Title="" Language="C#" MasterPageFile="~/15-2_MasterPage.master" %>

<script runat="server">

    protected void btnSave_Click(object sender, EventArgs e)
    {
        MembershipCreateStatus status;
        Membership.CreateUser(txtUserName.Text, txtPassword.Text, txtEmail.Text, txtQuestion.Text, txtAnswer.Text, true, out status);

        switch (status)
        {
            case MembershipCreateStatus.DuplicateEmail:
                lblMessage.Text = "이미 사용되고 있는 전자 메일 주소입니다.";
                break;
            case MembershipCreateStatus.DuplicateUserName:
                lblMessage.Text = "이미 사용되고 있는 사용자 이름(아이디)입니다.";
                break;
            case MembershipCreateStatus.InvalidUserName:
                lblMessage.Text = "사용자 이름이 유효하지 않습니다. 다시 입력하세요.";
                break;
            case MembershipCreateStatus.InvalidPassword:
                lblMessage.Text = "암호가 유효하지 않습니다.";
                break;
            case MembershipCreateStatus.Success:
                lblMessage.Text = "회원 가입이 성공적으로 이루어졌습니다!!!";
                break;
            default:
                lblMessage.Text = "회원 가입 도중 오류가 발생했습니다.";
                break;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    사용자 등록<br />
    사용자 이름:<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="사용자 이름(아이디)을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator><br />
    암호:<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="암호를 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator><br />
    암호 확인:<asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="암호 확인을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="암호가 일치하지 않습니다." Text="*" SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:CompareValidator><br />
    전자 메일:<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="전자 메일을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="전자 메일이 정확하지 않습니다." Text="*" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RegularExpressionValidator><br />
    보안 질문:<asp:TextBox ID="txtQuestion" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtQuestion" ErrorMessage="보안 질문을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator><br />
    보안 대답:<asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAnswer" ErrorMessage="보안 대답을 입력하세요." Text="*" SetFocusOnError="true" Display="Dynamic" ForeColor="Red" ValidationGroup="CreateUser"></asp:RequiredFieldValidator><br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false" ShowMessageBox="true" ValidationGroup="CreateUser" />
    <asp:Button ID="btnSave" runat="server" Text="저장" onclick="btnSave_Click" ValidationGroup="CreateUser" /><br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>

