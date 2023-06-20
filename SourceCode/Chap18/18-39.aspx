<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        lblCurrentTime.Text = DateTime.Now.ToLongTimeString();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
    /* <![CDATA[ */
        span { font-weight: bold; }
    /* //]]> */
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>
    <script>
    //<![CDATA[
        var count = 0;
        function setCount() {
            window.setInterval(function () { increaseCount(); }, 1000);
        }

        function increaseCount() {
            count++;
            $("#spanCount").html(count);
        }

        $(document).ready(function () {
            setCount();

            $("#btnGetCurrentTime").click(function () {
                $("#lblCurrentTime").load("GetCurrentTime.aspx");
            });
        });
    //]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>load() 메서드를 사용한 예제</h3>

        웹 페이지 로드 후 카운트 : <span id="spanCount">0</span>
        <br />
        웹 서버의 현재 시간 : <asp:Label ID="lblCurrentTime" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="현재 시간 가져오기 (웹 페이지 전체를 다시 로드)" />
        <br />
        <input type="button" id="btnGetCurrentTime" value="현재 시간 가져오기 (Ajax를 사용하여 '웹 서버의 현재 시간' 부분만 업데이트)" />
    </div>
    </form>
</body>
</html>
