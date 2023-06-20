<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Response.Write("선택한 날짜: " + Calendar1.SelectedDate.ToShortDateString());
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
        <h3>SelectionChanged 이벤트를 사용한 예제</h3>
       
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" SelectionMode="Day"></asp:Calendar>
    </div>
    </form>
</body>
</html>
