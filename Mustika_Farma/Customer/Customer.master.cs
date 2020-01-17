using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Customer : System.Web.UI.MasterPage
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
            Obat();
        }
    }


    protected void Bind()
    {
        string query = "select d.ID_SP,d.nama, d.alamat, d.foto, jd.nama_jenis as 'namaJenis' FROM Dokter d, jenis_dokter jd where d.ID_SP = jd.ID_SP and d.status=1";
        string conString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        dokter.DataSource = dt;
                        dokter.DataBind();
                    }
                }

            }

        }

    }

    protected void Obat()
    {
        string query = "select IDObat, namaObat,Harga, Foto FROM Obat where status=1";
        string conString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        obat.DataSource = dt;
                        obat.DataBind();
                    }
                }

            }

        }

    }

}
