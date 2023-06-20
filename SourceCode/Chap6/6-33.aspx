<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Submit1_ServerClick(object sender, EventArgs e)
    {
        div1.InnerHtml = Text1.Value + "<br />"
            + Password1.Value + "<br />"
            + (Radio1.Checked ? "남" : "여") + "<br />"
            + (Checkbox1.Checked ? "메일링 가입" : "메일링 미가입");
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
        <h3>HTML 서버 컨트롤 예제</h3>
        
        아이디: <input id="Text1" type="text" runat="server" /><br />
        비밀번호: <input id="Password1" type="password" runat="server" /><br />
        성별: 남<input id="Radio1" type="radio" name="gender" runat="server" checked="true" />
        여<input id="Radio2" type="radio" name="gender" runat="server" /><br />
        메일링 가입<input id="Checkbox1" type="checkbox" runat="server" /><br />
        <input id="Submit1" type="submit" value="확인" runat="server" OnServerClick="Submit1_ServerClick" /><br />
        <div id="div1" runat="server"></div>    
    </div>
    </form>
</body>
</html>
