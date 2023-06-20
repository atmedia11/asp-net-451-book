<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string itemID = "10001", itemName = "볶음용 멸치"; // DB에서 가져온 정보라고 가정한다.
        string script1 = "function displayItem() {"
            + "alert('물품 ID: " + itemID + ", 물품명: " + itemName + "');}";

        ClientScript.RegisterClientScriptBlock(this.GetType(), "displayItemScript", script1, true);
        Button2.Attributes.Add("onclick", "displayItem()");

        string script2 = "document.getElementById('Label1').innerHTML = 'Hello world!';";
        ClientScript.RegisterStartupScript(this.GetType(), "changeLabelScript", script2, true);
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
        <asp:Button ID="Button1" runat="server" Text="Button1" OnClientClick="displayItem()" />
        <asp:Button ID="Button2" runat="server" Text="Button2" /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
