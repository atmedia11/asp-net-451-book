<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        CalendarDay d = e.Day;
        TableCell c = e.Cell;

        string message = GetSchedule(d.Date.Month, d.Date.Day);
        c.Controls.Add(new LiteralControl("<br />" + message));
    }

    string GetSchedule(int month, int day)
    {
        string schedule = "";

        if (month == 5 && day == 5)    // 5월 5일
        {
            schedule = "<a href='http://www.naver.com'>어린이날</a>";
        }
        else if (month == 5 && day == 8)  // 5월 8일
        {
            schedule = "어버이날";
        }
        else if (month == 5 && day == 15) // 5월 15일 
        {
            schedule = "스승의날";
        }
        else if (month == 6 && day == 6) // 6월 6일 
        {
            schedule = "현충일";
        }

        return schedule;
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
        <h3>DayRender이벤트를 사용한 예제</h3>
        
        <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" ShowGridLines="true" Width="500px" DayStyle-Height="30px" VisibleDate="2014-05-01"></asp:Calendar>
    </div>
    </form>
</body>
</html>
