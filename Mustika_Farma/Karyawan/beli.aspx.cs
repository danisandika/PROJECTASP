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
            adaResep.Visible = true;
           
        }
    }

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_Selectobat";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaObat", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridObat.DataSource = ds;
        gridObat.DataBind();
        Keranjang.DataSource = ds;
        Keranjang.DataBind();
        return ds;
    }
    protected void Keranjang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void Keranjang_SelectedIndexChanged(object sender, EventArgs e)
    {

       
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

    }

    protected void btnSearch_Click1(object sender, EventArgs e)
    {

    }




    protected void gridObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void gridObat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridObat_Sorting1(object sender, GridViewSortEventArgs e)
    {

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
        
        if (rbResep.SelectedValue == "Ada")
        {
            adaResep.Visible = true;
        }
        else if (rbResep.SelectedValue == "Tidak Ada")
        {
            adaResep.Visible = false;
        }
    }

}