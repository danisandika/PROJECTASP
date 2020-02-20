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


public partial class Manager_Laporan : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet da = new DataSet();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        loadReport();
        loadReport2();
        dsToArray();
        GENTOARRAY();
    }

    public DataSet loadReport()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Report_TransaksiBulan";
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(da, "dataReport");
        return da;
    }

    public DataSet loadReport2()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "[Report_TransaksiBeli]";
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds, "dataReport");
        return ds;
    }

    public string jsonBulan, jsonJumlah, jsonPembelian, jsonBulans;

    public void dsToArray()
    {
        List<string> Bulan = new List<string>();
        List<int> Pendapatan = new List<int>();

        foreach (DataRow row in da.Tables[0].Rows)
        {
            Bulan.Add(row["Bulan"].ToString());
            Pendapatan.Add(Convert.ToInt32(row["Pendapatan"]));
        }

        string[] Buland = Bulan.ToArray();
        int[] jumlahd = Pendapatan.ToArray();

        jsonBulan = JsonConvert.SerializeObject(Buland);
        jsonJumlah = JsonConvert.SerializeObject(jumlahd);
    }


    public void GENTOARRAY()
    {
        List<string> Bulans = new List<string>();

        List<int> Pembelian = new List<int>();

        foreach (DataRow row in ds.Tables[0].Rows)
        {
            Bulans.Add(row["Bulan"].ToString());
            Pembelian.Add(Convert.ToInt32(row["Pembelian"]));

            string[] Bulansa = Bulans.ToArray();
            int[] jumlahPembelian = Pembelian.ToArray();
            jsonPembelian = JsonConvert.SerializeObject(jumlahPembelian);
            jsonBulans = JsonConvert.SerializeObject(Bulansa);


        }

    }


}