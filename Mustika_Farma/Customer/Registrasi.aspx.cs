using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Registrasi : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnSave_Click1(object sender, EventArgs e)
    {
        DateTime CreateDate = DateTime.Now;
        DateTime tglLahir = Convert.ToDateTime(txtTanggal.Text);
        int CreateBy = 1;
        int role = 3;
        string pass = "MUSTIKA2019";

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InputUser";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Nama", txtNama.Text);
        com.Parameters.AddWithValue("@Alamat", txtAlamat.Text);
        com.Parameters.AddWithValue("@NoTelp", txtNoTelp.Text);
        com.Parameters.AddWithValue("@TglLahir", tglLahir);
        com.Parameters.AddWithValue("@Email", txtEmail.Text);
        com.Parameters.AddWithValue("@status", 1);
        com.Parameters.AddWithValue("@username", txtUsername.Text);
        com.Parameters.AddWithValue("@password",pass);
        com.Parameters.AddWithValue("@createDate", CreateDate);
        com.Parameters.AddWithValue("@createBy", CreateBy);
        com.Parameters.AddWithValue("@IDROle", role);
        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        Response.Write("<script>alert('Berhasil Menjadi Member Baru')</script>");

        conn.Close();
    }
}