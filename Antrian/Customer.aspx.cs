using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    SqlDataReader dr;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        mindate = DateTime.Today;
        maxdate = mindate.AddDays(7);
    }

    protected string generateid()
    {
        long hitung;
        string strdate = calender1.SelectedDate.ToString("yyyyMMdd");
        
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        conn.Open();
        com.CommandText = "sp_SelectLast";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@strdate", strdate);
        dr = com.ExecuteReader();
        dr.Read();
        if (dr.HasRows)
        {
            if (dr[0].ToString().Substring(0,8) == strdate)
            {
                hitung = Convert.ToInt64(dr[0].ToString()) + 1;
                string joinstr = "0000" + hitung;
                txtnumber.Text = joinstr.Substring(joinstr.Length - 4, 4);
            }
            else
            {
                txtnumber.Text = "0001";
            }
        }
        else
        {
            txtnumber.Text = "0001";
        }
        conn.Close();
        return txtnumber.Text;
    }



    protected void btnsave_Click(object sender, EventArgs e)
    {
        string strdate = calender1.SelectedDate.ToString("yyyyMMdd");
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_insertantrian";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@no_antrian", strdate+txtnumber.Text);
        com.Parameters.AddWithValue("@jenis", "Dokter");
        com.Parameters.AddWithValue("@idkaryawan", "1");
        com.Parameters.AddWithValue("@tanggal",DateTime.Now.ToString("yyyy-MM-dd"));
        com.Parameters.AddWithValue("@mulai",DateTime.Now);
        //com.Parameters.AddWithValue("@selesai", );
        com.Parameters.AddWithValue("@status", 1);
        com.Parameters.AddWithValue("@iduser", 1);
        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        generateid();
    }


    DateTime mindate = DateTime.MinValue;
    DateTime maxdate = DateTime.MaxValue;

    protected void calender1_DayRender(object sender, DayRenderEventArgs e)
    {
       if(e.Day.Date < mindate || e.Day.Date > maxdate)
        {
            e.Day.IsSelectable = false;
        }
    }

    protected void calender1_SelectionChanged(object sender, EventArgs e)
    {
        generateid();
    }
}