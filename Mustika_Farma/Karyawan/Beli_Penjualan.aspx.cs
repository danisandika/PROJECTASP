using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Karyawan_Beli_Penjualan : System.Web.UI.Page
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
            SetInitialRow();
          
        }
    }


    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectBeli_Supplier]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDSupplier", DDLSupplier.SelectedValue);

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
        DDLSupplier.Enabled = false;
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
        if (e.CommandName == "cmEdit")
        {
            string Name = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            string stok = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            string satuan = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[5].Text;
            string jumlah = ((TextBox)gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].FindControl("txtJumlahBeli")).Text;
            string harga = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            string IDObat = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;

            if (jumlah=="")
            {
                Response.Write("<script>alert('Tambahkan stok');</script>");
            }
            else
            {
                    int rowIndex = 0;
                    if (ViewState["currentTable"] != null)
                    {
                        DataTable dtr = (DataTable)ViewState["currentTable"];
                        DataRow drr = null;
                        if (dtr.Rows.Count > 0)
                        {
                            for (int i = 1; i <= dtr.Rows.Count; i++)
                            {
                                Label box1 = (Label)grdKeranjang.Rows[rowIndex].Cells[1].FindControl("namaObat");
                                Label box2 = (Label)grdKeranjang.Rows[rowIndex].Cells[2].FindControl("Satuan");
                                Label box3 = (Label)grdKeranjang.Rows[rowIndex].Cells[3].FindControl("jumlah");
                                Label box4 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("Harga");
                                Label box5 = (Label)grdKeranjang.Rows[rowIndex].Cells[5].FindControl("IDObat");

                                drr = dtr.NewRow();

                                dtr.Rows[i - 1]["namaObat"] = box1.Text;
                                dtr.Rows[i - 1]["Satuan"] = box2.Text;
                                dtr.Rows[i - 1]["jumlah"] = box3.Text;
                                dtr.Rows[i - 1]["Harga"] = box4.Text;
                                dtr.Rows[i - 1]["IDObat"] = box5.Text;

                                rowIndex++;
                            }
                            dtr.Rows.Add(drr);
                            //ViewState["currentTable"] = dtr;

                            grdKeranjang.DataSource = dtr;
                            grdKeranjang.DataBind();
                        }
                        else
                        {

                        }
                    }

                    rowIndex = 0;
                    if (ViewState["currentTable"] != null)
                    {
                        DataTable dt = (DataTable)ViewState["currentTable"];
                        DataTable dt2 = (DataTable)ViewState["currentTable2"];
                        DataRow dr2 = null;
                        int row = dt.Rows.Count;
                        double valuefinal = 0;
                        if (row > 0)
                        {
                            for (int i = 0; i < row; i++)
                            {
                                Label box1 = (Label)grdKeranjang.Rows[rowIndex].Cells[1].FindControl("namaObat");
                                Label box2 = (Label)grdKeranjang.Rows[rowIndex].Cells[2].FindControl("Satuan");
                                Label box3 = (Label)grdKeranjang.Rows[rowIndex].Cells[3].FindControl("jumlah");
                                Label box4 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("Harga");
                                Label box5 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("IDObat");

                                if (i == row - 2)
                                {
                                    String id = gridObat.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                                    lblID.Text = id;

                                    double hargatot = Convert.ToDouble(harga) * Convert.ToDouble(jumlah);

                                    box1.Text = Name;
                                    box2.Text = satuan;
                                    box3.Text = jumlah.ToString();
                                    box4.Text = Convert.ToString(hargatot);
                                    box5.Text = IDObat;
                                    valuefinal += hargatot;

                                    dr2 = dt2.NewRow();
                                    dt2.Rows[i]["namaObat"] = box1.Text;
                                    dt2.Rows[i]["Satuan"] = box2.Text;
                                    dt2.Rows[i]["jumlah"] = box3.Text;
                                    dt2.Rows[i]["Harga"] = box4.Text;
                                    dt2.Rows[i]["IDObat"] = box5.Text;
                                    dt2.Rows.Add(dr2);
                                    ViewState["currentTable2"] = dt2;

                                    lblJumlahPembelian.Text = "TOTAL PEMBAYARAN RP " + valuefinal; //Convert.ToString(valuefinal);
                                    txtHarga.Text = Convert.ToString(valuefinal);
                                }
                                else if (i == row - 1)
                                {
                                    box1.Text = dt.Rows[i]["namaObat"].ToString();
                                    box2.Text = dt.Rows[i]["Satuan"].ToString();
                                    box3.Text = dt.Rows[i]["jumlah"].ToString();
                                    box4.Text = dt.Rows[i]["Harga"].ToString();
                                    box5.Text = dt.Rows[i]["IDObat"].ToString();
                                }
                                else
                                {
                                    box1.Text = dt.Rows[i]["namaObat"].ToString();
                                    box2.Text = dt.Rows[i]["Satuan"].ToString();
                                    box3.Text = dt.Rows[i]["jumlah"].ToString();
                                    box4.Text = dt.Rows[i]["Harga"].ToString();
                                    box5.Text = dt.Rows[i]["IDObat"].ToString();

                                    valuefinal += Convert.ToDouble(box4.Text);
                                }
                                rowIndex++;
                            }
                        }
                }
            }
        }
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
    }

    protected string generateIDPembelian()
    {
        string IDPembelian = DateTime.Now.ToString("yyyyMMddhhmmss");
        string strID = "PB" + IDPembelian;
        return strID;
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

    protected void btnProses_Click(object sender, EventArgs e)
    {
        double txtKembaliDuit = Convert.ToDouble(txtBayar.Text) - Convert.ToDouble(txtHarga.Text); ;

        if (txtKembaliDuit < 0)
        {
            Response.Write("<script>alert('Uang Anda Tidak Mencukupi');</script>");
        }
        else
        { 
        string strIDPembelian = generateIDPembelian();
        DateTime tanggal = DateTime.Now;
        SqlCommand insert = new SqlCommand("sp_InputPembelian", conn);
        insert.CommandType = CommandType.StoredProcedure;

        insert.Parameters.AddWithValue("@IDPembelian", strIDPembelian);
        insert.Parameters.AddWithValue("@tanggal", tanggal);
        insert.Parameters.AddWithValue("@IDKaryawan", Session["creaby"]);
        insert.Parameters.AddWithValue("@IDSupplier", DDLSupplier.SelectedValue);
        insert.Parameters.AddWithValue("@totalbayar", txtHarga.Text);

        conn.Open();
        insert.ExecuteNonQuery();
        conn.Close();

        DataTable dt = (DataTable)ViewState["currentTable2"];
        int row = dt.Rows.Count;
        for (int i = 0; i < row - 1; i++)
        {
            SqlCommand ins = new SqlCommand("sp_Inputdetailpembelian", conn);
            ins.CommandType = CommandType.StoredProcedure;

            string coba2 = dt.Rows[i]["jumlah"].ToString();
            string coba = dt.Rows[i]["IDObat"].ToString();

            ins.Parameters.AddWithValue("IDPembelian", strIDPembelian);
            ins.Parameters.AddWithValue("jumlah", dt.Rows[i]["jumlah"]);
            ins.Parameters.AddWithValue("subTotal", dt.Rows[i]["Harga"]);
            ins.Parameters.AddWithValue("IDObat", dt.Rows[i]["IDObat"]);
            conn.Open();
            ins.ExecuteNonQuery();
            conn.Close();
        }
        AddNewRowTogrid();

        Response.Write("<script>alert('Pembelian Di proses');</script>");
        Response.Redirect("Beli_Penjualan.aspx");
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

        DDLSupplier.Enabled = false;
    }

    private void SetInitialRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;

        dt.Columns.Add("namaObat");
        dt.Columns.Add("Satuan");
        dt.Columns.Add("jumlah");
        dt.Columns.Add("Harga");
        dt.Columns.Add("IDObat");


        dr = dt.NewRow();

        dr["namaObat"] = string.Empty;
        dr["Satuan"] = string.Empty;
        dr["jumlah"] = string.Empty;
        dr["Harga"] = string.Empty;
        dr["IDObat"] = string.Empty;


        dt.Rows.Add(dr);

        ViewState["currentTable"] = dt;
        ViewState["currentTable2"] = dt;
        grdKeranjang.DataSource = dt;
        grdKeranjang.DataBind();
    }

    private void AddNewRowTogrid()
    {
        int rowIndex = 0;
        if (ViewState["currentTable"] != null)
        {
            DataTable dtr = (DataTable)ViewState["currentTable"];
            DataRow drr = null;
            if (dtr.Rows.Count > 0)
            {
                for (int i = 1; i <= dtr.Rows.Count; i++)
                {
                    Label box1 = (Label)grdKeranjang.Rows[rowIndex].Cells[1].FindControl("namaObat");
                    Label box2 = (Label)grdKeranjang.Rows[rowIndex].Cells[2].FindControl("Satuan");
                    Label box3 = (Label)grdKeranjang.Rows[rowIndex].Cells[3].FindControl("jumlah");
                    Label box4 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("Harga");
                    Label box5 = (Label)grdKeranjang.Rows[rowIndex].Cells[5].FindControl("IDObat");

                    drr = dtr.NewRow();

                    dtr.Rows[i - 1]["namaObat"] = box1.Text;
                    dtr.Rows[i - 1]["Satuan"] = box2.Text;
                    dtr.Rows[i - 1]["jumlah"] = box3.Text;
                    dtr.Rows[i - 1]["Harga"] = box4.Text;
                    dtr.Rows[i - 1]["IDObat"] = box5.Text;

                    rowIndex++;
                }
                dtr.Rows.Add(drr);
                ViewState["currentTable"] = dtr;

                grdKeranjang.DataSource = dtr;
                grdKeranjang.DataBind();
            }
            else
            {

            }
        }
    }
}