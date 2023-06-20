<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        List<int> numbers = new List<int> { 1, 9, 2, 3, 7, 8, 0 };
        
        // 기존 코드
        List<int> matches1 = new List<int>();
        foreach (int num in numbers)
        {
            if (num % 2 == 0)
                matches1.Add(num);
        }
        ListBox1.DataSource = matches1;
        ListBox1.DataBind();

        // LINQ 쿼리 식을 사용한 코드
        var matches2 = from num in numbers
                       where num % 2 == 0
                       select num;
        ListBox2.DataSource = matches2;
        ListBox2.DataBind();

        // 표준 쿼리 연산자를 사용한 코드
        ListBox3.DataSource = numbers.Where(n => n % 2 == 0);
        ListBox3.DataBind();
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
        <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
        <asp:ListBox ID="ListBox2" runat="server"></asp:ListBox>
        <asp:ListBox ID="ListBox3" runat="server"></asp:ListBox>
    </div>
    </form>
</body>
</html>
