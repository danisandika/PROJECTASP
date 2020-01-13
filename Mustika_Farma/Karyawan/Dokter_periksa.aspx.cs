using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_Dokter_periksa : System.Web.UI.Page
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime CreateDate = DateTime.Now;
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_InputRiwayat]";
            com.CommandType = CommandType.StoredProcedure;
            //masih diakal2in
            com.Parameters.AddWithValue("@ID_Dokter",Session["creaby"]);
            com.Parameters.AddWithValue("@IDUser", ddlPasien.SelectedValue);
            com.Parameters.AddWithValue("@berat", txtBerat.Text);
            com.Parameters.AddWithValue("@tinggi", txtTinggi.Text);
            com.Parameters.AddWithValue("@tensi", txtTensi.Text);
            com.Parameters.AddWithValue("@gula", txtGula.Text);
            com.Parameters.AddWithValue("@kolestrol", txtKolestrol.Text);
            com.Parameters.AddWithValue("@pesan", txtPesan.Text);
            com.Parameters.AddWithValue("@penyakit", txtPenyakit.Text);
            com.Parameters.AddWithValue("@tanggal", CreateDate);
            com.Parameters.AddWithValue("@status", 1);

            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
            Response.Write("<script>alert('Data berhasil ditambahkan    ');</script>");

        }
        catch
        {
            Response.Write("<script>alert('Data Gagal Ditambahkan');</script>");

        }

    }

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectRiwayat";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nama", txtSearch.Text);
        //masih diakalin
        com.Parameters.AddWithValue("@dokter", Convert.ToInt32(Session["creaby"]));

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

    protected void gridRiwayat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridRiwayat.PageIndex = e.NewPageIndex;
        loadData();

    }

    protected void gridRiwayat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridRiwayat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridRiwayat.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            txtPenyakitE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            txtBeratE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            txtTinggiE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;
            txtTensiE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[8].Text;
            txtPesanE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            txtGulaE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[9].Text;
            txtKolestrolE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[10].Text;

            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
        }
    }

    protected void gridRiwayat_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void gridRiwayat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = gridRiwayat.Rows[e.RowIndex].Cells[11];
        string cells = cell.Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        int id = Convert.ToInt32(gridRiwayat.DataKeys[e.RowIndex].Value.ToString());
        com.CommandText = "sp_DeleteRiwayat";


        com.Parameters.AddWithValue("@idRiwayat", id);
        com.Parameters.AddWithValue("@status", cells);
        com.CommandType = CommandType.StoredProcedure;

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        if (result > 0)
        {
            gridRiwayat.EditIndex = -1;
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


    protected void gridRiwayat_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        var linkDelete = (LinkButton)e.Row.FindControl("linkDelete");
        var linkAktif = (LinkButton)e.Row.FindControl("linkAktif");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TableCell statusCell = e.Row.Cells[11];
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
        nama.Text = row.Cells[5].Text;
        berat.Text = row.Cells[6].Text;
        tinggi.Text = row.Cells[7].Text;
        tensi.Text = row.Cells[8].Text;
        gula.Text = row.Cells[9].Text;
        kolestrol.Text = row.Cells[10].Text;

        //Show the modal popup extender
        GridViewDetails.Show();
    }

    protected void btntambah_Click(object sender, EventArgs e)
    {
        secAdd.Visible = true;
        secEdit.Visible = false;
        secView.Visible = false;
    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        GridViewDetails.Hide();
    }

    protected void EditbtnSave_Click(object sender, EventArgs e)
    {
        DateTime CreateDate = DateTime.Now;
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_UpdateRiwayat]";
        com.CommandType = CommandType.StoredProcedure;
        //masih diakal2in

        com.Parameters.AddWithValue("@IDRiwayat", lblID.Text);
        com.Parameters.AddWithValue("@ID_Dokter",Session["creaby"]);
        com.Parameters.AddWithValue("@IDUser", ddlNamaPasien.SelectedValue);
        com.Parameters.AddWithValue("@berat", txtBeratE.Text);
        com.Parameters.AddWithValue("@tinggi", txtTinggiE.Text);
        com.Parameters.AddWithValue("@tensi", txtTensiE.Text);
        com.Parameters.AddWithValue("@gula", txtGulaE.Text);
        com.Parameters.AddWithValue("@kolestrol", txtKolestrolE.Text);
        com.Parameters.AddWithValue("@pesan", txtPesanE.Text);
        com.Parameters.AddWithValue("@penyakit", txtPenyakitE.Text);

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
        secView.Visible = true;
        secEdit.Visible = false;
        secAdd.Visible = false;
    }
}
