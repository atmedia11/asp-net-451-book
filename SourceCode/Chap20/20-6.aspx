<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    void DisplayCounter()
    {
        lblCounter.Text = Session["Counter"].ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Counter"] == null)
        {
            Session["Counter"] = 0;
        }

        DisplayCounter();
        lblTotalCount.Text = Application["TotalCount"].ToString();
        lblCurrCount.Text = Application["CurrCount"].ToString();
    }

    protected void btnPlus_Click(object sender, EventArgs e)
    {
        Session["Counter"] = (int)Session["Counter"] + 1;
        DisplayCounter();
    }

    protected void btnMinus_Click(object sender, EventArgs e)
    {
        Session["Counter"] = (int)Session["Counter"] - 1;
        DisplayCounter();
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
        <asp:Label ID="lblCounter" runat="server" Text="0" TabIndex="0"></asp:Label>
        <asp:Button ID="btnPlus" runat="server" Text=" + " OnClick="btnPlus_Click" />
        <asp:Button ID="btnMinus" runat="server" Text=" - " OnClick="btnMinus_Click" /><br /><br />

        총 접속자 : <asp:Label ID="lblTotalCount" runat="server"></asp:Label>명<br />
        현재 접속자 : <asp:Label ID="lblCurrCount" runat="server"></asp:Label>명    
    </div>
    </form>
</body>
</html>
