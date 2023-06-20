<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(TextBox1.Text + "<br />");
        Response.Write(TextBox2.Text + "<br />");
        Response.Write(TextBox3.Text + "<br />");
        Response.Write(TextBox4.Text + "<br />");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>TextBox 컨트롤 예제</h3>
        
        <table>
            <tr>
                <td>이름 : </td>
                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>아이디 : </td>
                <td><asp:TextBox ID="TextBox2" runat="server" MaxLength="12"></asp:TextBox></td>
            </tr>
            <tr>
                <td>암호 : </td>
                <td><asp:TextBox ID="TextBox3" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox></td>
            </tr>
            <tr>
                <td>기타 : </td>
                <td><asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="3" Columns="30" ></asp:TextBox></td>
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" Text="확인" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
