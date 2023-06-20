<%@ Page Language="C#" %>
<%@ Register src="WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToLongTimeString();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>컨트롤 캐싱 예제</h3>
            
        페이지가 캐싱된 시간(사용자 정의 컨트롤) : 
        <uc1:WebUserControl ID="WebUserControl1" runat="server" /><br />
        페이지가 요청된 시간 : 
        <asp:Label ID="Label1" runat="server"></asp:Label>    
    </div>
    </form>
</body>
</html>
