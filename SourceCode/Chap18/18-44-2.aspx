<%@ Page Language="C#" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string userID = Request.Form["userID"];
        string userName = Request.Form["userName"];
        string creditCard = Request.Form["creditCard"];

        Response.Write("전송된 데이터 : " + userID + ", " + userName + ", " + creditCard);
    }
</script>
