using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        getID();
    }

    protected string getID()
    {
        
        string strdate = DateTime.Now.ToString("yyyyMMdd");

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        conn.Open();
        com.CommandText = "sp_SelectLastNumber";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@strdate", strdate);
        dr = com.ExecuteReader();
        dr.Read();
        if (dr.HasRows)
        {
            txtID.Text = dr[0].ToString().Substring(8, 4);
            
        }
        else
        {
            txtID.Text = "Antrian Habis";
        }
        conn.Close();
        return txtID.Text;
    }


    protected void btnNext_Click(object sender, EventArgs e)
    {
        string strdate = DateTime.Now.ToString("yyyyMMdd");
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_updateantrian";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@no_antrian", strdate + txtID.Text);
        com.Parameters.AddWithValue("@selesai", DateTime.Now);
        com.Parameters.AddWithValue("@status", 0);

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        getID();
    }

}