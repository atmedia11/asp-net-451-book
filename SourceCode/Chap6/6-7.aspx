<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            List<string> list = new List<string>();
            list.Add("Item1");
            list.Add("Item2");
            list.Add("Item3");
            DropDownList1.DataSource = list;
            DropDownList1.DataBind();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string s = "";
        s = "선택한 항목의 Index: " + DropDownList1.SelectedIndex + "<br />";
        s += "선택한 항목의 Text: " + DropDownList1.SelectedItem.Text + "<br />";
        s += "선택한 항목의 Value: " + DropDownList1.SelectedItem.Value;
        Label1.Text = s;
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
        <h3>DropDownList 컨트롤 예제</h3>
        
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>        
    </div>
    </form>
</body>
</html>
