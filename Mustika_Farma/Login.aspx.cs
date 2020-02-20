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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
       const String QS_RETURN_URL = "ReturnURL";

        String nextPage = null;
        FormsAuthenticationTicket ticket = null;
        string role;
        string nama;
        HttpCookie cookie = null;
        String encryptedStr = null;


        if (IsAuthentic(txtNama.Text, txtPass.Text))
        {
            //mengambil role dari user
            role = "";
            nama = "";
            DataSet ds = new DataSet();
            ds = GetRoles(txtNama.Text);

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                role = role + row["idrole"].ToString() + ",";
                nama = nama + row["iduser"].ToString();
            }
            role = role.Remove(role.Length - 1, 1);
            Session["creaby"] = nama;


            //user crendentials were found in the database sonotify the system
            //that the user is authenticated 
            //create an authentication ticket for the user with an expiration
            //time of 15 minutes and placing the user's role in the userData
            //property
            ticket = new FormsAuthenticationTicket(1,
                txtNama.Text,
                DateTime.Now,
                DateTime.Now.AddMinutes(15),
                true,
                role.ToUpper());

            encryptedStr = FormsAuthentication.Encrypt(ticket);

          
            cookie = new HttpCookie(FormsAuthentication.FormsCookieName,
                encryptedStr);
            Response.Cookies.Add(cookie);

            if (Request.QueryString[QS_RETURN_URL] != null)
            {
                 nextPage = Request.QueryString[QS_RETURN_URL];
            }
            if (role == "1")
            {
                //user came straight to the login page so just send them to the 
                //homepage
                nextPage = "Administrator/Dashboard.aspx";

            }
            else if (role == "2")
            {
                //user came straight to the login page so just send them to the 
                //homepage
                nextPage = "Karyawan/Dashboard.aspx";

            }
            else if (role == "3")
            {
                nextPage = "Customer/Riwayat.aspx";
            }
            else if (role == "4")
            {
                nextPage = "Karyawan/Home.aspx";
            }
            else if (role == "5")
            {
                nextPage = "Manager/Laporan.aspx";
            }
            else
            {
                //user came straight to the login page so just send them to the 
                //homepage
                nextPage = "Customer/Transaksi.aspx";

            }

            Response.Redirect(nextPage, true);
        }
        else
        {
            Response.Write("<script>alert('Password yang anda masukkan Salah')</script>");
        }
    }

    private bool IsAuthentic(string username, string password)
    {
        bool autentik = false;

        string cmd = "SELECT password FROM [User] WHERE username = '" + username + "'";
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
            }
        }
        catch (Exception xcp)
        {
            Response.Write("<script>alert('Username Yang Anda Masukkan Salah')</script>");
        }
        return autentik;
    }

    private DataSet GetRoles(string username)
    {
        DataSet ds = new DataSet();
        string cmd = "SELECT idUser,idrole FROM [User] WHERE username = '" + username + "'";
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