<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string userID = Request.QueryString["userID"];
            if (userID != null)
            {
                lblUserID.Text = userID;
                lblUserName.Text = GetUserName(userID);
            }
        }
    }

    string GetUserName(string userID)
    {
        // 보통은 데이터베이스에서 정보를 조회해오지만 
        // 예제를 단순화시키기 위해 사용자 정보를 Dictionary 제네릭 컬렉션에 저장해두었다.
        Dictionary<string, string> userInfo = new Dictionary<string, string>();
        userInfo.Add("aaaa", "홍길동");
        userInfo.Add("bbbb", "김철수");
        userInfo.Add("cccc", "이영희");

        return userInfo[userID];
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
        <h3>GET 방식</h3>

        사용자 ID : <asp:Label ID="lblUserID" runat="server"></asp:Label><br />
        사용자 이름 : <asp:Label ID="lblUserName" runat="server"></asp:Label><br />
        <br />
        <input type="button" value="이전" onclick="history.back()" />
    </div>
    </form>
</body>
</html>
