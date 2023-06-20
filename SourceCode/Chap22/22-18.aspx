<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        List<Student> students = new List<Student> 
        { 
            new Student { Name = "홍길동", Score = 2},
            new Student { Name = "김철수", Score = 3},
            new Student { Name = "이영희", Score = 2},
            new Student { Name = "바둑이", Score = 1},
            new Student { Name = "아무개", Score = 3},
        };

        var queryStudentsByScore =
            from student in students
            group student by student.Score;

        foreach (var studentGroup in queryStudentsByScore)
        {
            Response.Write(studentGroup.Key + " : ");
            foreach (Student student in studentGroup)
            {
                Response.Write(student.Name + " ");
            }
            Response.Write("<hr />");
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
