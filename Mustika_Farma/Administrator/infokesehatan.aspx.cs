using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_infokesehatan : System.Web.UI.Page
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
        com.CommandText = "sp_SelectInfo";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Judul", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridInfo.DataSource = ds;
        gridInfo.DataBind();
        return ds;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string filename = Guid.NewGuid() + System.IO.Path.GetFileName(uploadfile.FileName).Substring(System.IO.Path.GetFileName(uploadfile.FileName).Length - 4);
        uploadfile.SaveAs(Server.MapPath("Info/") + filename);

        DateTime CreateDate = DateTime.Now;
        DateTime waktu = Convert.ToDateTime(txtWaktuPost.Text);
        int CreateBy = 1;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InputInfo";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Judul", txtJudul.Text);
        com.Parameters.AddWithValue("@Kategori", ddlKategori.SelectedValue);
        com.Parameters.AddWithValue("@Konten", txtKonten.Text);
        com.Parameters.AddWithValue("@waktuPost", waktu);
        com.Parameters.AddWithValue("@createDate", CreateDate);
        com.Parameters.AddWithValue("@createBy", CreateBy);
        com.Parameters.AddWithValue("@status",1);
        com.Parameters.AddWithValue("@foto", "Info/" + filename);

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

    protected void gridInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridInfo.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridInfo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridInfo.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            txtJudulE.Text = gridInfo.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            txtJontenE.Text = gridInfo.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            txtWaktuE.Text = gridInfo.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[4].Text;
            EditFoto.ImageUrl = gridInfo.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[5].Text;

            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
        }
        else if (e.CommandName == "cmDelete")
        {
            String id = gridInfo.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "[sp_DeleteInfo]";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@IDInfo", lblID.Text);


            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
        }
    }

    protected void gridInfo_Sorting(object sender, GridViewSortEventArgs e)
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

        gridInfo.DataSource = dv;
        gridInfo.DataBind();
    }


    protected void gridInfo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void EditbtnSave_Click(object sender, EventArgs e)
    {
        string filename = Guid.NewGuid() + System.IO.Path.GetFileName(editUploadFile.FileName).Substring(System.IO.Path.GetFileName(editUploadFile.FileName).Length - 4);
        editUploadFile.SaveAs(Server.MapPath("Info/") + filename);

        DateTime CreateDate = DateTime.Now;
        DateTime waktupost = Convert.ToDateTime(txtWaktuE.Text);
        DateTime ModifiedDate = DateTime.Now;
        int CreateBy = 1;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_UpdateInfo]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDInfo", lblID.Text);
        com.Parameters.AddWithValue("@Judul", txtJudulE.Text);
        com.Parameters.AddWithValue("@Kategori", ddlKategori.SelectedValue);
        com.Parameters.AddWithValue("@Konten", txtJontenE.Text);
        com.Parameters.AddWithValue("@waktuPost", waktupost);
        com.Parameters.AddWithValue("@createDate", CreateDate);
        com.Parameters.AddWithValue("@createBy", CreateBy);
        com.Parameters.AddWithValue("@status", 1);
        com.Parameters.AddWithValue("@foto", "Info/" + filename);

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
}