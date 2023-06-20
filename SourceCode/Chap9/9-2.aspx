<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<script runat="server">

    void ShowDirectories(string path)
    {
        lstDirectories.Items.Clear(); // 모든 디렉터리 리스트 삭제
        try
        {
            DirectoryInfo dirInfo = new DirectoryInfo(path);

            if (dirInfo.Root.Name != dirInfo.Name) // 현재의 디렉터리가 루트가 아니라면
                lstDirectories.Items.Add("...");

            lstDirectories.DataSource = dirInfo.GetDirectories();
            lstDirectories.DataTextField = "Name";
            lstDirectories.DataBind();
        }
        catch (Exception ex)
        {
            lblFileInfo.Text = ex.Message;
        }
    }

    void ShowFiles(string path)
    {
        lblFileInfo.Text = "";
        try
        {
            DirectoryInfo dirInfo = new DirectoryInfo(path);
            lstFiles.DataSource = dirInfo.GetFiles();
            lstFiles.DataTextField = "Name";
            lstFiles.DataBind();
        }
        catch (Exception ex)
        {
            lblFileInfo.Text = ex.Message;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string rootPath = @"C:\";
            lblCurrentPath.Text = rootPath;
            ShowDirectories(rootPath);
            ShowFiles(rootPath);
        }
    }

    protected void lstDirectories_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedDirPath = "";
        if (lstDirectories.SelectedItem.Text == "...") // ... 선택 시 상위 디렉터리로 이동
        {
            selectedDirPath = Directory.GetParent(lblCurrentPath.Text).FullName;
        }
        else
        {
            selectedDirPath = Path.Combine(lblCurrentPath.Text, lstDirectories.SelectedItem.Text);
        }
        lblCurrentPath.Text = selectedDirPath;
        ShowDirectories(selectedDirPath);
        ShowFiles(selectedDirPath);
    }

    protected void lstFiles_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedFilePath = Path.Combine(lblCurrentPath.Text, lstFiles.SelectedItem.Text);
        try
        {
            FileInfo fileInfo = new FileInfo(selectedFilePath);

            lblFileInfo.Text = "파일명 : " + fileInfo.Name + "<br />";
            lblFileInfo.Text += "파일 크기 : " + fileInfo.Length + " Bytes <br />";
            lblFileInfo.Text += "생성 시간 : " + fileInfo.CreationTime.ToString() + "<br />";
            lblFileInfo.Text += "마지막 접근 시간 : " + fileInfo.LastAccessTime.ToString();
        }
        catch (Exception ex)
        {
            lblFileInfo.Text = ex.Message;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (lstFiles.SelectedIndex > -1) // 파일을 선택했다면
        {
            string selectedFilePath = Path.Combine(lblCurrentPath.Text, lstFiles.SelectedItem.Text);
            FileInfo fileInfo = new FileInfo(selectedFilePath);
            if (fileInfo.Exists) // 선택한 파일이 존재한다면
            {
                try
                {
                    fileInfo.Delete();
                    ShowFiles(lblCurrentPath.Text);
                }
                catch (Exception ex)
                {
                    lblFileInfo.Text = ex.Message;
                }
            }
            else
            {
                lblFileInfo.Text = "선택한 파일이 존재하지 않습니다.";
            }
        }
        else
        {
            lblFileInfo.Text = "삭제할 파일을 선택하세요.";
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
        <p><asp:Button ID="btnDelete" runat="server" Text="파일 삭제" OnClick="btnDelete_Click" /></p>
        <div>현재 경로 : <asp:Label ID="lblCurrentPath" runat="server"></asp:Label></div>
        <div style="float: left; padding-right: 10px;">
            <asp:ListBox ID="lstDirectories" runat="server" AutoPostBack="true" AppendDataBoundItems="true" Height="100px" OnSelectedIndexChanged="lstDirectories_SelectedIndexChanged"></asp:ListBox>
        </div>
        <div>
            <asp:ListBox ID="lstFiles" runat="server" AutoPostBack="true" Height="100px" OnSelectedIndexChanged="lstFiles_SelectedIndexChanged"></asp:ListBox>
        </div>
        <p><asp:Label ID="lblFileInfo" runat="server"></asp:Label></p>    
    </div>
    </form>
</body>
</html>
