using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_User : System.Web.UI.Page
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
        com.CommandText = "sp_SelectUser";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Nama", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridUser.DataSource = ds;
        gridUser.DataBind();
        return ds;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime CreateDate = DateTime.Now;
        DateTime tglLahir = Convert.ToDateTime(txtTanggal.Text);
        

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InputUser";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Nama", txtNama.Text);
        com.Parameters.AddWithValue("@Alamat",txtadds.Text);
        com.Parameters.AddWithValue("@NoTelp",txtNotelp.Text);
        com.Parameters.AddWithValue("@TglLahir", tglLahir);
        com.Parameters.AddWithValue("@Email", txtEmail.Text);
        com.Parameters.AddWithValue("@status",1);
        com.Parameters.AddWithValue("@username", txtUsername.Text);
        com.Parameters.AddWithValue("@password", txtPass.Text);
        com.Parameters.AddWithValue("@createDate", CreateDate);
        com.Parameters.AddWithValue("@createBy", Session["creaby"]);
        com.Parameters.AddWithValue("@IDROle", ddlRole.SelectedValue);
        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
    }

    protected void EditbtnSave_Click(object sender, EventArgs e)
    {
        DateTime CreateDate = DateTime.Now;
        DateTime ModifiedDate = DateTime.Now;
        DateTime tglLahir = Convert.ToDateTime(txtTanggalE.Text);

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_UpdateUser";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDUser",lblID.Text);
        com.Parameters.AddWithValue("@Nama", txtNamaE.Text);
        com.Parameters.AddWithValue("@Alamat", txtAlamatE.Text);
        com.Parameters.AddWithValue("@NoTelp", txtNoTelpE.Text);
        com.Parameters.AddWithValue("@TglLahir", txtTanggalE.Text);
        com.Parameters.AddWithValue("@Email", txtEmailE.Text);
        com.Parameters.AddWithValue("@status", 1);
        com.Parameters.AddWithValue("@username", txtUsernameE.Text);
        com.Parameters.AddWithValue("@password", txtPasswordE.Text);
        com.Parameters.AddWithValue("@ModifiedDate", ModifiedDate);
        com.Parameters.AddWithValue("@ModifiedBy",Session["creaby"]);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();

        secView.Visible = true;
        secEdit.Visible = false;
        secAdd.Visible = false;
    }

    protected void EditbtnCancel_Click(object sender, EventArgs e)
    {
       
    }

    protected void btntambah_Click(object sender, EventArgs e)
    {
        secAdd.Visible = true;
        secEdit.Visible = false;
        secView.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void gridUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridUser.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow rw in gridUser.Rows)
        {
            Button btn = rw.FindControl("btnActive") as Button;
            if (btn.Text == "Activate")
            {
                btn.Text = "DeActivate";
            }
            else { btn.Text = "Activate"; }
        }
    }

    protected void gridUser_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void gridUser_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridUser.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            txtNamaE.Text = gridUser.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtAlamatE.Text = gridUser.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            txtNoTelpE.Text = gridUser.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            txtTanggalE.Text = gridUser.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
            txtEmailE.Text = gridUser.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[5].Text;
            txtUsernameE.Text = gridUser.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            txtPasswordE.Text = gridUser.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;

            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
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

    private void sortGridView(string sortExpression, string direction)
    {
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridUser.DataSource = dv;
        gridUser.DataBind();
    }


    protected void ddlStatusView_TextChanged(object sender, EventArgs e)
    {
        if (ddlStatusView.Text.Equals("2"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectUserAll]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Nama", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridUser.DataSource = ds;
            gridUser.DataBind();
        }
        else if (ddlStatusView.Text.Equals("1"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectUserAktif]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Nama", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridUser.DataSource = ds;
            gridUser.DataBind();
        }
        else if (ddlStatusView.Text.Equals("0"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectUserNA]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Nama", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridUser.DataSource = ds;
            gridUser.DataBind();
        }
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        //Hide the modal popup extender
        GridViewDetails.Hide();
    }

    protected void lnkViewDetails_Click(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        Nama.Text = row.Cells[1].Text;
        CreateBy.Text = row.Cells[9].Text;
        CreateDate.Text = row.Cells[10].Text;
        ModifiedBy.Text = row.Cells[11].Text;
        ModifiedDate.Text = row.Cells[12].Text;
        //Show the modal popup extender
        GridViewDetails.Show();
    }

    protected void gridUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        var linkDelete = (LinkButton)e.Row.FindControl("linkDelete");
        var linkAktif = (LinkButton)e.Row.FindControl("linkAktif");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TableCell statusCell = e.Row.Cells[8];
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

    protected void gridUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = gridUser.Rows[e.RowIndex].Cells[8];
        string cells = cell.Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        int id = Convert.ToInt32(gridUser.DataKeys[e.RowIndex].Value.ToString());
        com.CommandText = "sp_DeleteUser";


        com.Parameters.AddWithValue("@IDUser",id);
        com.Parameters.AddWithValue("@status", cells);
        com.CommandType = CommandType.StoredProcedure;

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        if (result > 0)
        {
            gridUser.EditIndex = -1;
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
}