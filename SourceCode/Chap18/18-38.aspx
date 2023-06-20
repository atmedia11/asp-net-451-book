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
    <script>
    //<![CDATA[
        // Ajax와 관련된 함수는 loadCurrentTime() 함수이며,
        // setCount(), increaseCount() 함수는 Ajax와는 직접적으로 관련이 없지만
        // 웹 페이지가 전체적으로 다시 로드되는지 아니면 특정 부분만 업데이트되는지를
        // 알아보기 위해 추가한 함수이다.

        var count = 0;
        function setCount() {
            window.setInterval(function () { increaseCount(); }, 1000); // 1초마다 increaseCount() 메서드를 호출한다.
        }

        function increaseCount() {
            count++;
            document.getElementById("spanCount").innerHTML = count;
        }

        function loadCurrentTime() {
            var xmlhttp;
            if (window.XMLHttpRequest) {// IE7+, Firefox, Chrome, Opera, Safari를 위한 코드.
                xmlhttp = new XMLHttpRequest(); // Ajax의 핵심은 바로 XMLHttpRequest 객체인데 이 객체는 웹 서버와 비동기적으로 데이터 통신을 가능하게 해준다. XMLHttpRequest 객체는 대부분의 주요 웹 브라우저에서 제공하지만 IE5, IE6에서는 XMLHttpRequest 객체를 제공하지 않으므로 대신 아래와 같이 ActiveXObject 객체를 사용해야 한다.
            }
            else {// IE5, IE6을 위한 코드.
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); // IE5, IE6에서는 XMLHttpRequest 객체를 제공하지 않으므로 대신 ActiveXObject 객체를 사용해야 한다.
            }
            xmlhttp.onreadystatechange = function () { // onreadystatechange 이벤트 속성은 readyState 속성이 변경될 때 발생하는 readystatechange 이벤트를 처리하는 역할을 한다.
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) { // readyState 속성은 0부터 4까지의 정수 값을 가질 수 있는데(0=unsent, 1=opened, 2=headers_received, 3=loading, 4=done) 4는 요청이 끝나고 응답 준비가 완료된 상태를 의미한다. 그리고 status 속성의 값이 200이면 서버가 요청을 성공적으로 처리했음을 뜻한다. 참고로 status 속성의 값이 404라면 페이지를 찾을 수 없음을 뜻한다. 그러므로 if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 구문은 요청이 성공적으로 처리되었고 이에 대한 응답 준비가 완료되었는지를 체크하는 구문이다.
                    document.getElementById("lblCurrentTime").innerHTML = xmlhttp.responseText; // 서버로부터 전달받은 응답은 XMLHttpRequest 객체의 responseText 속성을 통해 참조할 수 있다. 만약에 응답이 XML 데이터라면 responseXML 속성을 통해 해당 응답을 참조하면 된다.
                }
            }
            xmlhttp.open("GET", "GetCurrentTime.aspx", true); // open(method, url, async), open() 메서드는 HTTP 요청 방식, 요청이 보내질 URL 및 비동기 여부를 지정하는 메서드이다. 참고로 HTTP 요청 방식에는 GET 방식과 POST 방식이 있는데 이 두 방식은 jQuery의 $.get(), $.post() 메서드를 다룰 때 다시 책에서 설명을 할 것이다.
            xmlhttp.send(); // send() 메서드는 위의 open() 메서드에서 지정한 URL(여기서는 GetCurrentTime.aspx 페이지)로 요청을 보내는 메서드이다.
        }
    //]]>
    </script>
</head>
<body onload="setCount()">
    <form id="form1" runat="server">
    <div>
        <h3>XMLHttpRequest 객체를 사용한 예제</h3>

        웹 페이지 로드 후 카운트 : <span id="spanCount">0</span>
        <br />
        웹 서버의 현재 시간 : <asp:Label ID="lblCurrentTime" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="현재 시간 가져오기 (웹 페이지 전체를 다시 로드)" />
        <br />
        <input type="button" id="btnGetCurrentTime" value="현재 시간 가져오기 (Ajax를 사용하여 '웹 서버의 현재 시간' 부분만 업데이트)" onclick="loadCurrentTime()" />
    </div>
    </form>
</body>
</html>
