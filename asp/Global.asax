<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        Session["_USERCODE"] = "";
        Session["_NAME"] = "";
        Session["_EMAIL"] = "";
        Session["_MOBILE"] = "";
        Session["_EDUCATION"] = "";
        Session["_SKILLS"] = "";
        Session["_TRAINING"] = "";
        Session["_PROJECT"] = "";
        Session["_CERTIFICATION"] = "";
        Session["_ADDETAILS"] = "";
        Session["_HOBBIES"] = "";
        Session["_LANGUAGE"] = "";
        Session["_STRENGTHS"] = "";
        Session["_PROFFSUMMARY"] = "";
        Session["_OBJECTIVE"] = "";
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
