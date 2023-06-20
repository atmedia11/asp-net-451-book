<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string script1 = "function changeLabel2() {"
            + "document.getElementById('" + Label2.ClientID + "').innerHTML = '변경된 Label2';}";
        ClientScript.RegisterClientScriptBlock(this.GetType(), "changeLabel2Script", script1, true);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
    //<![CDATA[
        function changeLabel1() {
            document.getElementById("Label1").innerHTML = "변경된 Label1";
        }

        function changeLabel3() {
            document.getElementById('<%= Label3.ClientID %>').innerHTML = "변경된 Label3";
        }

        function changeLabel4() {
            document.getElementById("Label4").innerHTML = "변경된 Label4";
        }
    //]]>
    </script>
    <asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>
    <input type="button" value="button1" onclick="changeLabel1()" /><br />

    <asp:Label ID="Label2" runat="server" Text="Label2"></asp:Label>
    <input type="button" value="button2" onclick="changeLabel2()" /><br />

    <asp:Label ID="Label3" runat="server" Text="Label3"></asp:Label>
    <input type="button" value="button3" onclick="changeLabel3()" /><br />

    <asp:Label ID="Label4" runat="server" Text="Label4" ClientIDMode="Static"></asp:Label>
    <input type="button" value="button4" onclick="changeLabel4()" /><br />
</asp:Content>

