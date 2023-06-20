<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        DetailsView1.DataBind();
    }

    protected void ObjectDataSource2_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["userID"] = DropDownList1.SelectedValue;
    }

    protected void ObjectDataSource2_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        Response.Write(DropDownList1.SelectedValue + " 정보 조회가 완료되었습니다.");
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
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="UserID" DataValueField="UserID">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="Member" SelectMethod="SelectMember"></asp:ObjectDataSource>
        <asp:Button ID="Button1" runat="server" Text="확인" OnClick="Button1_Click" />
        <br /><br />
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="ObjectDataSource2">
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" TypeName="Member" SelectMethod="SelectMemberByUserID" OnSelecting="ObjectDataSource2_Selecting" OnSelected="ObjectDataSource2_Selected">
            <SelectParameters>
                <asp:Parameter Name="userID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>    
    </div>
    </form>
</body>
</html>
