using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Karyawan_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Chart1.Visible = true;
        string query = string.Format("SELECT namaObat, COUNT(dt.IDObat) as 'Total' FROM transaksi t, detailTransaksi dt,obat o where o.IDObat = dt.IDObat and t.IDTransaksi = dt.IDTransaksi group by namaObat");
        DataTable dt = GetData(query);
        Chart1.DataSource = dt;
        Chart1.Series[0].ChartType = (SeriesChartType)int.Parse(rblChartType.SelectedItem.Value);
        Chart1.Legends[0].Enabled = true;
        Chart1.Series[0].XValueMember = "namaObat";
        Chart1.Series[0].YValueMembers = "Total";
        Chart1.DataBind();

        loadTab();

    }


    private void loadTab()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        SqlDataReader myReader = null;
        SqlDataReader myReade = null;
        SqlDataReader myRead = null;

        SqlCommand myCommand = new SqlCommand("select count (u.Nama ) as 'Jumlah_Pasien' from riwayat r, [User] u where u.IDUser= r.IDUser and r.ID_Dokter= @ID_Dokter", conn);
        myCommand.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);

        conn.Open();
        myReader = myCommand.ExecuteReader();
        while (myReader.Read())
        {
            lblPendapatan.Text = myReader["Jumlah_Pasien"].ToString();

        }
        conn.Close();
        conn.Open();

        SqlCommand myComma = new SqlCommand("select count (IDBooking) as 'Jumlah_Antrean' from Booking, [User] u where u.IDUser= Booking.IDUser and  Booking.statusBooking=2 and Booking.ID_Dokter= @ID_Dokter", conn);
        myComma.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);
        myReade = myComma.ExecuteReader();
        while (myReade.Read())
        {
            lbFav.Text = myReade["Jumlah_Antrean"].ToString();

        }
        conn.Close();
        conn.Open();
        SqlCommand myComm = new SqlCommand("select top 1 u.Nama from riwayat r, [User] u where r.IDUser= u.IDUser and r.ID_Dokter= @ID_Dokter", conn);
        myComm.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);

        myRead = myComm.ExecuteReader();
        while (myRead.Read())
        {
            lblJumlah.Text = myRead["Nama"].ToString();

        }
        conn.Close();

    }


    private static DataTable GetData(string query)
    {
        string constr = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    sda.Fill(dt);
                }

                return dt;
            }
        }
    }
}