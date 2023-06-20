<%@ Page Title="" Language="C#" MasterPageFile="~/15-1_MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
        <MailDefinition Subject="암호 찾기 결과입니다."></MailDefinition>
    </asp:PasswordRecovery>
</asp:Content>
