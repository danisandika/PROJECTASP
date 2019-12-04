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
        string filename = Guid.NewGuid() + System.IO.Path.GetFileName(uploadfile.FileName).Substring(System.IO.Path.GetFileName(uploadfile.FileName).Length - 4);
        uploadfile.SaveAs(Server.MapPath("obat_obat/") + filename);

        DateTime CreateDate = DateTime.Now;
        DateTime expired =Convert.ToDateTime(txtExpired.Text);
        int CreateBy = 1;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InputObat";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaObat", txtnamaObat.Text);
        com.Parameters.AddWithValue("@IDJenis", DDLJenisObat.SelectedValue);
        com.Parameters.AddWithValue("@JumlahObat",Convert.ToInt16(txtJumlah.Text));
        com.Parameters.AddWithValue("@Keterangan", txtKet.Text);
        com.Parameters.AddWithValue("@IDLokasi", DDLLokasi.SelectedValue);
        com.Parameters.AddWithValue("@Satuan", ddlSatuan.SelectedValue);
        com.Parameters.AddWithValue("@Harga", Convert.ToDecimal(txtHarga.Text));
        com.Parameters.AddWithValue("@Expired",expired);
        com.Parameters.AddWithValue("@foto", "obat_obat/" + filename);
        com.Parameters.AddWithValue("@createDate", CreateDate);
        com.Parameters.AddWithValue("@createBy", CreateBy);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
       
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
            txtJumlahE.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            txtKetE.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
            txtSatuanE.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            txtHargaE.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;
            txtExpiredE.Text = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[8].Text;
            editfoto.ImageUrl = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[9].Text;

            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
        }
        else if (e.CommandName == "cmDelete")
        {
            String id = gridObat.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "sp_DeleteObat";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IDObat", lblID.Text);


            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
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

    }

    protected void EditbtnSave_Click1(object sender, EventArgs e)
    {
        string filename = Guid.NewGuid() + System.IO.Path.GetFileName(editUploadFile.FileName).Substring(System.IO.Path.GetFileName(editUploadFile.FileName).Length - 4);
        editUploadFile.SaveAs(Server.MapPath("obat_obat/") + filename);

        DateTime CreateDate = DateTime.Now;
        DateTime expired = Convert.ToDateTime(txtExpiredE.Text);
        DateTime ModifiedDate = DateTime.Now;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_UpdateObat]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDObat", lblID.Text);
        com.Parameters.AddWithValue("@namaObat", txtNamaObatE.Text);
        com.Parameters.AddWithValue("@IDJenis", ddlJenisObatE.SelectedValue);
        com.Parameters.AddWithValue("@Keterangan", txtKetE.Text);
        com.Parameters.AddWithValue("@IDLokasi", ddlLokasiE.SelectedValue);
        com.Parameters.AddWithValue("@Satuan", ddlSatuanE.SelectedValue);
        com.Parameters.AddWithValue("@Harga", txtHargaE.Text);
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

    protected void ddlStatusView_TextChanged(object sender, EventArgs e)
    {
        if (ddlStatusView.Text.Equals("2"))
        {
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_SelectObatAll]";
            com.CommandType = CommandType.StoredProcedure;
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
            SqlDataAdapter adapt = new SqlDataAdapter(com);
            adapt.Fill(ds);
            gridObat.DataSource = ds;
            gridObat.DataBind();
        }
    }
}