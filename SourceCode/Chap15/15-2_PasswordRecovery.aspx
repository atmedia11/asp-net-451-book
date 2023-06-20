<%@ Page Title="" Language="C#" MasterPageFile="~/15-2_MasterPage.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Net.Mail" %>

<script runat="server">

    protected void btnOk1_Click(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(txtUserName.Text);
        if (user != null)
        {
            PlaceHolder1.Visible = false;
            PlaceHolder2.Visible = true;

            lblUserName.Text = user.UserName;
            lblQuestion.Text = user.PasswordQuestion;
        }
        else
        {
            lblMessage.Text = "존재하지 않는 사용자입니다.";
        }
    }

    // 암호 찾기 시 전자 메일 발송.
    protected void btnOk2_Click(object sender, EventArgs e)
    {   
        if (IsCorrectAnswer()) // 정확한 보안 대답을 입력했다면
        {
            MembershipUser user = Membership.GetUser(lblUserName.Text);
            
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("master@atmedia.co.kr"); // 보낸 사람 주소
            mail.To.Add(new MailAddress(user.Email)); // 받는 사람 주소
            mail.Subject = "암호 찾기 결과입니다."; // 제목
            mail.Body = "사용자 이름: " + user.UserName + "<br />" + "암호: " + user.ResetPassword(txtAnswer.Text); // 본문
            mail.IsBodyHtml = true; // 본문의 형식이 HTML인지의 여부
            
            //mail.Attachments.Add(new Attachment(@"C:\readme.txt")); // 파일 첨부
                
            SmtpClient client = new SmtpClient("localhost");            
            /* gmail SMTP 서버를 사용하고자 할 경우 아래의 주석 처리된 소스 코드를 사용하면 된다. */
            //client.Host = "smtp.gmail.com";
            //client.EnableSsl = true;
            //client.Port = int.Parse("587");
            //client.UseDefaultCredentials = false;
            //System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("YourAccount@gmail.com", "Password");
            //client.Credentials = credentials;
            try
            {
                client.Send(mail);
                lblMessage.Text = "새로운 암호가 " + user.Email + " 주소로 발송되었습니다.";
            }
            catch
            {
                lblMessage.Text = "전자 메일 발송 도중 오류가 발생했습니다.";
            }
        }
        else
        {
            lblMessage.Text = "보안 대답이 일치하지 않습니다.";
        }
    }

    // 정확한 보안 대답의 입력 여부를 확인.
    bool IsCorrectAnswer()
    {
        string passwordSalt = "";
        string passwordAnswer = "";

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString);

        string sql = "SELECT M.PasswordSalt, M.PasswordAnswer"
        + " FROM aspnet_Users U INNER JOIN aspnet_Membership M"
        + " ON U.UserId = M.UserId"
        + " WHERE U.UserName = @UserName";

        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserName", lblUserName.Text);

        con.Open();

        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.Read())
        {
            passwordSalt = rd["PasswordSalt"].ToString();
            passwordAnswer = rd["PasswordAnswer"].ToString();
        }

        rd.Close();
        con.Close();

        string hasedAnswer = GenerateHash(txtAnswer.Text, passwordSalt);

        return passwordAnswer == hasedAnswer; // DB에 있는 보안 대답(passwordAnswer)과 사용자가 입력한 보안 대답(hasedAnswer)이 같은가?
    }

    /* 멤버 자격에서는 보안 대답(PasswordAnswer) 역시 Hash로 암호화되어 저장되기 때문에
     * 사용자가 정확한 보안 대답을 입력 했는지를 알기 위해서는
     * 아래의 GenerateHash() 메서드를 사용하여 사용자가 입력한 보안 대답을 Hash로 암호화 하여 비교하는 과정이 필요하다.
     * 그리고 아래의 복잡해 보이는 GenerateHash() 메서드는 현 단계에서 굳이 이해할 필요가 없으므로 참고만 하기 바란다.
     * GenerateHash() 메서드 출처: http://stackoverflow.com/questions/2687196/asp-net-membership-c-sharp-how-to-compare-existing-password-hash */

    public string GenerateHash(string pwd, string saltAsBase64)
    {
        byte[] p1 = Convert.FromBase64String(saltAsBase64);
        return GenerateHash(pwd, p1);
    }

    public string GenerateHash(string pwd, byte[] saltAsByteArray)
    {
        System.Security.Cryptography.SHA1 sha = new System.Security.Cryptography.SHA1CryptoServiceProvider();

        byte[] p1 = saltAsByteArray;
        byte[] p2 = System.Text.Encoding.Unicode.GetBytes(pwd);

        byte[] data = new byte[p1.Length + p2.Length];

        p1.CopyTo(data, 0);
        p2.CopyTo(data, p1.Length);

        byte[] result = sha.ComputeHash(data);

        string res = Convert.ToBase64String(result);
        return res;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    암호 찾기<br />
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        사용자 이름:<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <asp:Button ID="btnOk1" runat="server" Text="확인" onclick="btnOk1_Click" />
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible="false">
        사용자 이름:<asp:Label ID="lblUserName" runat="server"></asp:Label><br />
        보안 질문:<asp:Label ID="lblQuestion" runat="server"></asp:Label><br />
        보안 대답:<asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox><br />
        <asp:Button ID="btnOk2" runat="server" Text="확인" onclick="btnOk2_Click" />
    </asp:PlaceHolder><br /><br />
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
</asp:Content>

