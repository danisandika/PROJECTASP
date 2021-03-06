﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_JenisObat : System.Web.UI.Page
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
            secAdd.Visible = false;
            secEdit.Visible = false;
            secView.Visible = true;
        }
    }

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectJenis";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaJenis", txtSearch.Text);
        com.Parameters.AddWithValue("@deskripsi", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridJenis.DataSource = ds;
        gridJenis.DataBind();
        return ds;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime CreateDate = DateTime.Now;
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InsertJenis";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaJenis", txtnamaJenis.Text);
        com.Parameters.AddWithValue("@deskripsi", txtDeskripsi.Text);
        com.Parameters.AddWithValue("@createDate", CreateDate);
        com.Parameters.AddWithValue("@createBy", Session["creaby"]);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();
        clear();

        secView.Visible = true;
        secEdit.Visible = false;
        secAdd.Visible = false;
    }

    protected void EditbtnSave_Click(object sender, EventArgs e)
    {
        DateTime ModifiedDate = DateTime.Now;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_UpdateJenis";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@idjenis", lblID.Text);
        com.Parameters.AddWithValue("@namaJenis", txtEditnamaJenis.Text);
        com.Parameters.AddWithValue("@deskripsi", txtEditDeskripsi.Text);
        com.Parameters.AddWithValue("@ModifiedDate", ModifiedDate);
        com.Parameters.AddWithValue("@ModifiedBy", Session["creaby"]);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();
        clear();
        secView.Visible = true;
        secEdit.Visible = false;
        secAdd.Visible = false;
        clear();
    }

    protected void gridJenis_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridJenis.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            txtEditnamaJenis.Text = gridJenis.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtEditDeskripsi.Text = gridJenis.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            

            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
        }
       
    }

    protected void gridJenis_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void gridJenis_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridJenis.PageIndex = e.NewPageIndex;
        loadData();
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

        gridJenis.DataSource = dv;
        gridJenis.DataBind();
    }

    protected void gridJenis_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        loadData();
    }

    protected void btntambah_Click(object sender, EventArgs e)
    {
        secAdd.Visible = true;
        secEdit.Visible = false;
        secView.Visible = false;
    }

    protected void EditbtnCancel_Click(object sender, EventArgs e)
    {
        secView.Visible = true;
        secEdit.Visible = false;
        secAdd.Visible = false;
    }

    protected void ddlStatusView_TextChanged(object sender, EventArgs e)
    {
        if (ddlStatusView.Text.Equals("2"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectJenisALL]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaJenis", txtSearch.Text);
            com.Parameters.AddWithValue("@deskripsi", txtSearch.Text);
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridJenis.DataSource = ds;
            gridJenis.DataBind();
        }
        else if (ddlStatusView.Text.Equals("1"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectJenisAktif]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaJenis", txtSearch.Text);
            com.Parameters.AddWithValue("@deskripsi", txtSearch.Text);
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridJenis.DataSource = ds;
            gridJenis.DataBind();
        }
        else if (ddlStatusView.Text.Equals("0"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectJenisNA]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaJenis", txtSearch.Text);
            com.Parameters.AddWithValue("@deskripsi", txtSearch.Text);
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridJenis.DataSource = ds;
            gridJenis.DataBind();
        }
    }

    protected void gridJenis_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = gridJenis.Rows[e.RowIndex].Cells[3];
        string cells = cell.Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        int id = Convert.ToInt32(gridJenis.DataKeys[e.RowIndex].Value.ToString());
        com.CommandText = "sp_DeleteJenis";


        com.Parameters.AddWithValue("@idJenis", id);
        com.Parameters.AddWithValue("@status", cells);
        com.CommandType = CommandType.StoredProcedure;

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        if (result > 0)
        {
            gridJenis.EditIndex = -1;
            loadData();
            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
        }
        else
        {
            loadData();
        }

    }

    protected void gridJenis_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        var linkDelete = (LinkButton)e.Row.FindControl("linkDelete");
        var linkAktif = (LinkButton)e.Row.FindControl("linkAktif");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TableCell statusCell = e.Row.Cells[3];
            if (statusCell.Text == "1")
            {
                linkAktif.Visible = false;
            }
            else if (statusCell.Text == "0")
            {
                linkDelete.Visible = false;
            }
        }
    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        GridViewDetails.Hide();
    }

    protected void lnkViewDetails_Click(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        namaJenis.Text = row.Cells[1].Text;
        CreateBy.Text = row.Cells[4].Text;
        CreateDate.Text = row.Cells[5].Text;
        ModifiedBy.Text = row.Cells[6].Text;
        ModifiedDate.Text = row.Cells[7].Text;

        //Show the modal popup extender
        GridViewDetails.Show();
    }

    private void clear() {
        txtDeskripsi.Text = "";
        txtEditDeskripsi.Text = "";
        txtEditnamaJenis.Text = "";
        txtnamaJenis.Text = "";
        txtEditnamaJenis.Text = "";

    }
}