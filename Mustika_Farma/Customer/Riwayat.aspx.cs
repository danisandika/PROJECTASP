using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Pembelian : System.Web.UI.Page
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
            secView.Visible = true;
        }
    }

    private DataSet loadData()
    {

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectRiwayatCust]";
        com.CommandType = CommandType.StoredProcedure;
        //masih diakalin
         //com.Parameters.AddWithValue("@nama",Session["creaby"]);
        com.Parameters.AddWithValue("@nama","Danis Andika");

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridRiwayat.DataSource = ds;
        gridRiwayat.DataBind();
        return ds;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        loadData();
    }

    protected void gridRiwayat_RowCommand(object sender, GridViewCommandEventArgs e)
    {

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

    private void sortGridView(string sortExpression, string direction)
    {
        //You can cache the Datatable for improving performance
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridRiwayat.DataSource = dv;
        gridRiwayat.DataBind();
    }
    protected void gridRiwayat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridRiwayat.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridRiwayat_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void gridRiwayat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridRiwayat_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void gridRiwayat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }



    protected void lnkViewDetails_Click(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        nama.Text = row.Cells[5].Text;
        berat.Text = row.Cells[6].Text;
        tinggi.Text = row.Cells[7].Text;
        tensi.Text = row.Cells[8].Text;
        gula.Text = row.Cells[9].Text;
        kolestrol.Text = row.Cells[10].Text;

        //Show the modal popup extender
        GridViewDetails.Show();
    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        GridViewDetails.Hide();
    }
}