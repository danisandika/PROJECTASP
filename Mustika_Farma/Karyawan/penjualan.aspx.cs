using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_penjualan : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        EditFotoView.Visible = true;
        if (!IsPostBack)
        {

            string mainconn = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            string sqlquery = "select IDObat,namaObat,IDJenis,JumlahObat,Satuan,Keterangan,Harga from obat";
            SqlCommand com = new SqlCommand(sqlquery, sqlconn);
            sqlconn.Open();
            gridObat.DataSource = com.ExecuteReader();
            gridObat.DataBind();
            sqlconn.Close();

        }

    }

    protected void rbResep_SelectedIndexChanged(object sender, EventArgs e)
    {
        int resep = Convert.ToInt32(rbResep.SelectedValue.ToString());
        if (resep==1)
        {
            EditFotoView.Visible = true;
        }
        else
        {
            EditFotoView.Visible = false;
        }

    }

    protected void gridObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void gridObat_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gridObat_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void gridObat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridObat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gridObat_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void keranjang_Click(object sender, EventArgs e)
    {
        decimal valuefinal = 0;
        DataTable dt = new DataTable();
        dt.Columns.Add("namaObat");
        dt.Columns.Add("Satuan");
        dt.Columns.Add("jumlahBeli");
        dt.Columns.Add("harga");

        foreach (GridViewRow grow in gridObat.Rows)
        {
            var checkboxselect = grow.FindControl("CheckBox1") as CheckBox;
            if (checkboxselect.Checked)
            {
                string Name = (grow.FindControl("labNama") as Label).Text;
                string satuan = (grow.FindControl("labSat") as Label).Text;
                string jumlah = (grow.FindControl("jumlahBeli") as TextBox).Text;
                string harga = (grow.FindControl("labHarga") as Label).Text;

                decimal hargatot = Convert.ToDecimal(harga) * Convert.ToInt16(jumlah);
                dt.Rows.Add(Name, satuan, jumlah, hargatot);
                valuefinal += hargatot;
                    
                lblJumlahPembelian.Text = "TOTAL PEMBAYARAN RP " + Convert.ToString(valuefinal);
                //txtHarga.Text = Convert.ToString(valuefinal);
            }

            grdKeranjang.DataSource = dt;
            grdKeranjang.DataBind();


        }
        Response.Write("<script>alert('Data berhasil dimasukkan kekeranjang');</script>");

    }

    private double total = 0;
    private double pembayaran = 0;

    protected void txtBayar_TextChanged(object sender, EventArgs e)
    {
        //double bayar = Convert.ToDouble(txtBayar.Text);
        //pembayaran = bayar;
        //kembalian();
    }

    //public void kembalian()
    //{
    //    double num1 = Convert.ToDouble(txtHarga.Text);
    //    total = num1;

    //    double Kembalian = pembayaran - total;
    //    txtKembalian.Text = Convert.ToString(Kembalian);
    //    if (Kembalian < 0)
    //    {
    //        Response.Write("<script>alert('Uang Anda Tidak Mencukupi');</script>");
    //    }
    //    else
    //    {
    //        Response.Write("<script>alert('Terimakasih, Mohon ditunggu pesanannya ');</script>");
    //    }

    //}
}