using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Karyawan_Pembayaran : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadData();
            //secDetail.Visible = false;
        }
    }

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_Selectkonf_Transaksi]";
        com.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridKonf.DataSource = ds;
        gridKonf.DataBind();
        return ds;

    }

    private void sortGridView(string sortExpression, string direction)
    {
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridKonf.DataSource = dv;
        gridKonf.DataBind();
    }

    protected void rbResep_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridKonf_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridKonf.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridKonf_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gridKonf_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void gridKonf_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void gridKonf_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gridKonf_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        string id = row.Cells[1].Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_updatTransaksi]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDTransaksi", id);
        com.Parameters.AddWithValue("@status", 0);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        // loadData();
        //cek apakah ada data yg akan ditambahkan/ubah
        if (result != 0)
        {
            Response.Write("<script>alert('Data berhasil dimasukkan kekeranjang');</script>");
        }
        else
        {
            Response.Write("<script>alert('Data Gagal dimasukkan kekeranjang');</script>");
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        IDTransaksi.Text = row.Cells[1].Text;
        Tanggal.Text = row.Cells[3].Text;
        totalBayar.Text = row.Cells[4].Text;

        //Show the modal popup extender
        GridViewDetails.Show();

        //coba simpan semua didetail bismillah
       
      
    }

    protected void lnkViewDetails_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        string id = row.Cells[1].Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_detail_Transaksi]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDTransaksi", id);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        grdDetail.DataSource = ds;
        grdDetail.DataBind();

        grdDetail.Visible = true;

        //secDetail.Visible = true;

    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        GridViewDetails.Hide();
    }

    private double total = 0;
    private double pembayaran = 0;

    protected void Bayar_TextChanged(object sender, EventArgs e)
    {
        double bayar = Convert.ToDouble(Bayar.Text);
        pembayaran = bayar;
        kembalian();
    }

    public void kembalian()
    {
        double num1 = Convert.ToDouble(totalBayar.Text);
        total = num1;

        double Kembali = pembayaran - total;
        Kembalian_uang.Text = Convert.ToString(Kembali);
        if (Kembali < 0)
        {
            Response.Write("<script>alert('Uang Anda Tidak Mencukupi');</script>");

        }
        else
        {
            //perulangan masih salah, semua keubah bukan berdasarkan IDObat yg berubah
            foreach (GridViewRow grow in grdDetail.Rows)
            {

                //Waktu edit kenapa 
                SqlCommand cm = new SqlCommand();
                cm.Connection = conn;
                cm.CommandText = "[sp_InputkonfTrans]";
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@IDTransaksi", (grow.FindControl("IDTransaksi") as Label).Text);
                cm.Parameters.AddWithValue("@status", 1);

                cm.Parameters.AddWithValue("@IDObat", (grow.FindControl("IDObat") as Label).Text);
                cm.Parameters.AddWithValue("@jumlah", (grow.FindControl("jumlah") as Label).Text);

                conn.Open();
                int res = cm.ExecuteNonQuery();
                conn.Close();
            }

            Response.Write("<script>alert('Terimakasih, Mohon ditunggu pesanannya ');</script>");
        }

    }

    protected void btnBayar_Click(object sender, EventArgs e)
    {

    }
}