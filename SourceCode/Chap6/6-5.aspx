﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "선택한 스포츠 : ";
        if (CheckBox1.Checked)
            Label1.Text += CheckBox1.Text + " ";
        if (CheckBox2.Checked)
            Label1.Text += CheckBox2.Text + " ";
        if (CheckBox3.Checked)
            Label1.Text += CheckBox3.Text;
    }

    protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox4.Checked)
            Label2.Text = "메일링에 가입 합니다.";
        else
            Label2.Text = "메일링에 가입 하지 않습니다.";
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
        <h3>CheckBox 컨트롤 예제</h3>
        
        <h4>1. 좋아하는 스포츠를 고르세요.</h4>
        <asp:CheckBox ID="CheckBox1" runat="server" Text="야구" /><br />
        <asp:CheckBox ID="CheckBox2" runat="server" Text="축구" TextAlign="Left" /><br />
        <asp:CheckBox ID="CheckBox3" runat="server" Text="농구" Enabled="false"/><br />        
        <asp:Button ID="Button1" runat="server" Text="선택" OnClick="Button1_Click" /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                
        <h4>2. 메일링에 가입 여부 체크</h4>
        <asp:CheckBox ID="CheckBox4" runat="server" Text="메일링 가입" AutoPostBack="true" OnCheckedChanged="CheckBox4_CheckedChanged" /><br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>        
    </div>
    </form>
</body>
</html>
