using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_konf_pembelian : System.Web.UI.Page
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
            secDetail.Visible = false;
        }
    }

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_Selectkonf_pembayaran]";
        com.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridKonf.DataSource = ds;
        gridKonf.DataBind();
        return ds;
        
    }


    protected void gridKonf_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridKonf.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridKonf_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {

        }
        else if (e.CommandName == "delete")
        {
           
        }
    }

    private void sortGridView(string sortExpression, string direction)
    {
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridKonf.DataSource = dv;
        gridKonf.DataBind();
    }

    protected void gridKonf_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;

        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            sortGridView(sortExpression, Descending);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            sortGridView(sortExpression, Ascending);
        }
    }

    public SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Ascending;
            return (SortDirection)ViewState["sortDirection"];
        }

        set
        {
            ViewState["sortDirection"] = value;
        }
    }

    protected void gridKonf_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridKonf_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void gridKonf_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void lnkViewDetails_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        string id = row.Cells[1].Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_detail_Pembelian]";
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adap = new SqlDataAdapter(com);
        com.Parameters.AddWithValue("@IDPembelian", id);

        adap.Fill(ds);
        grdDetail.DataSource = ds;
        grdDetail.DataBind();
        secDetail.Visible = true;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
       
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        string id = row.Cells[1].Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_updatePembelian";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDPembelian",id);
        com.Parameters.AddWithValue("@status",1);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();
        secDetail.Visible = false;

        //cek apakah ada data yg akan ditambahkan/ubah
        if (result != 0)
        {
            Response.Write("<script>alert('Data berhasil ditambahkan');</script>");
        }
        else
        {
            Response.Write("<script>alert('Data Gagal ditambahkan');</script>");
        }
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        string id = row.Cells[1].Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_updatePembelian";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDPembelian", id);
        com.Parameters.AddWithValue("@status", 0);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();
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

    protected void lnkEdit_Click1(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        IDPembelian.Text= row.Cells[1].Text;
        namaObat.Text = row.Cells[2].Text;
        jumlah.Text= row.Cells[3].Text;
        SubTotal.Text = row.Cells[4].Text;
        IDSupplier.Text= row.Cells[5].Text;
        IDObat.Text = row.Cells[6].Text;
        
        double hargajual = (Convert.ToDouble(row.Cells[8].Text)*5/100) + Convert.ToDouble(row.Cells[8].Text);
        double hargasatuan = (Convert.ToDouble(row.Cells[8].Text));

        harga.Text = Convert.ToString(hargasatuan);
        hargaJual.Text =Convert.ToString(hargajual);

        DateTime exp = Convert.ToDateTime(row.Cells[7].Text);
        Kadaluarsa.Text = exp.ToString("yyyy-MM-dd");

        //Show the modal popup extender
        GridViewDetails.Show();
    }
    

    protected void btnclose_Click(object sender, EventArgs e)
    {
        GridViewDetails.Hide();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            //Waktu edit 
                SqlCommand com = new SqlCommand();
                com.Connection = conn;
                com.CommandText = "[sp_UpdateHargaJual]";
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@namaObat", namaObat.Text);
                com.Parameters.AddWithValue("@harga",Convert.ToDecimal(harga.Text));
                com.Parameters.AddWithValue("@IDSupplier",Convert.ToInt64(IDSupplier.Text));
                com.Parameters.AddWithValue("@kadaluarsa",Convert.ToDateTime(Kadaluarsa.Text));
                com.Parameters.AddWithValue("@IDPembelian",IDPembelian.Text);

                com.Parameters.AddWithValue("@jumlah",Convert.ToDecimal(jumlah.Text));
                com.Parameters.AddWithValue("@IDObat",Convert.ToInt16(IDObat.Text));

                conn.Open();
                int result = Convert.ToInt32(com.ExecuteNonQuery());
                conn.Close();
                Response.Write("<script>alert('Data Berhasil diupdate');</script>");
                hargaJual.Text = "";
                
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Data Gagal diupdate"+ ex.Message +"');</script>");

        }
        
    }

   
    

}