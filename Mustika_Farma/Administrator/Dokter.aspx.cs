using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Dokter : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            EditFotoView.Visible = false;
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
        com.CommandText = "sp_SelectDokter";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nama", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridDokter.DataSource = ds;
        gridDokter.DataBind();
        return ds;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string filename = Guid.NewGuid() + System.IO.Path.GetFileName(uploadfile.FileName).Substring(System.IO.Path.GetFileName(uploadfile.FileName).Length - 4);
        uploadfile.SaveAs(Server.MapPath("Dokter/") + filename);

        DateTime CreateDate = DateTime.Now;
        string password ="MUSTIKA2019";
        DateTime ModifiedDate = DateTime.Now;


        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_InputDokter]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@NIP", txtNIP.Text);
        com.Parameters.AddWithValue("@nama", txtNama.Text);
        com.Parameters.AddWithValue("@jenis_Kelamin", rbGender.SelectedValue);
        com.Parameters.AddWithValue("@alamat", txtAlamat.Text);
        com.Parameters.AddWithValue("@username", txtUname.Text);
        com.Parameters.AddWithValue("@password",password);
        com.Parameters.AddWithValue("@status", 1);
        com.Parameters.AddWithValue("@email", txtEmail.Text);
        com.Parameters.AddWithValue("@ID_SP", ddlJenis.SelectedValue);
        com.Parameters.AddWithValue("@foto", "Dokter/" + filename);
        com.Parameters.AddWithValue("@CreateDate", CreateDate);
        com.Parameters.AddWithValue("@CreateBy", Session["creaby"]);
        com.Parameters.AddWithValue("@ID_Jadwal", ddlJadwal.SelectedValue);
    
        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        loadData();

        secView.Visible = true;
        secEdit.Visible = false;
        secAdd.Visible = false;
    }

    protected void EditbtnSave_Click(object sender, EventArgs e)
    {
       
        DateTime ModifiedDate = DateTime.Now;
        if (EditFotoView.Visible == true)
        {
            string filename = Guid.NewGuid() + System.IO.Path.GetFileName(editUploadFile.FileName).Substring(System.IO.Path.GetFileName(editUploadFile.FileName).Length - 4);
            editUploadFile.SaveAs(Server.MapPath("Dokter/") + filename);

            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_UpdateDokter]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ID_Dokter", lblID.Text);
            com.Parameters.AddWithValue("@NIP", txtNIPE.Text);
            com.Parameters.AddWithValue("@nama", txtNamaE.Text);
            com.Parameters.AddWithValue("@jenis_Kelamin", rbGender.SelectedValue);
            com.Parameters.AddWithValue("@alamat", txtAlamatE.Text);
            com.Parameters.AddWithValue("@username", txtUnameE.Text);
            com.Parameters.AddWithValue("@password", txtPassE.Text);
            com.Parameters.AddWithValue("@status", 1);
            com.Parameters.AddWithValue("@email", txtEmailE.Text);
            com.Parameters.AddWithValue("@ID_SP", ddlJenisE.SelectedValue);
            com.Parameters.AddWithValue("@foto", "Dokter/" + filename);
            com.Parameters.AddWithValue("@modifiedDate", ModifiedDate);
            com.Parameters.AddWithValue("@modifiedBy", Session["creaby"]);
            com.Parameters.AddWithValue("@ID_Jadwal", ddlJadwalE.SelectedValue);

            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            if (result != 1)
            {

            }
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
        }
        else if (EditFotoView.Visible == false)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_UpdateDokter]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ID_Dokter", lblID.Text);
            com.Parameters.AddWithValue("@NIP", txtNIPE.Text);
            com.Parameters.AddWithValue("@nama", txtNamaE.Text);
            com.Parameters.AddWithValue("@jenis_Kelamin", rbGender.SelectedValue);
            com.Parameters.AddWithValue("@alamat", txtAlamatE.Text);
            com.Parameters.AddWithValue("@username", txtUnameE.Text);
            com.Parameters.AddWithValue("@password", txtPassE.Text);
            com.Parameters.AddWithValue("@status", 1);
            com.Parameters.AddWithValue("@email", txtEmailE.Text);
            com.Parameters.AddWithValue("@ID_SP", ddlJenisE.SelectedValue);
            com.Parameters.AddWithValue("@foto", "NULL");
            com.Parameters.AddWithValue("@modifiedDate", ModifiedDate);
            com.Parameters.AddWithValue("@modifiedBy", Session["creaby"]);
            com.Parameters.AddWithValue("@ID_Jadwal", ddlJadwalE.SelectedValue);

            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            if (result != 1)
            {

            }
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
        }
   }

    protected void EditbtnCancel_Click(object sender, EventArgs e)
    {
        secView.Visible = true;
        secEdit.Visible = false;
        secAdd.Visible = false;
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

    protected void gridDokter_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridDokter.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridDokter_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {

            String id = gridDokter.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            txtNIPE.Text = gridDokter.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtNamaE.Text = gridDokter.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;

            editfoto.ImageUrl = gridDokter.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[14].Text;
            txtAlamatE.Text = gridDokter.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
            txtEmailE.Text = gridDokter.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[5].Text;
            txtUnameE.Text = gridDokter.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;
            txtPassE.Text = gridDokter.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[8].Text;
            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
        }
    }

    protected void gridDokter_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void gridDokter_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow rw in gridDokter.Rows)
        {
            Button btn = rw.FindControl("btnActive") as Button;
            if (btn.Text == "Activate")
            {
                btn.Text = "DeActivate";
            }
            else { btn.Text = "Activate"; }
        }
    }

    private void sortGridView(string sortExpression, string direction)
    {
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridDokter.DataSource = dv;
        gridDokter.DataBind();
    }
    protected void gridDokter_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        var linkDelete = (LinkButton)e.Row.FindControl("linkDelete");
        var linkAktif = (LinkButton)e.Row.FindControl("linkAktif");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TableCell statusCell = e.Row.Cells[9];
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

    protected void gridDokter_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = gridDokter.Rows[e.RowIndex].Cells[9];
        string cells = cell.Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        int id = Convert.ToInt32(gridDokter.DataKeys[e.RowIndex].Value.ToString());
        com.CommandText = "sp_DeleteDokter";


        com.Parameters.AddWithValue("@IDDokter", id);
        com.Parameters.AddWithValue("@status", cells);
        com.CommandType = CommandType.StoredProcedure;

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        if (result > 0)
        {
            gridDokter.EditIndex = -1;
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

    protected void ddlStatusView_TextChanged(object sender, EventArgs e)
    {
        if (ddlStatusView.Text.Equals("2"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectDokter]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nama", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridDokter.DataSource = ds;
            gridDokter.DataBind();
        }
        else if (ddlStatusView.Text.Equals("1"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectDokterAktif]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nama", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridDokter.DataSource = ds;
            gridDokter.DataBind();
        }
        else if (ddlStatusView.Text.Equals("0"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectDokterNA]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@nama", txtSearch.Text);
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridDokter.DataSource = ds;
            gridDokter.DataBind();
        }
    }

    protected void lnkViewDetails_Click(object sender, EventArgs e)
    {
        //Grab the selected row
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        nama.Text = row.Cells[2].Text;
        jenis_Kelamin.Text = row.Cells[3].Text;
        username.Text= row.Cells[7].Text;
        password.Text= row.Cells[8].Text;
        ModifiedBy.Text = row.Cells[12].Text;
        ModifiedDate.Text = row.Cells[13].Text;


        //Show the modal popup extender
        GridViewDetails.Show();
    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        GridViewDetails.Hide();
    }

    protected void dsJenisE_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void btnUbahFoto_Click(object sender, EventArgs e)
    {
        EditFotoView.Visible = true;
    }
}