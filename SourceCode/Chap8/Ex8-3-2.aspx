<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void ObjectDataSource2_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        ListView1.DataBind();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="float: left;">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="UserID" DataSourceID="ObjectDataSource1">
            <LayoutTemplate>
                <table border="1">
                    <tr>
                        <td>명령</td>
                        <td>아이디</td>
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="btnSelect" runat="server" Text="선택" CommandName="Select" />
                    </td>
                    <td>
                        <%# Eval("UserID") %>
                    </td>
                </tr>
            </ItemTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: Silver;">
                    <td>
                        <asp:Button ID="btnSelect" runat="server" Text="선택" CommandName="Select" />
                    </td>
                    <td>
                        <%# Eval("UserID") %>
                    </td>                    
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectMember" TypeName="Member"></asp:ObjectDataSource>
    </div>
    <div style="float: left; padding-left: 10px;">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="ObjectDataSource2">
            <ItemTemplate>
                <table border="1">
                    <tr>
                        <td style="background-color: Silver; width: 60px;">아이디</td>
                        <td style="width: 120px;"><%# Eval("UserID") %></td>
                        <td style="background-color: Silver; width: 60px;">암호</td>
                        <td style="width: 120px;"><%# Eval("Password") %></td>
                    </tr>
                    <tr>
                        <td style="background-color: Silver;">이름</td>
                        <td><%# Eval("Name") %></td>
                        <td style="background-color: Silver;">연락처</td>
                        <td><%# Eval("Phone") %></td>
                    </tr>
                </table>
                <p>
                    <asp:Button ID="btnEdit" runat="server" Text="편집" CommandName="Edit" />
                    <asp:Button ID="btnDelete" runat="server" Text="삭제" CommandName="Delete" OnClientClick="return confirm('삭제 하시겠습니까?');" />
                </p>
            </ItemTemplate>
            <EditItemTemplate>
                <table border="1">
                    <tr>
                        <td style="background-color: Silver; width: 60px;">아이디</td>
                        <td style="width: 120px;"><%# Eval("UserID") %></td>
                        <td style="background-color: Silver; width: 60px;">암호</td>
                        <td style="width: 120px;"><asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="background-color: Silver;">이름</td>
                        <td><asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox></td>
                        <td style="background-color: Silver;">연락처</td>
                        <td><asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox></td>
                    </tr>
                </table>
                <p>
                    <asp:Button ID="btnUpdate" runat="server" Text="업데이트" CommandName="Update" />
                    <asp:Button ID="btnCancel" runat="server" Text="취소" CommandName="Cancel" />
                </p>
            </EditItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            DeleteMethod="DeleteMember" SelectMethod="SelectMemberByUserID" 
            TypeName="Member" UpdateMethod="UpdateMember" 
            OnDeleted="ObjectDataSource2_Deleted">
            <DeleteParameters>
                <asp:Parameter Name="userID" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ListView1" Name="userID" 
                    PropertyName="SelectedValue" Type="String" DefaultValue=" " />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
