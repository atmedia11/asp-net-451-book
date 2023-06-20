<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "선택한 스포츠: ";
        if (RadioButton1.Checked)
            Label1.Text += RadioButton1.Text;
        else if (RadioButton2.Checked)
            Label1.Text += RadioButton2.Text;
        else if (RadioButton3.Checked)
            Label1.Text += RadioButton3.Text;
        else
            Label1.Text += "없음";
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
        <h3>RadioButton 컨트롤 예제</h3>
        
        <h4>* 좋아하는 스포츠를 고르세요.</h4>
        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Sports" Text="야구" /><br />
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Sports" Text="축구" /><br />
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Sports" Text="농구" Enabled="false" /><br />
        <asp:Button ID="Button1" runat="server" Text="선택" OnClick="Button1_Click" /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>         
    </div>
    </form>
</body>
</html>
