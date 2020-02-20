using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Antrian : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        loadData();
        
    }

    private DataSet loadData()
    {
        string strdate = DateTime.Now.ToString("yyyyMMdd");

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectLastNumberAntrian";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@strdate", strdate);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridAntre.DataSource = ds;
        gridAntre.DataBind();
        return ds;
    }



    protected void gridAntre_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        gridAntre.DataBind();
    }
}