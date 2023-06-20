<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        List<int> numbers = new List<int> { 1, 9, 2, 3, 7, 8, 0 };

        int first = numbers.First(); // 첫 번째 요소 반환.
        int last = numbers.Last(); // 마지막 요소 반환.
        int min = numbers.Min(); // 최소값 반환.
        int max = numbers.Max(); // 최대값 반환.
        int sum = numbers.Sum(); // 요소들의 합계 반환.
        int count = numbers.Count(); // 요소들의 수 반환.
        double avg = numbers.Average(); // 요소들의 평균값 반환.
        bool contains = numbers.Contains(5); // 요소 포함 여부 반환.
        string s = String.Format("first = {0}, last = {1}, min = {2}, max = {3}, sum = {4}, count = {5}, avg = {6}, contains = {7} <br />", first, last, min, max, sum, count, avg, contains);
        Response.Write(s);

        int[] array = numbers.ToArray();
        Response.Write(array[1] + "<br />"); // 배열의 두 번째 요소인 9 반환.

        List<int> list = numbers.ToList();
        Response.Write(list[1]); // 컬렉션의 두 번째 요소인 9 반환.
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
