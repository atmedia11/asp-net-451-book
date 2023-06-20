<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    void SetCounter(string count)
    {
        Response.Cookies["Counter"].Value = count;
        Response.Cookies["Counter"].Expires = DateTime.Now.AddSeconds(5); // 쿠키는 만료 시기를 설정할 수 있는데 여기서는 5초 뒤에 "Counter" 키를 가지는 쿠키 컬렉션 항목이 만료(삭제)되도록 설정했다. 그러므로 btnPlus, btnMinus 버튼을 클릭한 후 5초가 지나면 쿠키가 만료된다. 테스트해보자.
        lblCounter.Text = count;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Counter"] == null) // "Counter" 키를 가지는 쿠키 컬렉션 항목이 존재하지 않는다면(이 페이지를 처음 요청했거나 해당 쿠키가 만료되었을 경우).
        {
            Response.Cookies["Counter"].Value = "0"; // "Counter" 키를 가지는 쿠키 컬렉션 항목을 선언하고 "0"으로 초기화 한다.
        }
    }

    protected void btnPlus_Click(object sender, EventArgs e)
    {
        int count = int.Parse(Request.Cookies["Counter"].Value) + 1;
        SetCounter(count.ToString());
    }

    protected void btnMinus_Click(object sender, EventArgs e)
    {
        int count = int.Parse(Request.Cookies["Counter"].Value) - 1;
        SetCounter(count.ToString());
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
        <h3>쿠키를 이용한 카운터 예제</h3>

        <asp:Label ID="lblCounter" runat="server" Text="0"></asp:Label>
        <asp:Button ID="btnPlus" runat="server" Text=" + " onclick="btnPlus_Click" />
        <asp:Button ID="btnMinus" runat="server" Text=" - " onclick="btnMinus_Click" />    
    </div>
    </form>
</body>
</html>
