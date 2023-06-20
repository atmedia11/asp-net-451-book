<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<script runat="server">

    string path = @"C:\temp\MyFile\9-4.dat";

    protected void btnWrite_Click(object sender, EventArgs e)
    {
        Stream outStream = new FileStream(path, FileMode.Create);
        StreamWriter sw = new StreamWriter(outStream);
        sw.WriteLine(100);
        sw.WriteLine("안녕?");
        sw.WriteLine(3.14);
        sw.Close();

        Label1.Text = path + " 파일에 데이터를 썼습니다.";
    }

    protected void btnRead_Click(object sender, EventArgs e)
    {
        if (File.Exists(path))
        {
            Stream inStream = new FileStream(path, FileMode.Open);
            StreamReader sr = new StreamReader(inStream);

            Label1.Text = "";
            while (!sr.EndOfStream)
            {
                Label1.Text += sr.ReadLine() + "<br />";
            }
            sr.Close();
        }
        else
        {
            Label1.Text = path + " 파일이 존재하지 않습니다.";
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
        <asp:Button ID="btnWrite" runat="server" Text="텍스트 파일 쓰기" OnClick="btnWrite_Click" />
        <asp:Button ID="btnRead" runat="server" Text="텍스트 파일 읽기" OnClick="btnRead_Click" /><br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
