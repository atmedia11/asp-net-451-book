<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    void SetCounter(string count)
    {
        hfCounter.Value = count;
        lblCounter.Text = count;
    }

    protected void btnPlus_Click(object sender, EventArgs e)
    {
        string count = (int.Parse(hfCounter.Value) + 1).ToString();
        SetCounter(count);
    }

    protected void btnMinus_Click(object sender, EventArgs e)
    {
        string count = (int.Parse(hfCounter.Value) - 1).ToString();
        SetCounter(count);
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
        <h3>숨겨진 필드를 이용한 카운터 예제</h3>

        <asp:Label ID="lblCounter" runat="server" Text="0"></asp:Label>
        <asp:HiddenField ID="hfCounter" runat="server" Value="0" />
        <asp:Button ID="btnPlus" runat="server" Text=" + " onclick="btnPlus_Click" />
        <asp:Button ID="btnMinus" runat="server" Text=" - " onclick="btnMinus_Click" />    
    </div>
    </form>
</body>
</html>
