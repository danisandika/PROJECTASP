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

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Chart1.Visible = true;
        string query = string.Format("select o.namaObat,o.JumlahObat from obat o where o.status=1");
        DataTable dt = GetData(query);
        Chart1.DataSource = dt;
        Chart1.Series[0].ChartType = (SeriesChartType)int.Parse(rblChartType.SelectedItem.Value);
        Chart1.Legends[0].Enabled = true;
        Chart1.Series[0].XValueMember = "namaObat";
        Chart1.Series[0].YValueMembers = "JumlahObat";
        Chart1.DataBind();

        loadTab();
        loadPeople();
        a();
    }

    private void loadPeople()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        SqlDataReader myReader = null;
        SqlDataReader myReade = null;
        SqlDataReader myRead = null;

        SqlCommand myCommand = new SqlCommand("select COUNT(IDSupplier) as 'Jumlah' from Supplier where Supplier.Status=1", conn);
        conn.Open();
        myReader = myCommand.ExecuteReader();
        while (myReader.Read())
        {
            lblSupplier.Text = myReader["Jumlah"].ToString();

        }
        conn.Close();
        conn.Open();

        SqlCommand myComma = new SqlCommand("select COUNT(ID_Dokter) as 'Jumlah' from Dokter where Dokter.status = 1", conn);
        myReade = myComma.ExecuteReader();
        while (myReade.Read())
        {
            lblDokter.Text = myReade["Jumlah"].ToString();

        }
        conn.Close();
        conn.Open();
        SqlCommand myComm = new SqlCommand("select COUNT(IDUser) as 'Jumlah' from [User] where status = 1", conn);
        myRead = myComm.ExecuteReader();
        while (myRead.Read())
        {
            lblUser.Text = myRead["Jumlah"].ToString();

        }
        conn.Close();
    }

    private void a()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        conn.Open();
        SqlDataReader myReade = null;
        SqlCommand myComma = new SqlCommand("SELECT top 1 o.JumlahObat, o.namaObat FROM detailTransaksi dt, Obat o, Transaksi t WHERE dt.IDObat = o.IDObat and dt.IDTransaksi = t.IDTransaksi and t.status = 1 order by o.JumlahObat asc", conn);
        myReade = myComma.ExecuteReader();
        while (myReade.Read())
        {
            lblstok.Text = myReade["namaObat"].ToString();

        }
        conn.Close();
    }


    private void loadTab()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        SqlDataReader myReader = null;
      
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

    protected void btnEdit_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancelEdit_Click(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancelAdd_Click(object sender, EventArgs e)
    {

    }
}