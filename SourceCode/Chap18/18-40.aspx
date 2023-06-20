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
                $("#lblCurrentTime").load(
                    "GetCurrentTime.aspx",
                    function (responseText, textStatus, xhr) {
                        // responseText : 서버로부터 받아온 데이터(응답).
                        // textStatus : 응답에 대한 상태 값.
                        // xhr : XMLHttpRequest 객체.
                        if (textStatus == "success")
                            alert("현재 시간을 성공적으로 로드했습니다.");
                        if (textStatus == "error") // GetCurrentTime.aspx 페이지의 Page_Load() 이벤트 처리기에서 int i = 10 / 0; 구문과 같이 오류를 발생시키는 구문을 작성하고 저장한 뒤 btnGetCurrentTime 버튼을 클릭하여 load() 메서드를 다시 호출하면 오류가 발생하는데 이때 xhr(XMLHttpRequest 객체)의 status, statusText 등의 속성을 통해 오류와 관련된 정보를 참조할 수 있다.
                            alert("오류 : " + xhr.status + " " + xhr.statusText);
                    }
                );
            });
        });
    //]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>load(URL, callback) 메서드를 사용한 예제</h3>

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
