﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Supplier : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Apotek"].ConnectionString);
    DataSet ds = new DataSet();
    private const string ASCENDING = " ASC";
    private const string DESCENDING = " DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadData();
            ViewMenu.Visible = true;
            EditMenu.Visible = false;
            AddMenu.Visible = false;
            
            txtTanggal.Text = DateTime.Now.ToString("dd-MM-yyyy");
            txtTanggal.Enabled = false;
           
           
        }
    }

    protected void grdMenu_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "sp_SearchSupplier";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@NamaSupplier", txtSearch.Text);
        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        grdMenu.DataSource = ds;
        grdMenu.DataBind();
        return ds;
    }

    protected void grdMenu_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdMenu.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void grdMenu_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Ubah")
        {
            String id = grdMenu.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblIdEdit.Text = id;
            txtNamaE.Text = grdMenu.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtAlamatE.Text = grdMenu.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            txtEmailE.Text = grdMenu.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            txtNoTelpE.Text = grdMenu.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
            //txtTanggalE.Text = grdMenu.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[8].Text;
            //txtTanggalME.Text = DateTime.Now.ToString("dd-MM-yyyy");
            //string status = grdMenu.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            //if (status.Equals(0))
            //{
            //    rbAktif.Checked = true;

            //}
            //else
            //{
            //    rbTidak.Checked = true;
            //}
            AddMenu.Visible = false;
            EditMenu.Visible = true;
            ViewMenu.Visible = false;
        }
        else if (e.CommandName == "Hapus")
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "[sp_HapusSupplier]";
            com.CommandType = CommandType.StoredProcedure;
            string id = grdMenu.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            com.Parameters.AddWithValue("@IDSupplier", id);
            com.Parameters.AddWithValue("@ModifiedBy", 1);
            con.Open();
            int result = Convert.ToInt32(com.ExecuteNonQuery());
            con.Close();
            loadData();
            ViewMenu.Visible = true;
            EditMenu.Visible = false;
            AddMenu.Visible = false;
        }
    }

    protected void grdMenu_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;

        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            SortGridView(sortExpression, DESCENDING);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            SortGridView(sortExpression, ASCENDING);
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
        set { ViewState["sortDirection"] = value; }
    }

    public void SortGridView(string sortExpression, string direction)
    {
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        grdMenu.DataSource = dv;
        grdMenu.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "[sp_SearchSupplier]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@NamaSupplier", txtSearch.Text);
        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        grdMenu.DataSource = ds;
        grdMenu.DataBind();
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string uname = txtNamaSupplier.Text.ToUpper();
        SqlDataAdapter dataAdapter = new SqlDataAdapter();
        System.Data.SqlClient.SqlParameter param;
        int nilai = 1;

        try
        {
            // insert command
            SqlCommand insertCmd = new SqlCommand("[sp_InputSupplier]", con);
            insertCmd.CommandType = CommandType.StoredProcedure;



            param = insertCmd.Parameters.Add("@NamaSupplier", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = uname;

            param = insertCmd.Parameters.Add("@AlamatSupplier", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = txtAlamat.Text;


            param = insertCmd.Parameters.Add("@Email", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = txtEmail.Text;

            param = insertCmd.Parameters.Add("@NoHp", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = txtPhoneInsert.Text;

            param = insertCmd.Parameters.Add("@Status", SqlDbType.Int);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToInt16(nilai);

            param = insertCmd.Parameters.Add("@CreateBy", SqlDbType.Int);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToInt16(nilai);
            // masih diakalin, karena belum buat login


            param = insertCmd.Parameters.Add("@CreateDate", SqlDbType.Date);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToDateTime(txtTanggal.Text);

            param = insertCmd.Parameters.Add("@ModifiedBy", SqlDbType.Int);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToInt16(nilai);

            param = insertCmd.Parameters.Add("@ModifiedDate", SqlDbType.Date);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToDateTime(txtTanggal.Text);
            con.Open();

            insertCmd.ExecuteNonQuery();

            Response.Write("<script>alert('Data Added!')</script>");
            con.Close();
            Server.Transfer("Supplier.aspx");

        }
        catch
        {
            con.Close();
            Response.Write("<script>alert('Data gagal Disimpan!')</script>");
            Server.Transfer("Supplier.aspx");
        }
    
    }

    protected void btnCancelAdd_Click(object sender, EventArgs e)
    {

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        int nilai = 1;
        int status = 1;
       
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "[sp_UpdateSupplier]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDSupplier", lblIdEdit.Text);
        com.Parameters.AddWithValue("@NamaSupplier", txtNamaE.Text);
        com.Parameters.AddWithValue("@AlamatSupplier", txtAlamatE.Text);
        com.Parameters.AddWithValue("@Email", txtEmailE.Text);
        com.Parameters.AddWithValue("@NoHp", txtNoTelpE.Text);
        com.Parameters.AddWithValue("@Status",status);
        com.Parameters.AddWithValue("@ModifiedBy",nilai);
        com.Parameters.AddWithValue("@ModifiedDate", Convert.ToDateTime(DateTime.Now));
        con.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        con.Close();
        loadData();
        EditMenu.Visible = false;
        AddMenu.Visible = false;
        ViewMenu.Visible = true;

    }

    protected void btnCancelEdit_Click(object sender, EventArgs e)
    {

    }

    protected void btnTambah_Click1(object sender, EventArgs e)
    {
        AddMenu.Visible = true;
        ViewMenu.Visible = false;
        EditMenu.Visible = false;
    }
}