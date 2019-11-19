using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Role : System.Web.UI.Page
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
        com.CommandText = "sp_SelectJenis";
        com.CommandType = CommandType.StoredProcedure;
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
        int CreateBy = 1;
        int status = 1;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InsertJenis";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@deskripsi", txtDeskripsi.Text);
        com.Parameters.AddWithValue("@status", status);
        com.Parameters.AddWithValue("@createDate", CreateDate);
        com.Parameters.AddWithValue("@createBy", CreateBy);

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
        com.CommandText = "sp_UpdateJenis";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@idRole", lblID.Text);
        com.Parameters.AddWithValue("@deskripsi", txtDeskripsiE.Text);
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

    protected void gridJenis_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridJenis.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            txtDeskripsiE.Text = gridJenis.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;


            secAdd.Visible = false;
            secEdit.Visible = true;
            secView.Visible = false;
        }
        else if (e.CommandName == "cmDelete")
        {
            String id = gridJenis.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblID.Text = id;
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            com.CommandText = "sp_DeleteJenis";
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@idRole", lblID.Text);


            conn.Open();

            int result = Convert.ToInt32(com.ExecuteNonQuery());
            conn.Close();
            loadData();

            secView.Visible = true;
            secEdit.Visible = false;
            secAdd.Visible = false;
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

}