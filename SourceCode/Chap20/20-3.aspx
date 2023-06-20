<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    void SetCounter(int count)
    {
        ViewState["Counter"] = count;
        lblCounter.Text = count.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["Counter"] = 0; // "Counter" 키를 가지는 뷰 상태 컬렉션 항목을 선언하고 0으로 초기화 한다.
        }
    }

    protected void btnPlus_Click(object sender, EventArgs e)
    {
        int count = (int)ViewState["Counter"] + 1; // 뷰 상태 컬렉션은 object 형식의 값을 반환하므로 반환된 값을 특정 형식으로 사용하기 위해서는 명시적 변환이 필요하다.
        SetCounter(count);
    }

    protected void btnMinus_Click(object sender, EventArgs e)
    {
        int count = (int)ViewState["Counter"] - 1;
        SetCounter(count);
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
        <h3>뷰 상태를 이용한 카운터 예제</h3>

        <asp:Label ID="lblCounter" runat="server" Text="0"></asp:Label>
        <asp:Button ID="btnPlus" runat="server" Text=" + " onclick="btnPlus_Click" />
        <asp:Button ID="btnMinus" runat="server" Text=" - " onclick="btnMinus_Click" />    
    </div>
    </form>
</body>
</html>
