<%@ Page Language="C#" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AddHeader("Cache-Control", "no-cache,no-store"); // 응답이 웹 브라우저에서 캐시되는 것을 막는다.
        Response.Write(DateTime.Now.ToLongTimeString() + " from GetCurrentTime.aspx");

        //int i = 10 / 0; // 의도적으로 오류를 발생 시키는 구문.
    }
</script>
