using System;
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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
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
            AddMenu.Visible = false;
            EditMenu.Visible = true;
            ViewMenu.Visible = false;
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
            DateTime CreateDate = DateTime.Now;

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "sp_InputSupplier";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@NamaSupplier",uname);
            com.Parameters.AddWithValue("@AlamatSupplier", txtAlamat.Text);
            com.Parameters.AddWithValue("@Email", txtEmail.Text);
            com.Parameters.AddWithValue("@NoHp", txtPhoneInsert.Text);
            com.Parameters.AddWithValue("@Status",1);
            com.Parameters.AddWithValue("@CreateDate", CreateDate);
            com.Parameters.AddWithValue("@createBy", Session["creaby"]);
            com.Parameters.AddWithValue("@ModifiedDate", CreateDate);
            com.Parameters.AddWithValue("@ModifiedBy", Session["creaby"]);

        con.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            con.Close();
            loadData();

            Response.Write("<script>alert('Data Berhasil Ditambahkan!')</script>");
            con.Close();
            Server.Transfer("Supplier.aspx");

        }


    protected void btnEdit_Click(object sender, EventArgs e)
    {
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
        com.Parameters.AddWithValue("@ModifiedBy", Session["creaby"]);
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
        secView.Visible = true;
        AddMenu.Visible = false;
        ViewMenu.Visible = false;
    }

    protected void btnTambah_Click1(object sender, EventArgs e)
    {
        AddMenu.Visible = true;
        ViewMenu.Visible = false;
        EditMenu.Visible = false;
    }

    protected void ddlStatusView_TextChanged(object sender, EventArgs e)
    {
        if (ddlStatusView.Text.Equals("2"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "[sp_SelectSupplierAll]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Nama", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            grdMenu.DataSource = ds;
            grdMenu.DataBind();
        }
        else if (ddlStatusView.Text.Equals("1"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "[sp_SelectSupplierAktif]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Nama", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            grdMenu.DataSource = ds;
            grdMenu.DataBind();
        }
        else if (ddlStatusView.Text.Equals("0"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "[sp_SelectSupplierNA]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Nama", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            grdMenu.DataSource = ds;
            grdMenu.DataBind();
        }
    }

    protected void grdMenu_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = grdMenu.Rows[e.RowIndex].Cells[5];
        string cells = cell.Text;

        SqlCommand com = new SqlCommand();
        com.Connection = con;

        int id = Convert.ToInt32(grdMenu.DataKeys[e.RowIndex].Value.ToString());
        com.CommandText = "[sp_HapusSupplier]";


        com.Parameters.AddWithValue("@IDSupplier", id);
        com.Parameters.AddWithValue("@status", cells);
        com.CommandType = CommandType.StoredProcedure;

        con.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        con.Close();
        if (result > 0)
        {
            grdMenu.EditIndex = -1;
            loadData();
            ViewMenu.Visible = true;
            EditMenu.Visible = false;
            AddMenu.Visible = false;
        }
        else
        {
            loadData();
        }

    }

    protected void grdMenu_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        var linkDelete = (LinkButton)e.Row.FindControl("linkDelete");
        var linkAktif = (LinkButton)e.Row.FindControl("linkAktif");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TableCell statusCell = e.Row.Cells[5];
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

    protected void lnkViewDetails_Click(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel  
        //Change the index as per your need
        Nama.Text = row.Cells[1].Text;
        CreateBy.Text = row.Cells[6].Text;
        CreateDate.Text = row.Cells[7].Text;
        ModifiedBy.Text = row.Cells[8].Text;
        ModifiedDate.Text = row.Cells[9].Text;
        //Show the modal popup extender
        GridViewDetails.Show();
    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        //Hide the modal popup extender
        GridViewDetails.Hide();
    }

    protected void btnCancelEdit_Click1(object sender, EventArgs e)
    {
        ViewMenu.Visible = true;
        EditMenu.Visible = false;
        AddMenu.Visible = false;
    }

    protected void btnCancelAdd_Click(object sender, EventArgs e)
    {
        ViewMenu.Visible = true;
        EditMenu.Visible = false;
        AddMenu.Visible = false;
    }

    protected void grdMenu_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        grdMenu.PageIndex = e.NewPageIndex;
        loadData();
    }
}