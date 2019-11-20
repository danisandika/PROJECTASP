using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Obat : System.Web.UI.Page
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime CreateDate = DateTime.Now;
        int CreateBy = 1;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InsertJenis";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaJenis", txtnamaJenis.Text);
        com.Parameters.AddWithValue("@deskripsi", txtDeskripsi.Text);
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

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectJenis";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaJenis", txtSearch.Text);
        com.Parameters.AddWithValue("@deskripsi", txtSearch.Text);
        //com.Parameters.AddWithValue("@keterangan", txtcari.Text);


        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridJenis.DataSource = ds;
        gridJenis.DataBind();
        return ds;
    }
}