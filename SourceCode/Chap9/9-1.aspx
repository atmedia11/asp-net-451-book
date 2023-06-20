<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string path1 = @"C:\temp";
        string path2 = @"MyFile\test.txt";

        string combine = Path.Combine(path1, path2);
        string directoryName = Path.GetDirectoryName(combine);
        string fileName1 = Path.GetFileName(combine);
        string fileName2 = Path.GetFileNameWithoutExtension(combine);
        string root = Path.GetPathRoot(combine);
        bool hasExtension = Path.HasExtension(combine);

        Response.Write("Combine() ==> " + combine + "<br />");
        Response.Write("GetDirectoryName() ==> " + directoryName + "<br />");
        Response.Write("GetFileName() ==> " + fileName1 + "<br />");
        Response.Write("GetFileNameWithoutExtension() ==> " + fileName2 + "<br />");
        Response.Write("GetPathRoot() ==> " + root + "<br />");
        Response.Write("HasExtension() ==> " + hasExtension);
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
