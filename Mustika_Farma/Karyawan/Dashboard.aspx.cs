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

public partial class Karyawan_Dashboard : System.Web.UI.Page
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

        loadPembelian();
        loadPenjualan();
        loadTab();

    }


    private void loadPembelian()
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select COUNT(IDPembelian) as 'Jumlah' from Pembelian where Pembelian.status=2", conn);
        conn.Open();
        myReader = myCommand.ExecuteReader();
        while (myReader.Read())
        {
            lblPembelian.Text = myReader["Jumlah"].ToString();

        }
    }

    private void loadPenjualan()
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select COUNT(IDTransaksi) as 'Jumlah' from Transaksi where Transaksi.status=2", conn);
        conn.Open();
        myReader = myCommand.ExecuteReader();
        while (myReader.Read())
        {
            lblPembayaran.Text = myReader["Jumlah"].ToString();

        }
    }

    private void loadTab()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        SqlDataReader myReader = null;
        SqlDataReader myReade = null;
        SqlDataReader myRead = null;

        SqlCommand myCommand = new SqlCommand("select COUNT(IDObat) as 'Jumlah' from Obat where Obat.status=1", conn);
        conn.Open();
        myReader = myCommand.ExecuteReader();
        while (myReader.Read())
        {
            lblJumlah.Text = myReader["Jumlah"].ToString();

        }
        conn.Close();
        conn.Open();

        SqlCommand myComma= new SqlCommand("select SUM(t.totalBayar) as 'Pendapatan' from transaksi t where[status] = 1", conn);
        myReade = myComma.ExecuteReader();
        while (myReade.Read())
        {
            lblPendapatan.Text = myReade["Pendapatan"].ToString();

        }
        conn.Close();
        conn.Open();
        SqlCommand myComm = new SqlCommand("SELECT top 1 o.namaObat FROM detailTransaksi dt, Obat o, Transaksi t WHERE dt.IDObat = o.IDObat and dt.IDTransaksi = t.IDTransaksi and t.status = 1", conn);
        myRead = myComm.ExecuteReader();
        while (myRead.Read())
        {
            lbFav.Text = myRead["namaObat"].ToString();

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