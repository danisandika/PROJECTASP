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
            string sqlquery = "select IDObat,namaObat,IDJenis,JumlahObat,Satuan,Keterangan from obat";
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

    }
}