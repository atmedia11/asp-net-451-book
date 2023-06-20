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
        p {
            border: 1px solid #000000;
            width: 60px; height: 60px;
        }
        
        .one {
            float: right;
        }
        
        .two {
            float: right;
        }
        
        .three {
            clear: right;
        }
    /* ]]> */
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p class="one">상자1</p>
        <p class="two">상자2</p>
        <p class="three">상자3</p>
    </div>
    </form>
</body>
</html>
