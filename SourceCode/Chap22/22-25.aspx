<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        MyDBEntities context = new MyDBEntities();

        StringBuilder sb = new StringBuilder();
        foreach (Member member in context.Members.Include("Carts"))
        {
            if (member.Carts.Count() > 0)
            {
                sb.Append("<b>");
                sb.Append(member.Name);
                sb.Append("</b><br />");

                foreach (Cart cart in member.Carts)
                {
                    sb.Append(cart.ItemName);
                    sb.Append(" ");
                    sb.Append(cart.Qty);
                    sb.Append("<br />");
                }
                sb.Append("<hr />");
            }
        }

        Label1.Text = sb.ToString();
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
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
