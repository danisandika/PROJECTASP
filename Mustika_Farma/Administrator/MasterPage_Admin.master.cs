using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["creaby"] == null)
        {
            Response.Redirect("../Login.aspx");
        }

    }

    protected void lnkLogOut_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("../Login.aspx");
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
       
            Response.Redirect("Profile.aspx");
 
    }
}
