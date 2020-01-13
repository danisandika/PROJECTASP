﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_beri_resep : System.Web.UI.Page
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
        }
    }

    private void loadData()
    {
        string mainconn = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(mainconn);
        string sqlquery = "select IDObat,namaObat,IDJenis,JumlahObat,Satuan,Keterangan,convert(varchar,Harga) AS 'Harga' from obat";
        SqlCommand com = new SqlCommand(sqlquery, sqlconn);
        sqlconn.Open();
        gridObat.DataSource = com.ExecuteReader();
        gridObat.DataBind();
        sqlconn.Close();

        string strID = generateIDTrans();
        lblIDTrans.Text = "ID Transaksi " + strID;      
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

    protected void gridObat_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void gridObat_RowDeleting(object sender, GridViewDeleteEventArgs e)
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
        dt.Columns.Add("IDObat");

        foreach (GridViewRow grow in gridObat.Rows)
        {
            var checkboxselect = grow.FindControl("CheckBox1") as CheckBox;
            if (checkboxselect.Checked)
            {
                string Name = (grow.FindControl("labNama") as Label).Text;
                string satuan = (grow.FindControl("labSat") as Label).Text;
                string jumlah = (grow.FindControl("jumlahBeli") as TextBox).Text;
                string harga = (grow.FindControl("labHarga") as Label).Text;
                string IDObat = (grow.FindControl("labIDObat") as Label).Text;

                decimal hargatot = Convert.ToDecimal(harga) * Convert.ToInt16(jumlah);
                dt.Rows.Add(Name, satuan, jumlah, hargatot,IDObat);
                valuefinal += hargatot;

                lblTotal.Text =Convert.ToString(valuefinal);
                lblJumlahPembelian.Text = "TOTAL PEMBAYARAN RP " + Convert.ToString(valuefinal);
            }

            grdKeranjang.DataSource = dt;
            grdKeranjang.DataBind();


        }
        Response.Write("<script>alert('Data berhasil dimasukkan kekeranjang');</script>");

    }

    protected string generateIDTrans()
    {
        string IDTrans = DateTime.Now.ToString("yyyyMMddhhmmss");
        return IDTrans;
    }

    protected void btnProses_Click(object sender, EventArgs e)
    {

        try
        {

            string strID = generateIDTrans();
            DateTime tanggal = DateTime.Now;
            SqlCommand insert = new SqlCommand("[sp_InputTransaksi]", conn);
            insert.CommandType = CommandType.StoredProcedure;

            insert.Parameters.AddWithValue("@IDTransaksi", strID);
            insert.Parameters.AddWithValue("@IDKaryawan",Session["creaby"]);
            insert.Parameters.AddWithValue("@Tanggal", tanggal);
            insert.Parameters.AddWithValue("@FotoResep", DBNull.Value);
            insert.Parameters.AddWithValue("@totalBayar",Convert.ToDecimal(lblTotal.Text));
            insert.Parameters.AddWithValue("@status", 2);

            conn.Open();
            insert.ExecuteNonQuery();
            conn.Close();

            foreach (GridViewRow grow in grdKeranjang.Rows)
            {

                SqlCommand ins = new SqlCommand("[sp_InputDetailTransaksi]", conn);
                ins.CommandType = CommandType.StoredProcedure;

                ins.Parameters.AddWithValue("IDTransaksi", strID);
                ins.Parameters.AddWithValue("jumlah", (grow.FindControl("labJumlah") as Label).Text);
                ins.Parameters.AddWithValue("subTotal", (grow.FindControl("labHarga") as Label).Text);
                ins.Parameters.AddWithValue("IDObat", (grow.FindControl("labIDObat") as Label).Text);

                conn.Open();
                ins.ExecuteNonQuery();
                conn.Close(); 
            }
            Response.Write("<script>alert('Data berhasil Ditambahkan');</script>");
            loadData();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Data Gagal Ditambahkan');</script>");
        }
    }
}