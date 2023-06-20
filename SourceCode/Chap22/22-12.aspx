<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // 개체 이니셜라이저 사용.
        Student myStudent = new Student { Name = "홍길동", Score = 2 };
        Response.Write(myStudent.Name + " " + myStudent.Score + "<br />");

        // 컬렉션 이니셜라이저 사용.
        List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
        foreach (int i in numbers) { Response.Write(i + "<br />"); }

        // 개체 이니셜라이저와 컬렉션 이니셜라이저를 함께 사용.
        List<Student> students = new List<Student> 
        { 
            new Student { Name = "홍길동", Score = 2 },
            new Student { Name = "김철수", Score = 3 },
            new Student { Name = "이영희", Score = 1 },
            new Student { Name = "바둑이", Score = 2 }
        };
        foreach (Student student in students)
        {
            Response.Write(student.Name + " " + student.Score + "<br />");
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
    
    </div>
    </form>
</body>
</html>
