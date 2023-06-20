<%@ Control Language="C#" ClassName="CountAfterLoading" %>

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
    });
    //]]>
</script>

<script runat="server">

</script>

웹 페이지 로드 후 카운트 : <span id="spanCount">0</span>