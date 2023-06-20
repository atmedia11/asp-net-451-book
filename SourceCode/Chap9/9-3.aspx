<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<script runat="server">

    string path = @"C:\temp\MyFile\9-3.dat";

    protected void btnWrite_Click(object sender, EventArgs e)
    {
        string dirPath = Path.GetDirectoryName(path); // C:\temp\MyFile 반환.
        if (!Directory.Exists(dirPath))
            Directory.CreateDirectory(dirPath);
        
        Stream outStream = new FileStream(path, FileMode.Create);
        BinaryWriter bw = new BinaryWriter(outStream);
        bw.Write(100);
        bw.Write("안녕?");
        bw.Write(3.14);
        bw.Close();

        Label1.Text = path + " 파일에 데이터를 썼습니다.";
    }

    protected void btnRead_Click(object sender, EventArgs e)
    {
        if (File.Exists(path))
        {
            Stream inStream = new FileStream(path, FileMode.Open);
            BinaryReader br = new BinaryReader(inStream);
            int val1 = br.ReadInt32();
            string val2 = br.ReadString();
            double val3 = br.ReadDouble();
            br.Close();

            Label1.Text = val1 + "<br />" + val2 + "<br />" + val3;
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
        <asp:Button ID="btnWrite" runat="server" Text="이진 파일 쓰기" OnClick="btnWrite_Click" />
        <asp:Button ID="btnRead" runat="server" Text="이진 파일 읽기" OnClick="btnRead_Click" /><br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
