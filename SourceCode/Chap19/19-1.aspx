<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToLongTimeString();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>
    <script type="text/javascript">
    //<![CDATA[
        var count = 0;
        function setCount() {
            window.setInterval(function () { increaseCount(); }, 1000);
        }

        function increaseCount() {
            count++;
            $("#spanCount").html(count);
        }

        $(document).ready(function () {
            setCount();
        });
    //]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        웹 페이지 로드 후 카운트 : <span id="spanCount">0</span><br /><br />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <fieldset>
                    <legend>UpdatePanel</legend>
                    웹 서버의 현재 시간 : <asp:Label ID="lblTime" runat="server"></asp:Label><br />
                    <asp:Button ID="btnInner" runat="server" Text="내부 버튼" />
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel><br />
        <asp:Button ID="btnOuter" runat="server" Text="외부 버튼 (웹 페이지 전체를 다시 로드)" />
    </div>
    </form>
</body>
</html>
