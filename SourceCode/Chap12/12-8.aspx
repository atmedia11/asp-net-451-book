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
        .box
        {
            border: 1px solid #000000; margin-bottom: 5px;
            width: 300px; background-color: #ffffff;
        }
        
        .first {background-color: #cccccc;}
        .second {position: relative; top: -20px; left: 30px;}
        .third {position: absolute; top: 20px; left: 80px;}
    /* ]]> */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box first">첫 번째 상자 <br /> 입니다.</div>
        <div class="box second">두 번째 상자 <br /> 입니다.</div>
        <div class="box third">세 번째 상자 <br /> 입니다.</div>
    </form>
</body>
</html>
