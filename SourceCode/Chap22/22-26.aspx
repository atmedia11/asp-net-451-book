<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindMemberList();
        }
    }

    void BindMemberList()
    {
        MyDBEntities context = new MyDBEntities();
        GridView1.DataSource = context.Members.ToList();
        GridView1.DataBind();
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {   
        Member member = new Member();
        member.UserID = txtUserID.Text;
        member.Password = txtPassword.Text;
        member.Name = txtName.Text;
        member.Phone = txtPhone.Text;

        MyDBEntities context = new MyDBEntities();
        context.Members.Add(member);
        
        context.SaveChanges();

        BindMemberList();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindMemberList();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Value.ToString();

        MyDBEntities context = new MyDBEntities();
        Member member = context.Members
            .Where(m => m.UserID == userID)
            .Single();
        
        member.Password = e.NewValues["Password"].ToString();
        member.Name = e.NewValues["Name"].ToString();
        member.Phone = e.NewValues["Phone"].ToString();

        context.SaveChanges();

        GridView1.EditIndex = -1;
        BindMemberList();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindMemberList();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string userID = GridView1.DataKeys[e.RowIndex].Value.ToString();

        MyDBEntities context = new MyDBEntities();
        Member member = context.Members
            .Where(m => m.UserID == userID)
            .Single();
        
        if (member.Carts.Count() == 0)
        {
            context.Members.Remove(member);
            
            context.SaveChanges();

            BindMemberList();
        }
        else
        {
            Response.Write("Cart에서 해당 Member를 참조하고 있으므로 삭제할 수 없습니다.");
        }
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
        UserID:<asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
        Password:<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox><br />
        Name:<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        Phone:<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <asp:Button ID="btnInsert" runat="server" Text="입력" OnClick="btnInsert_Click" /><br /><br />
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="UserID" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
