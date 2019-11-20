using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Lokasi_penyimpanan : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Apotek"].ConnectionString);
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
        com.CommandText = "sp_SelectLokasi";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Nama_Lokasi", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridLokasi.DataSource = ds;
        gridLokasi.DataBind();
        return ds;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime CreateDate = DateTime.Now;
        int CreateBy = 1;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InsertLokasi";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Nama_Lokasi", txtNamaLok.Text);
        com.Parameters.AddWithValue("@tempatLokasi", txtTempatLok.Text);
        com.Parameters.AddWithValue("@Deskripsi", txtDeskripsi.Text);
        com.Parameters.AddWithValue("@CreateBy", CreateBy);
        com.Parameters.AddWithValue("@CreateDate", CreateDate);

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
        int ModifiedBy = 1;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_UpdateLokasi";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDLokasi", lblID.Text);
        com.Parameters.AddWithValue("@Nama_Lokasi", txtNamaE.Text);
        com.Parameters.AddWithValue("@tempatLokasi", txtTempatE.Text);
        com.Parameters.AddWithValue("@Deskripsi", txtDeskE.Text);
        com.Parameters.AddWithValue("@ModifiedDate", ModifiedDate);
        com.Parameters.AddWithValue("@ModifiedBy", ModifiedBy);

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
        loadData();
    }

    protected void gridLokasi_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridLokasi.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridLokasi_SelectedIndexChanged(object sender, EventArgs e)
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

        gridLokasi.DataSource = dv;
        gridLokasi.DataBind();
    }


    protected void gridLokasi_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void gridLokasi_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridLokasi.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            txtNamaE.Text = gridLokasi.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtTempatE.Text = gridLokasi.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            txtDeskE.Text = gridLokasi.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;


            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
        }
        else if (e.CommandName == "cmDelete")
        {
            String id = gridLokasi.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "sp_HapusLokasi";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IDLokasi", lblID.Text);


            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
        }
    }
}