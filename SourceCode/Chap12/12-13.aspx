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
        body {
            font-family: 굴림, verdana, sans-serif;
            font-size: 16px;
            font-weight: bold;
        }

        #container {
            margin: 0px auto;
            min-width: 780px;
	        max-width: 1260px;
            border: 1px solid gray;
            line-height: 150%;
        }

        #header {
            padding: 10px;
            background-color: Silver;
        }        

        #left {
            float: left;
            width: 160px;
            margin: 0px;
            padding: 10px;
        }

        #breadcrumbs {
            margin-left: 190px;
            border-left: 1px solid gray;            
            background-color: Menu;
            padding: 10px;
            text-align: right;
        }

        #content {
            margin-left: 190px;
            border-left: 1px solid gray;
            padding: 10px;
            min-height: 180px;
        }

        #footer {
            padding: 10px;
            background-color: Silver;
            clear: left;
            text-align: center;
        }        
    /* ]]> */
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="header">
            Header
        </div>
        <div id="left">
            Left
        </div>
        <div id="breadcrumbs">
            Home > Breadcrumbs
        </div>
        <div id="content">
            Contents
        </div>
        <div id="footer">
            Footer
        </div>
    </div>
    </form>
</body>
</html>
