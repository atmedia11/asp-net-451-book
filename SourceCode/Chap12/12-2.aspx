<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>    
    <style>
        body 
        {
            background-color: white;
            color: black;
        }
        
        .note {background-color: #cccccc;}
        
        #header
        {
            height: 30px; 
            background-color: #99ccff;
        }

        div>b {font-style: italic;}
        
        div b {text-decoration: underline;}
        
        a:link {color: purple; text-decoration: none;}
        a:visited {color: blue; text-decoration: none;}
        a:hover {color: green; text-decoration: underline;}
        a:active {color: red; text-decoration: underline;}
        
        .para:first-letter {color: red; font-size: xx-large;}
    </style>
    <%--<link rel="stylesheet" type="text/css" href="StyleSheet.css"/>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="header">첫 번째 문장입니다.</div>
        <div class="note">두 번째 문장입니다.</div>
        <p class="note">세 번째 문장입니다.</p>
        <div>
            <b>네 번째</b> 문장입니다.
            <p>
                <b>다섯 번째</b> 문장입니다.
            </p>
        </div>
        <a href="http://www.naver.com/">네이버</a>
        <p class="para">Hello world!</p>    
    </div>
    </form>
</body>
</html>
