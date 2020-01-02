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
        DataTable dt = new DataTable();
        dt.Columns.Add("namaObat");
        dt.Columns.Add("Satuan");
        dt.Columns.Add("jumlah");
        dt.Columns.Add("harga");

        foreach (GridViewRow grow in gridObat.Rows)
        {
            var checkboxselect = grow.FindControl("CheckBox1") as CheckBox;
            if (checkboxselect.Checked)
            {
                string Name = (grow.FindControl("labNama") as Label).Text;
                string satuan = (grow.FindControl("labSat") as Label).Text;
                string jumlah = (grow.FindControl("jumlahBeli") as TextBox).Text;
                string harga = (grow.FindControl("harga") as TextBox).Text;

                int hargatot = Convert.ToInt16(harga) * Convert.ToInt16(jumlah);

                dt.Rows.Add(Name,satuan, jumlah, hargatot);
            }

            grdKeranjang.DataSource = dt;
            grdKeranjang.DataBind();
           

        }
        Response.Write("<script>alert('Data berhasil dimasukkan kekeranjang');</script>");
    }

    protected void jumlahBeli_TextChanged(object sender, EventArgs e)
    {

    }

    protected void gridObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridObat.PageIndex = e.NewPageIndex;
        loadData();
    }
}