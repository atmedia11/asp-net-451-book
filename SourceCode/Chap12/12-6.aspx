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
            background-color: #ffffff; 
            color: #000000;
        }
        
        .layout 
        {
            border-width: 3px;
            border-style: dashed;
            border-color: #000000;
        }
        
        .first 
        {
            border: 1px solid #000000;
        }
        
        .second 
        {   
            border: 1px solid #000000;
            margin: 10px 10px 10px 10px;
            padding: 10px 10px 10px 10px;
        }
        
        .third 
        {   
            border-top-width: 5px;
            border-top-style: ridge;
                        
            border-right-width: 3px;
            border-right-style: dotted;
            
            border-bottom-width: 6px;
            border-bottom-style: double;
            
            border-left: 1px solid #000000;
            
            margin: 10px 10px 10px 10px;
            padding: 10px 10px 10px 10px;
                       
            width: 450px;
            line-height: 40px;
        }
        
        .focus
        {
            font-weight: bold;
            background-color: #cccccc;
            border: 1px solid #000000;
            padding: 3px 3px 3px 3px;
        }
    /* ]]> */
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="layout">

        <div class="first">
            CSS의 상자 모델(box model)은 모든 요소를 하나의 사각형 영역으로 간주하여 공간을 조정하는 개념이다.
        </div>

        <div class="second">
            만약 "이것은 상자 안에 포함되어 있는 콘텐츠입니다."라는 콘텐츠가 &lt;p&gt; 요소 안에 포함되어 있다면 &lt;p&gt; 요소의 테두리(border)와 콘텐츠 사이의 공간이 공백(padding)이 되고 테두리 바깥쪽 공간이 여백(margin)이 된다.
        </div>

        <div class="third">
            사실 테두리는 4개의 면 즉, <span class="focus">상단(top)</span>, <span class="focus">우측(right)</span>, <span class="focus">하단(bottom)</span>, <span class="focus">좌측(left)</span> 면으로 구성되는데 각 면의 width, style, color를 따로 지정하는 세부 속성도 함께 제공되므로 참고하자.
        </div>

    </div>
    </form>
</body>
</html>
