<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void BulletedList3_Click(object sender, BulletedListEventArgs e)
    {
        Response.Write("선택한 항목의 인덱스 : " + e.Index.ToString()
            + "<br />선택한 항목의 Value : " + BulletedList3.Items[e.Index].Value
            + "<br />선택한 항목의 Text : " + BulletedList3.Items[e.Index].Text);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center;">
        <div style="float: left; padding-right: 20px;">
            <h3>Disc</h3>
            <asp:BulletedList ID="BulletedList1" runat="server">
                <asp:ListItem>Item1</asp:ListItem>
                <asp:ListItem>Item2</asp:ListItem>
                <asp:ListItem>Item3</asp:ListItem>
                <asp:ListItem>Item4</asp:ListItem>
            </asp:BulletedList>
        </div>
        <div style="float: left; padding-right: 20px;">
            <h3>Circle</h3>
            <asp:BulletedList ID="BulletedList2" BulletStyle="Circle" DisplayMode="HyperLink" runat="server">
                <asp:ListItem Value="http://www.naver.com">Item1</asp:ListItem>
                <asp:ListItem Value="http://www.nate.com">Item2</asp:ListItem>
                <asp:ListItem Value="http://www.daum.net">Item3</asp:ListItem>
                <asp:ListItem Value="http://www.google.com">Item4</asp:ListItem>
            </asp:BulletedList>
        </div>
        <div style="float: left; padding-right: 20px;">
            <h3>Square</h3>
            <asp:BulletedList ID="BulletedList3" BulletStyle="Square" DisplayMode="LinkButton" runat="server" OnClick="BulletedList3_Click">
                <asp:ListItem Value="Item1 Value">Item1</asp:ListItem>
                <asp:ListItem>Item2</asp:ListItem>
                <asp:ListItem>Item3</asp:ListItem>
                <asp:ListItem>Item4</asp:ListItem>
            </asp:BulletedList>
        </div>
        <div style="float: left; padding-right: 20px;">
            <h3>Numbered</h3>
            <asp:BulletedList ID="BulletedList4" BulletStyle="Numbered" FirstBulletNumber="3" runat="server">
                <asp:ListItem>Item1</asp:ListItem>
                <asp:ListItem>Item2</asp:ListItem>
                <asp:ListItem>Item3</asp:ListItem>
                <asp:ListItem>Item4</asp:ListItem>
            </asp:BulletedList>
        </div>
    </div>
    </form>
</body>
</html>
