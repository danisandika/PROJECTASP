using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_Dokter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        const String QS_RETURN_URL = "ReturnURL";

        String nextPage = null;
        FormsAuthenticationTicket ticket = null;
        string nama;
        HttpCookie cookie = null;
        String encryptedStr = null;
        
        nama = "";
        nama = nama + "ID_Dokter".ToString();
        Session["creaby"] = nama;
      
        SqlConnection conn;
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from Dokter where username=@username and password=@password", conn);
        cmd.Parameters.AddWithValue("@username", txtNama.Text);
        cmd.Parameters.AddWithValue("@password", txtPass.Text);

       // int iddok = "ID_Dokter";
        //Session["id"] = Convert.ToInt32(iddok);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        int i = cmd.ExecuteNonQuery();
        conn.Close();

        if (dt.Rows.Count > 0)
        {
            Response.Redirect("Karyawan/Dokter_periksa.aspx");
        }
        else
        {
            Response.Write("<script>alert('Password yang anda masukkan Salah')</script>");
        }

    }

    private bool IsAuthentic(string username, string password)
    {
        String nextPage = null;
        bool autentik = false;

        string cmd = "SELECT password FROM [Dokter] WHERE username = '" + username + "'";
        try
        {
            SqlConnection conn;
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
            conn.Open();

            //Create a SqlCommand object and assign the connection
            System.Data.SqlClient.SqlCommand command =
                new System.Data.SqlClient.SqlCommand();
            command.Connection = conn;
            command.CommandText = cmd;

            //eksekusi command
            var obj = command.ExecuteScalar();

            if (password == obj.ToString())
            {
                autentik = true;
                nextPage = "Karyawan/Dokter_periksa.aspx";
            }
        }
        catch (Exception xcp)
        {
            Response.Write("<script>alert('Username Yang Anda Masukkan Salah')</script>");
        }
        return autentik;
    }

    private DataSet GetID(string username)
    {
        DataSet ds = new DataSet();
        string cmd = "SELECT idUser FROM [User] WHERE username = '" + username + "'";
        try
        {
            //buat object connection
            SqlConnection conn;
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);


            //buat dataadapter
            SqlDataAdapter myAdapter = new SqlDataAdapter(cmd, conn);

            //eksekusi dan simpan dalam dataset
            myAdapter.Fill(ds);

        }
        catch (Exception xcp)
        {
            Response.Write("<script>alert('Error 2')</script>");
        }
        return ds;
    }

}