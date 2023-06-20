<%@ Control Language="C#" ClassName="WebUserControl" %>
<%@ OutputCache Duration="10" VaryByParam="none" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToLongTimeString();
    }
</script>

<asp:Label ID="Label1" runat="server"></asp:Label>