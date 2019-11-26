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
            //secEdit.Visible = false;
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

        DateTime CreateDate = DateTime.Now;
        DateTime expired = Convert.ToDateTime(txtExpired.Text);
        int CreateBy = 1;

        if (txtfoto.HasFile) {
        txtfoto.PostedFile.SaveAs(Server.MapPath("~/Administrator/upload/") + txtfoto.FileName.ToString());
        string stringFoto = "~/Administrator/upload/" + txtfoto.FileName.ToString();
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_InputObat";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaObat", txtnamaObat.Text);
        com.Parameters.AddWithValue("@IDJenis", DDLJenisObat.SelectedValue);
        com.Parameters.AddWithValue("@Keterangan", txtKet.Text);
        com.Parameters.AddWithValue("@IDLokasi", DDLLokasi.SelectedValue);
        com.Parameters.AddWithValue("@Satuan", txtSatuan.Text);
        com.Parameters.AddWithValue("@Harga", txtHarga.Text);
        com.Parameters.AddWithValue("@Expired", expired);
        com.Parameters.AddWithValue("@Foto",stringFoto );
        com.Parameters.AddWithValue("@createDate", CreateDate);
        com.Parameters.AddWithValue("@createBy", CreateBy);

        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
    }
    }

    protected void btntambah_Click(object sender, EventArgs e)
    {
        secAdd.Visible = true;
        //secEdit.Visible = false;
        secView.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void gridObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void gridObat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridObat_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void gridObat_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}