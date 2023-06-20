<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
    /* <![CDATA[ */
        .fixed 
        {
            border: 1px solid #000000;
            padding: 5px;
            width: 200px;
            position: fixed;
            top: 50px;
            left: 30px;
            background-color: #ffffff;
        }
        
        .mark
        {
            font-weight: bold;
            font-size: 20px;
        }
    /* ]]> */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="fixed">
            fixed가 <br /> 적용된 상자.
        </div>
        <p class="mark">스크롤 시작!</p>
        <p>스크롤을 내려 보삼.</p>
        <p>스크롤을 내려 보삼.</p>
        <p>스크롤을 내려 보삼.</p>
        <p>스크롤을 내려 보삼.</p>
        <p>스크롤을 내려 보삼.</p>
        <p>스크롤을 내려 보삼.</p>
        <p>스크롤을 내려 보삼.</p>
        <p>스크롤을 내려 보삼.</p>
        <p>스크롤을 내려 보삼.</p>
        <p class="mark">스크롤 끝!</p>
    </form>
</body>
</html>
