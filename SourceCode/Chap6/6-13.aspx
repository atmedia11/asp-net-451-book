<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void ImageMap1_Click(object sender, ImageMapEventArgs e)
    {
        Label1.Text = e.PostBackValue + "가 클릭 되었습니다.";
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
        <h3>ImageMap 컨트롤 예제</h3>
        
        <asp:ImageMap ID="ImageMap1" runat="server" ImageUrl="~/Images/hotspot.jpg" OnClick="ImageMap1_Click" BorderWidth="0px">
            <asp:RectangleHotSpot HotSpotMode="PostBack" PostBackValue="HotSpot1" AlternateText="HotSpot1" Top="30" Left="175" Bottom="110" Right="355"></asp:RectangleHotSpot>
            
            <asp:RectangleHotSpot HotspotMode="PostBack" PostBackValue="HotSpot2" Alternatetext="HotSpot2" Top="155" Left="175" Bottom="240" Right="355"></asp:RectangleHotSpot>
            
            <asp:RectangleHotSpot HotspotMode="Navigate" NavigateUrl="http://www.naver.com" Alternatetext="HotSpot3" Top="285" Left="175" Bottom="365" Right="355"></asp:RectangleHotSpot> 
                    
            <asp:RectangleHotSpot HotspotMode="Postback" PostbackValue="BackGround" AlternateText="BackGround" Top="0" Left="0" Bottom="390" Right="540"></asp:RectangleHotSpot> 
        </asp:ImageMap>
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
