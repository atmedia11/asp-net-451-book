<%@ Page Language="C#" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string userID = Request.QueryString["userID"];
            if (userID != null)
            {
                string json = GetUserName(userID);
                Response.Write(json);
            }
        }
    }

    string GetUserName(string userID)
    {   
        Dictionary<string, string> userInfo = new Dictionary<string, string>();
        userInfo.Add("aaaa", "{ \"userName\": \"홍길동\", \"age\": 20 }");
        userInfo.Add("bbbb", "{ \"userName\": \"김철수\", \"age\": 30 }");
        userInfo.Add("cccc", "{ \"userName\": \"이영희\", \"age\": 40 }");

        // JSON에서는 property:value 쌍에서 속성(property)을 큰따옴표("")로 감싸야 하는데
        // 아래의 구문은 속성을 큰따옴표("")로 감싸지 않았으므로 유효한 JSON이 아니다.
        // 그러므로 아래와 같이 작성을 하면 응답을 받는 18-45-1.html 페이지 측에서 오류가 발생한다.
        // 테스트해보자.
        //userInfo.Add("aaaa", "{ userName: \"홍길동\", age: 20 }");
        //userInfo.Add("bbbb", "{ userName: \"김철수\", age: 30 }");
        //userInfo.Add("cccc", "{ userName: \"이영희\", age: 40 }");

        return userInfo[userID];
    }
</script>
