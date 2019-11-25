using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Management : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";
    protected void Page_Load(object sender, EventArgs e)
    {
        secAdd.Visible = false;
        secView.Visible = true;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

    }

    protected void btntambah_Click(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void gridManagement_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void gridManagement_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridManagement_Sorting(object sender, GridViewSortEventArgs e)
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

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectManagement";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@tanggalTransaksi", txtSearch.Text);
        com.Parameters.AddWithValue("@Debit", txtSearch.Text);
        //com.Parameters.AddWithValue("@keterangan", txtcari.Text);


        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridManagement.DataSource = ds;
        gridManagement .DataBind();
        return ds;
    }


    private void sortGridView(string sortExpression, string direction)
    {
        //You can cache the Datatable for improving performance
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridManagement.DataSource = dv;
        gridManagement.DataBind();
    }


    protected void gridManagement_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}