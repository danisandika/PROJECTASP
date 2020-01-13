using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_beli : System.Web.UI.Page
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


    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectBeli]";
        com.CommandType = CommandType.StoredProcedure;
        //com.Parameters.AddWithValue("@nama", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridObat.DataSource = ds;
        gridObat.DataBind();
        return ds;
    }


    protected void Keranjang_SelectedIndexChanged(object sender, EventArgs e)
    {


    }

    private void sortGridView(string sortExpression, string direction)
    {
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridObat.DataSource = dv;
        gridObat.DataBind();
    }

    protected void Keranjang_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void Keranjang_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }



    protected void gridObat_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void btnSearch_Click1(object sender, EventArgs e)
    {

    }


    protected void gridObat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridObat_Sorting1(object sender, GridViewSortEventArgs e)
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

    protected void gridObat_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gridObat_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void gridObat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }



    protected void rbResep_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }

    protected void btnKeranjang_Click(object sender, EventArgs e)
    {


    }


    protected void keranjang_Click(object sender, EventArgs e)
    {
        double valuefinal = 0;
        DataTable dt = new DataTable();
        dt.Columns.Add("namaObat");
        dt.Columns.Add("Satuan");
        dt.Columns.Add("jumlah");
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
                string harga = (grow.FindControl("harga") as Label).Text;
                string IDObat = (grow.FindControl("labIDObat") as Label).Text;

                double hargatot = Convert.ToDouble(harga) * Convert.ToInt16(jumlah);
                dt.Rows.Add(Name, satuan, jumlah, hargatot, IDObat);
                valuefinal += hargatot;

                lblJumlahPembelian.Text = "TOTAL PEMBAYARAN RP " + Convert.ToString(valuefinal);
                txtHarga.Text = Convert.ToString(valuefinal);
            }

            grdKeranjang.DataSource = dt;
            grdKeranjang.DataBind();


        }
        Response.Write("<script>alert('Data berhasil dimasukkan kekeranjang');</script>");
    }

    protected string generateIDPembelian()
    {
        string IDPembelian = DateTime.Now.ToString("yyyyMMddhhmmss");
        return IDPembelian;
    }

    protected void jumlahBeli_TextChanged(object sender, EventArgs e)
    {

    }

    protected void gridObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridObat.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void txtBayar_TextChanged(object sender, EventArgs e)
    {
        double bayar = Convert.ToDouble(txtBayar.Text);
    }


    public void kembalian()
    {
        double nilai = Convert.ToDouble(txtKembalian.Text);
        if (nilai < 0)
        {
            Response.Write("<script>alert('Uang Anda Tidak Mencukupi');</script>");
        }
        else
        {
            Response.Write("<script>alert('Silahkan tunggu Proses ');</script>");
        }

    }

    protected void btnProses_Click1(object sender, EventArgs e)
    {


    }

    protected void btnProses_Click(object sender, EventArgs e)
    {

        string strIDPembelian = generateIDPembelian();
        DateTime tanggal = DateTime.Now;
        SqlCommand insert = new SqlCommand("sp_InputPembelian", conn);
        insert.CommandType = CommandType.StoredProcedure;

        insert.Parameters.AddWithValue("@IDPembelian", strIDPembelian);
        insert.Parameters.AddWithValue("@IDKaryawan", Session["creaby"]);
        insert.Parameters.AddWithValue("@tanggal", tanggal);
        insert.Parameters.AddWithValue("@IDSupplier", DDLSupplier.SelectedValue);
        insert.Parameters.AddWithValue("@totalbayar", txtHarga.Text);

        conn.Open();
        insert.ExecuteNonQuery(); 
        conn.Close();



        foreach (GridViewRow grow in grdKeranjang.Rows)
        {
    
            SqlCommand ins = new SqlCommand("sp_Inputdetailpembelian", conn);
            ins.CommandType = CommandType.StoredProcedure;

            ins.Parameters.AddWithValue("IDPembelian", strIDPembelian);
            ins.Parameters.AddWithValue("jumlah", (grow.FindControl("labJumlah") as Label).Text);
            ins.Parameters.AddWithValue("subTotal", (grow.FindControl("labHarga") as Label).Text);
            ins.Parameters.AddWithValue("IDObat", (grow.FindControl("labIDObat") as Label).Text);

            conn.Open();
            ins.ExecuteNonQuery();
            conn.Close();
        }

    }

    protected void DDLSupplier_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnSupplier_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectBeli_Supplier]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDSupplier", DDLSupplier.SelectedValue.ToString());

        SqlDataAdapter adapt = new SqlDataAdapter(com);
        adapt.Fill(ds);
        gridObat.DataSource = ds;
        gridObat.DataBind();
    }
}