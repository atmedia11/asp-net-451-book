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
        body 
        {
            background-color: #cccccc; 
            color: #000000;
            font-size: 22px;
            font-weight: bold;
        }
        
        p 
        {
            height: 120px;
            border: 1px solid #000000;
            background-image: url("Images/background.gif");
        }
        
        .second 
        {   
            background-repeat: repeat-x;
        }
        
        .third 
        {   
            background-repeat: no-repeat;
            background-position: center;
        }
    /* ]]> */
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>첫 번째 <br /> 문장입니다.</p>
        <p class="second">두 번째 <br /> 문장입니다.</p>
        <p class="third">세 번째 <br /> 문장입니다.</p>    
    </div>
    </form>
</body>
</html>
