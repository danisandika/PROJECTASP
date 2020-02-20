using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Profile : System.Web.UI.Page
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
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectProfile]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@ID", Session["creaby"]);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        DataRow dr = ds.Tables[0].Rows[0];
        txtEmail.Text = dr["Email"].ToString();
        txtNama.Text = dr["Nama"].ToString();
        txtNama.Text = dr["Alamat"].ToString();
        txtNoTelp.Text = dr["NoTelp"].ToString();
        txtTanggal.Text = dr["TglLahir"].ToString();
        txtUsername.Text = dr["username"].ToString();
        txtPasswordLama.Text = dr["password"].ToString();
        lblNama.Text = dr["Nama"].ToString();
        lblAlamat.Text= dr["Alamat"].ToString();
        lblEmail.Text = dr["Email"].ToString();
        lblNotelp.Text= dr["NoTelp"].ToString();

        return ds;
    }


}