<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        int rowCount = int.Parse(DropDownList1.SelectedItem.Value);
        int cellCount = int.Parse(DropDownList2.SelectedItem.Value);

        for (int i = 0; i < rowCount; i++)
        {
            TableRow row = new TableRow();
            for (int k = 0; k < cellCount; k++)
            {
                TableCell cell = new TableCell();
                cell.Controls.Add(new LiteralControl("행 " + i.ToString() + ", 셀 " + k.ToString()));
                row.Cells.Add(cell);
            }
            Table1.Rows.Add(row);
        }
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
        <h3>Table 컨트롤 예제</h3>
        
        <asp:Table ID="Table1" runat="server" CellPadding="5" CellSpacing="0" GridLines="both" BorderWidth="1">
        </asp:Table>
        <br />
        행의 수 : 
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="1">1 행</asp:ListItem>
            <asp:ListItem Value="2">2 행</asp:ListItem>
            <asp:ListItem Value="3">3 행</asp:ListItem>
            <asp:ListItem Value="4">4 행</asp:ListItem>
        </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        셀의 수:
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem Value="1">1 셀</asp:ListItem>
            <asp:ListItem Value="2">2 셀</asp:ListItem>
            <asp:ListItem Value="3">3 셀</asp:ListItem>
            <asp:ListItem Value="4">4 셀</asp:ListItem>
        </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="테이블 생성" OnClick="Button1_Click" />    
    </div>
    </form>
</body>
</html>
