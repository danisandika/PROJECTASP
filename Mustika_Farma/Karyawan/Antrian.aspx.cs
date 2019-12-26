using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_Antrian : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblNama.Text = Session["creaby"].ToString();

    }
}