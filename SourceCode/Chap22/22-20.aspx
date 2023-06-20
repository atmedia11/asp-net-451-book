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

        List<StudentDetail> details = new List<StudentDetail> 
        {
            new StudentDetail {Name = "홍길동", Age = 25},
            new StudentDetail {Name = "아무개", Age = 32}
        };

        var innerJoinQuery =
            from student in students
            join detail in details on student.Name equals detail.Name
            select new { Name = student.Name, Score = student.Score, Age = detail.Age };

        foreach (var student in innerJoinQuery)
        {
            Response.Write(String.Format("{0}, {1}, {2}<br />",
                student.Name,
                student.Score,
                student.Age)
            );
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
