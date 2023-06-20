<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string count = Request.QueryString["Counter"];
            if (!string.IsNullOrWhiteSpace(count))
            {
                lblCounter.Text = count;
            }
        }
    }

    protected void btnPlus_Click(object sender, EventArgs e)
    {
        int count = int.Parse(lblCounter.Text) + 1;
        Response.Redirect(Request.Path + "?Counter=" + count.ToString());
    }

    protected void btnMinus_Click(object sender, EventArgs e)
    {
        int count = int.Parse(lblCounter.Text) - 1;
        Response.Redirect(Request.Path + "?Counter=" + count.ToString());
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
        <h3>쿼리 문자열을 이용한 카운터 예제</h3>

        <asp:Label ID="lblCounter" runat="server" Text="0"></asp:Label>
        <asp:Button ID="btnPlus" runat="server" Text=" + " onclick="btnPlus_Click" />
        <asp:Button ID="btnMinus" runat="server" Text=" - " onclick="btnMinus_Click" />    
    </div>
    </form>
</body>
</html>
