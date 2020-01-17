using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
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

    public string RandomString(int size, bool lowerCase)
    {
        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        char ch;
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch);
        }
        if (lowerCase)
            return builder.ToString().ToLower();
        return builder.ToString();
    }

    public int RandomNumber(int min, int max)
    {
        Random random = new Random();
        return random.Next(min, max);
    }

    public static string getHtmlMember(string username, string password)
    {
        try
        {
            string messageBody = "<br><br><font>Member Mustika Farma</font><br><br>";
            string htmlTableStart = "<table style=\"border-collapse:collapse; text-align:center;\" >";
            string htmlTableEnd = "</table>";
            string htmlHeaderRowStart = "<tr style=\"background-color:#4267e3; color:#ffffff;\">";
            string htmlHeaderRowEnd = "</tr>";
            string htmlTrStart = "<tr style=\"color:#555555;\">";
            string htmlTrEnd = "</tr>";
            string htmlTdStart = "<td style=\" border-color:#5c87b2; border-style:solid; border-width:thin; padding: 5px;\">";
            string htmlTdEnd = "</td>";
            messageBody += htmlTableStart;
            messageBody += htmlHeaderRowStart;
            messageBody += htmlTdStart + "Username" + htmlTdEnd;
            messageBody += htmlTdStart + "Password" + htmlTdEnd;

            messageBody += htmlHeaderRowEnd;

            messageBody = messageBody + htmlTrStart;
            messageBody = messageBody + htmlTdStart + username + htmlTdEnd; //adding Username
            messageBody = messageBody + htmlTdStart + password + htmlTdEnd; //adding Password

            messageBody = messageBody + htmlTrEnd;
            messageBody = messageBody + htmlTableEnd;
            return messageBody; // return HTML Table as string from this function  
        }
        catch (Exception ex)
        {
            return null;
        }
    }


    protected void SendMail(string email, string htmlString)
    {
        MailMessage msg = new MailMessage();
        SmtpClient client = new SmtpClient();
        try
        {
            msg.Subject = "Welcome to MustikaFarma";
            msg.From = new MailAddress("mustikapharma@gmail.com", "MustikaFarma");
            msg.To.Add(email);
            msg.IsBodyHtml = true;
            msg.Body = htmlString;
            client.Host = "smtp.gmail.com";
            NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential("mustikapharma@gmail.com", "mustikafarma22");
            client.Port = 587;
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicauthenticationinfo;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(msg);
        }
        catch (Exception ex)
        {

        }
    }


    protected void btnSave_Click1(object sender, EventArgs e)
    {
        string str = RandomString(10, false);

        DateTime CreateDate = DateTime.Now;
        DateTime tglLahir = Convert.ToDateTime(txtTanggal.Text);
        int CreateBy = 1;
        int role = 3;
        bool exists = false;
        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        conn.Open();

        using (SqlCommand cmd = new SqlCommand("select count (*) from [User] Where Email =@Email", conn))
        {
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            exists = (int)cmd.ExecuteScalar() > 0;
        }

        if (exists)
        {
            Response.Write("<script>alert('Email sudah pernah digunakan')</script>");
            
        }
        else
        {
            com.CommandText = "sp_InputUser";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Nama", txtNama.Text);
            com.Parameters.AddWithValue("@Alamat", txtAlamat.Text);
            com.Parameters.AddWithValue("@NoTelp", txtNoTelp.Text);
            com.Parameters.AddWithValue("@TglLahir", tglLahir);
            com.Parameters.AddWithValue("@Email", txtEmail.Text);
            com.Parameters.AddWithValue("@status", 1);
            com.Parameters.AddWithValue("@username", str);
            com.Parameters.AddWithValue("@password", "MF@" + Convert.ToString(DateTime.Now.Year));
            com.Parameters.AddWithValue("@createDate", CreateDate);
            com.Parameters.AddWithValue("@createBy", CreateBy);
            com.Parameters.AddWithValue("@IDROle", role);

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            Response.Write("<script>alert('Berhasil Menjadi Member Baru')</script>");

            conn.Close();

            string isiEmail = "&nbsp;&nbsp;Kepada " + txtNama.Text + "," + Environment.NewLine + " berikut ini username dan password anda";
            string htmlMember = getHtmlMember(str, "MF@" + Convert.ToString(DateTime.Now.Year)); //here you will be getting an html string 
            string htmlString = isiEmail + Environment.NewLine + htmlMember + Environment.NewLine + " Sekian informasinya, atas perhatiannya kami ucapkan terima kasih." + Environment.NewLine + "<br/><br/> Hormat Kami<br/><br/>" + Environment.NewLine + " Mustika Farma";
            SendMail(txtEmail.Text, htmlString);

            clearForm();
        }

       
    }

    public void clearForm()
    {
        txtNama.Text = "";
        txtEmail.Text = "";
        txtNoTelp.Text = "";
    }


}
  