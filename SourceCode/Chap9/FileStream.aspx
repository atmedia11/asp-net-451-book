<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        string dirPath = @"C:\temp\MyFile";
        if (!Directory.Exists(dirPath))
            Directory.CreateDirectory(dirPath);
        
        Stream outStream = new FileStream(@"C:\temp\MyFile\a.dat", FileMode.Create);
        byte[] info = BitConverter.GetBytes(100);
        outStream.Write(info, 0, info.Length);
        outStream.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Stream inStream = new FileStream(@"C:\temp\MyFile\a.dat", FileMode.Open);
        byte[] info = new byte[4];
        inStream.Read(info, 0, info.Length);
        int value = BitConverter.ToInt32(info, 0);
        inStream.Close();

        Response.Write(value);
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
        <asp:Button ID="Button1" runat="server" Text="파일 쓰기" onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="파일 읽기" onclick="Button2_Click" />    
    </div>
    </form>
</body>
</html>
