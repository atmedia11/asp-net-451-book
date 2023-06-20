<%@ Page Language="C#" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string userID = Request.QueryString["userID"];
            if (userID != null)
            {
                Response.Write(GetUserName(userID));
            }
        }
    }

    string GetUserName(string userID)
    {   
        Dictionary<string, string> userInfo = new Dictionary<string, string>();
        userInfo.Add("aaaa", "홍길동");
        userInfo.Add("bbbb", "김철수");
        userInfo.Add("cccc", "이영희");

        return userInfo[userID];
    }
</script>
