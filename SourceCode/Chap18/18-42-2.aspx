<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // 보통은 POST 방식으로 전달된 정보를 사용하여 
            // 데이터베이스의 저장, 수정, 삭제 작업을 처리하지만 
            // 여기서는 예제를 단순화 시키기 위해, 전달된 정보를 단순히 출력한다.
            lblUserID.Text = Request.Form["userID"];
            lblUserName.Text = Request.Form["userName"];
            lblCreditCard.Text = Request.Form["creditCard"];
        }
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
        <h3>POST 방식</h3>

        사용자 ID : <asp:Label ID="lblUserID" runat="server"></asp:Label><br />
        사용자 이름 : <asp:Label ID="lblUserName" runat="server"></asp:Label><br />
        신용카드 번호 : <asp:Label ID="lblCreditCard" runat="server"></asp:Label><br />
        <br />
        <input type="button" value="이전" onclick="history.back()" />
    </div>
    </form>
</body>
</html>
