<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Security.Principal" %>

<script runat="server">

    void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        String roles = null;
        FormsIdentity identity = null;

        if (Context.Request.IsAuthenticated)
        {
            identity = (FormsIdentity)(Context.User.Identity);
            roles = identity.Ticket.UserData;

            Context.User = new GenericPrincipal(identity, roles.Split(','));
        }
    }

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Application["SessionCount"] = 0;
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
        // Code that runs when a new session is started
        Application.Lock();
        int count = (int)Application["SessionCount"];
        Application["SessionCount"] = count + 1;
        Application.UnLock();

    }

    void Session_End(object sender, EventArgs e)
    {
         Application.Lock();
        int count = (int)Application["SessionCount"];
        Application["SessionCount"] = count - 1;
        Application.UnLock();

    }

</script>
