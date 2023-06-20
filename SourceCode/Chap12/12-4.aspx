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
        .first 
        {
            color: #ff0000;
        }
        
        .second 
        {
            color: Green;
            text-align: right;
            text-decoration: underline;
            word-spacing: 50px;
        }
        
        .third 
        {
            text-indent: 15px;
            text-transform: uppercase;
            letter-spacing: 10px;
            white-space: nowrap;
        }
    /* ]]> */
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p class="first">First 문장입니다.</p>
        <p class="second">Second 문장입니다.</p>
        <p class="third">Third 문장입니다.</p>    
    </div>
    </form>
</body>
</html>
