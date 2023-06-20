<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindList();
            BindDetail();
        }
    }

    void BindList()
    {
        Member member = new Member();
        ListView1.DataSource = member.SelectMember();
        ListView1.DataBind();
    }

    void BindDetail()
    {
        string userID = "";
        if (ListView1.SelectedValue != null)
        {
            userID = ListView1.SelectedValue.ToString();
        }

        Member member = new Member();
        FormView1.DataSource = member.SelectMemberByUserID(userID);
        FormView1.DataBind();
    }

    protected void ListView1_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        ListView1.SelectedIndex = e.NewSelectedIndex;
        FormView1.ChangeMode(FormViewMode.ReadOnly);
        BindList();
        BindDetail();
    }

    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (e.NewMode == FormViewMode.Edit)
        {
            FormView1.ChangeMode(FormViewMode.Edit);
        }
        else if (e.CancelingEdit)
        {
            FormView1.ChangeMode(FormViewMode.ReadOnly);
        }

        BindDetail();
    }

    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        string userID = ListView1.SelectedValue.ToString();
        string password = e.NewValues["Password"].ToString();
        string name = e.NewValues["Name"].ToString();
        string phone = e.NewValues["Phone"].ToString();

        Member member = new Member();
        member.UpdateMember(userID, password, name, phone);

        FormView1.ChangeMode(FormViewMode.ReadOnly);
        BindDetail();
    }

    protected void FormView1_ItemDeleting(object sender, FormViewDeleteEventArgs e)
    {
        string userID = ListView1.SelectedValue.ToString();

        Member member = new Member();
        member.DeleteMember(userID);

        BindList();
        BindDetail();
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
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="UserID" OnSelectedIndexChanging="ListView1_SelectedIndexChanging">
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
    </div>
    <div style="float: left; padding-left: 10px;">
        <asp:FormView ID="FormView1" runat="server" 
            OnModeChanging="FormView1_ModeChanging" 
            OnItemUpdating="FormView1_ItemUpdating" 
            OnItemDeleting="FormView1_ItemDeleting">
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
                    <asp:Button ID="btnDelete" runat="server" Text="삭제" CommandName="Delete" OnClientClick="return confirm('삭제 하시겠습니까?');" /> <%-- OnClientClick 속성에서 사용한 구문은 확인(confirm) 창을 띄우는 JavaScript 구문이다. JavaScript는 17장에서 공부할 것이므로 지금은 그냥 이러한 구문이 있구나하고 참고만 하고 넘어가도록 하자.--%>
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
    </div>    
    </form>
</body>
</html>
