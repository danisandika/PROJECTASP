using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Configuration;

public partial class Manager_Laporan_Harian : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet da = new DataSet();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        loadReport();
        convToArray();
    }


    public DataSet loadReport()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Report_Penjualan";
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(da, "dataReport");
        return da;
    }

    public string jsonNama, jsonJumlah;

    public void convToArray()
    {
        List<string> nama = new List<string>();
        List<int> Pendapatan = new List<int>();

        foreach (DataRow row in da.Tables[0].Rows)
        {
            nama.Add(row["namaObat"].ToString());
            Pendapatan.Add(Convert.ToInt32(row["Jumlah Pembelian"]));
        }

        string[] NamaD = nama.ToArray();
        int[] pendapatanD = Pendapatan.ToArray();

        jsonNama = JsonConvert.SerializeObject(NamaD);
        jsonJumlah = JsonConvert.SerializeObject(pendapatanD);
    }


}