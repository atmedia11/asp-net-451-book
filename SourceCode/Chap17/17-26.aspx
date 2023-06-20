<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label2.Text = "&lt;Button1&gt;에 의해 다시 게시(postback)되었습니다.";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label3.Text = "당신의 이름은 " + TextBox2.Text + "입니다.";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
    //<![CDATA[
        function keyDown() {
            document.getElementById("Label1").innerHTML = "keyDown 이벤트 발생.";
        }

        function keyUp() {
            document.getElementById("Label1").innerHTML = "keyUp 이벤트 발생.";
        }

        function validateInput() {
            var tb1 = document.getElementById("TextBox2");
            if (tb1.value.trim() == "") {
                alert("이름을 입력하세요.");
                tb1.focus();
                return false;
            }
            return true;
        }
    //]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" onkeydown="keyDown()" onkeyup="keyUp()"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />

        <asp:Button ID="Button1" runat="server" Text="Button1" OnClientClick="alert('안녕하세요.')" OnClick="Button1_Click" />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label><br />

        이름 : <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Button2" OnClientClick="return validateInput()" OnClick="Button2_Click" />
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>    
    </div>
    </form>
</body>
</html>
