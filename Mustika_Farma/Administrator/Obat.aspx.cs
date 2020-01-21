using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Administrator_Obat : System.Web.UI.Page
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
        com.CommandText = "sp_Selectobat";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaObat", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridObat.DataSource = ds;
        gridObat.DataBind();
        return ds;
    }

    protected void btnSave_Click1(object sender, EventArgs e)
    {
        try
        {
            string filename = Guid.NewGuid() + System.IO.Path.GetFileName(uploadfile.FileName).Substring(System.IO.Path.GetFileName(uploadfile.FileName).Length - 4);
            uploadfile.SaveAs(Server.MapPath("obat_obat/") + filename);

            DateTime CreateDate = DateTime.Now;
            DateTime expired = Convert.ToDateTime(txtExpired.Text);
            int CreateBy = 1;

            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "sp_InputObat";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaObat", txtnamaObat.Text);
            com.Parameters.AddWithValue("@IDJenis", DDLJenisObat.SelectedValue);
            com.Parameters.AddWithValue("@JumlahObat", Convert.ToInt16(0));
            com.Parameters.AddWithValue("@Keterangan", txtKet.Text);
            com.Parameters.AddWithValue("@IDLokasi", DDLLokasi.SelectedValue);
            com.Parameters.AddWithValue("@Satuan", ddlSatuan.SelectedValue);
            com.Parameters.AddWithValue("@Harga", Convert.ToDecimal(txtHarga.Text));
            com.Parameters.AddWithValue("@Expired", expired);
            com.Parameters.AddWithValue("@foto", "obat_obat/" + filename);
            com.Parameters.AddWithValue("@createDate", CreateDate);
            com.Parameters.AddWithValue("@createBy", CreateBy);
            com.Parameters.AddWithValue("@IDSupplier", ddlSupplier.SelectedValue);


            conn.Open();
            int result = Convert.ToInt32(com.ExecuteNonQuery());
            conn.Close();
            Response.Redirect("Obat.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Data Gagal Ditambahkan');</script>");
        }


    }

    protected void btntambah_Click(object sender, EventArgs e)
    {
        secAdd.Visible = true;
        secEdit.Visible = false;
        secView.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        loadData();
    }

    protected void gridObat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
        if (e.CommandName == "cmEdit")
        {
            String id = gridObat.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            txtNamaObatE.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            ddlJenisObatE.SelectedValue = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[18].Text;
            txtJumlahE.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            txtKetE.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
            ddlSatuanE.SelectedValue = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            txtHargaEdit.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[19].Text;


            DateTime exp = Convert.ToDateTime(gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[8].Text);
            txtExpiredE.Text = exp.ToString("yyyy-MM-dd");

            editfoto.ImageUrl = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[17].Text;

            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
        }
      
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

    private void sortGridView(string sortExpression, string direction)
    {
        DataTable dt = loadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridObat.DataSource = dv;
        gridObat.DataBind();
    }


    protected void gridObat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridObat.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void EditbtnCancel_Click(object sender, EventArgs e)
    {
        secView.Visible = true;
        secEdit.Visible = false;
        secAdd.Visible = false;
    }

    protected void EditbtnSave_Click1(object sender, EventArgs e)
    {
       // EditFotoView.Visible = false;
        DateTime CreateDate = DateTime.Now;
        DateTime expired = Convert.ToDateTime(txtExpiredE.Text);
        DateTime ModifiedDate = DateTime.Now;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        if (EditFotoView.Visible == true)
        {
            string filename = Guid.NewGuid() + System.IO.Path.GetFileName(editUploadFile.FileName).Substring(System.IO.Path.GetFileName(editUploadFile.FileName).Length - 4);
            editUploadFile.SaveAs(Server.MapPath("obat_obat/") + filename);

            com.CommandText = "[sp_UpdateObat]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IDObat", lblID.Text);
            com.Parameters.AddWithValue("@namaObat", txtNamaObatE.Text);
            com.Parameters.AddWithValue("@IDJenis", ddlJenisObatE.SelectedValue);
            com.Parameters.AddWithValue("@Keterangan", txtKetE.Text);
            com.Parameters.AddWithValue("@IDLokasi", ddlLokasiE.SelectedValue);
            com.Parameters.AddWithValue("@Satuan", ddlSatuanE.SelectedValue);

            com.Parameters.AddWithValue("@Harga", txtHargaEdit.Text);
            com.Parameters.AddWithValue("@Status", 1);
            com.Parameters.AddWithValue("@JumlahObat", txtJumlahE.Text);
            com.Parameters.AddWithValue("@Expired", expired);
            com.Parameters.AddWithValue("@foto", "obat_obat/" + filename);
            com.Parameters.AddWithValue("@ModifiedDate", ModifiedDate);
            com.Parameters.AddWithValue("@ModifiedBy", 1);

            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
        }
        else if (EditFotoView.Visible == false)
        {
            com.CommandText = "[sp_UpdateObat]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IDObat", lblID.Text);
            com.Parameters.AddWithValue("@namaObat", txtNamaObatE.Text);
            com.Parameters.AddWithValue("@IDJenis", ddlJenisObatE.SelectedValue);
            com.Parameters.AddWithValue("@Keterangan", txtKetE.Text);
            com.Parameters.AddWithValue("@IDLokasi", ddlLokasiE.SelectedValue);
            com.Parameters.AddWithValue("@Satuan", ddlSatuanE.SelectedValue);
            com.Parameters.AddWithValue("@Harga", Convert.ToDecimal(txtHargaEdit.Text));
            com.Parameters.AddWithValue("@Status", 1);
            com.Parameters.AddWithValue("@JumlahObat", txtJumlahE.Text);
            com.Parameters.AddWithValue("@Expired", expired);
            com.Parameters.AddWithValue("@foto", "NULL");
            com.Parameters.AddWithValue("@ModifiedDate", ModifiedDate);
            com.Parameters.AddWithValue("@ModifiedBy", 1);

            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
        }
        
    }

    protected void ddlStatusView_TextChanged(object sender, EventArgs e)
    {
        if (ddlStatusView.Text.Equals("2"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_Selectobat]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaObat", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridObat.DataSource = ds;
            gridObat.DataBind();
        }
        else if (ddlStatusView.Text.Equals("1"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectObatAktif]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaObat", txtSearch.Text);


            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridObat.DataSource = ds;
            gridObat.DataBind();
        }
        else if (ddlStatusView.Text.Equals("0"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectObatNA]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@namaObat", txtSearch.Text);

            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridObat.DataSource = ds;
            gridObat.DataBind();
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
        Keterangan.Text = row.Cells[4].Text;
        namaObat.Text = row.Cells[1].Text;
        CreateBy.Text = row.Cells[12].Text;
        CreateDate.Text = row.Cells[13].Text;
        ModifiedBy.Text = row.Cells[14].Text;
        ModifiedDate.Text = row.Cells[15].Text;
        Expired.Text = row.Cells[8].Text;

        //Show the modal popup extender
        GridViewDetails.Show();
    }

    protected void gridObat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = gridObat.Rows[e.RowIndex].Cells[16];
        string cells = cell.Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        int id = Convert.ToInt32(gridObat.DataKeys[e.RowIndex].Value.ToString());
        com.CommandText = "sp_DeleteObat";


        com.Parameters.AddWithValue("@IDObat", id);
        com.Parameters.AddWithValue("@status", cells);
        com.CommandType = CommandType.StoredProcedure;

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        if (result > 0)
        {
            gridObat.EditIndex = -1;
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

    protected void gridObat_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        var linkDelete = (LinkButton)e.Row.FindControl("linkDelete");
        var linkAktif = (LinkButton)e.Row.FindControl("linkAktif");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TableCell statusCell = e.Row.Cells[16];
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

    protected void btnUbahFoto_Click(object sender, EventArgs e)
    {
        EditFotoView.Visible = true;
    }
}