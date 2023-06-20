<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        //Application["TotalCount"] = 0; // 총 접속자 수
        //Application["CurrCount"] = 0; // 현재 접속자 수
    }

    void Session_Start(object sender, EventArgs e) 
    {
        //Application.Lock();
        //Application["TotalCount"] = (int)Application["TotalCount"] + 1;
        //Application["CurrCount"] = (int)Application["CurrCount"] + 1;
        //Application.UnLock();

        //Response.Write("Session_Start <br /><br />");
    }

    void Session_End(object sender, EventArgs e) 
    {
        //Application.Lock();
        //Application["CurrCount"] = (int)Application["CurrCount"] - 1;
        //Application.UnLock();
    }
       
</script>
