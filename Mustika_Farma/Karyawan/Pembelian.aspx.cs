using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_Pembelian : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";
    static string btn;
    static int tempId;

    public static string id;
    public static string cek;

    public int totalPemesanan = 0;
    public int totalPemesananAk = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        createDataTable();
        if (!Page.IsPostBack)
        {
            createDataTable();
            viewhasiltani.Visible = true;
            FillGrid();
        }
    }

    private void FillGrid()
    {
        SqlDataAdapter da = new SqlDataAdapter("[sp_SelectObatterjual]", conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grdObat.DataSource = dt;
        grdObat.DataBind();
    }

    public DataSet LoadData()
    {
        SqlCommand sqlCmd = new SqlCommand("[sp_SelectObatterjual]", conn);
        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        da.Fill(ds);
        grdObat.DataSource = ds;
        grdObat.DataBind();

        return ds;
    }
    DataTable dt;

    protected void btnCari_Click(object sender, EventArgs e)
    {
        SqlCommand sqlCmd = new SqlCommand("[sp_SelectObatAktif]", conn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@namaObat", txtCari.Text);
        conn.Open();
        sqlCmd.ExecuteNonQuery();
        conn.Close();
        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        DataTable table = new DataTable();
        da.Fill(table);
        grdObat.DataSource = table;
        grdObat.DataBind();
    }

    private void SortGridView(string SortExpression, string direction)
    {
        // you can create Data Table for improving performance
        DataTable dt = LoadData().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = SortExpression + direction;

        grdObat.DataSource = dv;
        grdObat.DataBind();
    }


    public SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["SortDirection"] == null)
                ViewState["SortDirection"] = SortDirection.Ascending;

            return (SortDirection)ViewState["SortDirection"];
        }
        set
        {
            ViewState["SortDirection"] = value;
        }
    }


    protected void btnrefresh_Click(object sender, EventArgs e)
    {
        FillGrid();
    }

    private void createDataTable()
    {
        dt = new DataTable();
        DataColumn dc0 = new DataColumn("Colum0");
        DataColumn dc1 = new DataColumn("Colum1");
        DataColumn dc2 = new DataColumn("Colum2");
        DataColumn dc3 = new DataColumn("Colum3");
        DataColumn dc4 = new DataColumn("Colum4");
        DataColumn dc5 = new DataColumn("Colum5");
        DataColumn dc6 = new DataColumn("Colum6");
        DataColumn dc7 = new DataColumn("Colum7");
        dt.Columns.Add(dc0);
        dt.Columns.Add(dc1);
        dt.Columns.Add(dc2);
        dt.Columns.Add(dc3);
        dt.Columns.Add(dc4);
        dt.Columns.Add(dc5);
        dt.Columns.Add(dc6);
        dt.Columns.Add(dc7);
    }


    protected void grdObat_Sorting(object sender, GridViewSortEventArgs e)
    {

        string SortExpression = e.SortExpression;

        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            SortGridView(SortExpression, Descending);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            SortGridView(SortExpression, Ascending);
        }
    }

    protected void grdObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdObat.PageIndex = e.NewPageIndex;
        FillGrid();
    }

    private string idOtomatis()
    {
        DataSet myDataSet = new DataSet();
        string maxid = "";
        int idPengumuman;
        string id = "";
        string now = DateTime.Now.ToString("yyyyMMdd");

        try
        {
            
            SqlCommand myCommand = new SqlCommand();

            myCommand.Connection = conn;
            myCommand.CommandText = "SELECT MAX(IDPembelian) AS idPengumuman FROM pembelian";
            myCommand.CommandType = CommandType.Text;

            SqlDataAdapter myDataAdapter = new SqlDataAdapter();
            myDataAdapter.SelectCommand = myCommand;
            myDataAdapter.TableMappings.Add("Table", "Pengumuman");
            myDataAdapter.Fill(myDataSet);
            maxid = Convert.ToString(myDataSet.Tables[0].Rows[0]["idPengumuman"]);

            if (maxid != "")
            {
                string date = maxid.Substring(0, 8);

                if (date.Equals(now))
                {
                    idPengumuman = Convert.ToInt32(maxid.Substring(8, 3)) + 1;
                    if (idPengumuman < 10)
                    {
                        id = now + "00" + idPengumuman;
                    }
                    else if (idPengumuman >= 10 && idPengumuman < 100)
                    {
                        id = now + "0" + idPengumuman;
                    }
                    else if (idPengumuman >= 100)
                    {
                        id = now + idPengumuman;
                    }
                }
                else
                {
                    id = now + "001";
                }
            }
            else
            {
                id = now + "001";
            }
        }
        catch (Exception ex)
        {

        }
        return id;
    }

    protected void btnpenjualanobat_Click(object sender, EventArgs e)
    {
        SqlDataAdapter dataAdapter = new SqlDataAdapter();
        System.Data.SqlClient.SqlParameter param;
        string date = DateTime.Now.ToString("yyyy-MM-dd");
        string newId = idOtomatis();
        int stokDB = 0;

        // insert command
        SqlCommand insertCmd = new SqlCommand("[sp_inputPembelian]", conn);
        insertCmd.CommandType = CommandType.StoredProcedure;

        param = insertCmd.Parameters.Add("@IDPembelian", SqlDbType.VarChar, 20);
        param.Direction = ParameterDirection.Input;
        param.Value = newId;

        param = insertCmd.Parameters.Add("@IDKaryawan", SqlDbType.VarChar, 50);
        param.Direction = ParameterDirection.Input;
        param.Value = 1;
        // param.Value = Session["creaby"].ToString();

        param = insertCmd.Parameters.Add("@tanggal", SqlDbType.DateTime);
        param.Direction = ParameterDirection.Input;
        param.Value = date;

        param = insertCmd.Parameters.Add("@TotalHarga", SqlDbType.Decimal);
        param.Direction = ParameterDirection.Input;
        param.Value = Convert.ToDecimal(txtTotalHargaPemesanan.Text);

        param = insertCmd.Parameters.Add("@status", SqlDbType.Int);
        param.Direction = ParameterDirection.Input;
        param.Value = 1;

        param = insertCmd.Parameters.Add("@IDSupplier", SqlDbType.Int);
        param.Direction = ParameterDirection.Input;
        param.Value = null;


        conn.Open();
        insertCmd.ExecuteNonQuery();
        conn.Close();

        foreach (GridViewRow gvr in grdDetailPenjualan.Rows)
        {
            DataRow dr = dt.NewRow();

            dr["Colum0"] = Convert.ToInt32(gvr.Cells[0].Text);
            dr["Colum1"] = gvr.Cells[1].Text;
            dr["Colum2"] = gvr.Cells[2].Text;
            dr["Colum3"] = gvr.Cells[3].Text;
            dr["Colum4"] = gvr.Cells[4].Text;
            //Untuk set txtQty & txtSub
            int rowindex = Convert.ToInt32(gvr.Cells[0].Text) - 1;
            TextBox qty = (TextBox)grdDetailPenjualan.Rows[rowindex].FindControl("txtQty");
            TextBox sub = (TextBox)grdDetailPenjualan.Rows[rowindex].FindControl("txtSub");
            //string q = qty.Text;
            dr["Colum6"] = qty.Text;
            dr["Colum7"] = sub.Text;
            dt.Rows.Add(dr);
        }


        int jml = dt.Rows.Count;
        int i = 0;
        foreach (DataRow row in dt.Rows)
        {
            TextBox txt = (TextBox)grdDetailPenjualan.Rows[i].FindControl("txtHarga");
            TextBox txt1 = (TextBox)grdDetailPenjualan.Rows[i].FindControl("txtQty");
            TextBox txt2 = (TextBox)grdDetailPenjualan.Rows[i].FindControl("txtSub");


            SqlCommand insert1 = new SqlCommand("[sp_InputDetailTransaksiPembelian]", conn);
            insert1.CommandType = CommandType.StoredProcedure;

            SqlCommand search = new SqlCommand("[sp_cekObat]", conn);
            search.CommandType = CommandType.StoredProcedure;

            SqlCommand updateStok = new SqlCommand("sp_UpdateStokTani", conn);
            updateStok.CommandType = CommandType.StoredProcedure;

            search.Parameters.AddWithValue("@IObat", Convert.ToInt32(row["Colum1"].ToString()));

            try
            {
                conn.Open();
                SqlDataReader reader = search.ExecuteReader();
                while (reader.Read())
                {
                    stokDB = Convert.ToInt32(reader[0]);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }

            insert1.Parameters.AddWithValue("IDPembelian", newId);
            insert1.Parameters.AddWithValue("IDObat", Convert.ToInt32(row["Colum1"].ToString()));
            insert1.Parameters.AddWithValue("jumlah", Convert.ToInt32(txt1.Text));
            insert1.Parameters.AddWithValue("subTotal", Convert.ToDouble(txt2.Text));

            stokDB = stokDB - Convert.ToInt32(Convert.ToInt32(txt1.Text));

            param = updateStok.Parameters.Add("@IDObat", SqlDbType.Int);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToInt32(row["Colum1"].ToString());
            param = updateStok.Parameters.Add("@JumlahObat", SqlDbType.Int);
            param.Direction = ParameterDirection.Input;
            param.Value = stokDB;
            conn.Close();

            try
            {
                // INSERT DETAIL TRANSAKSI
                conn.Open();
                insert1.ExecuteNonQuery();
                search.ExecuteNonQuery();
                updateStok.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            i++;
        }

        Response.Write("<script>alert('Transaksi Berhasil Dilakukan')</script>");
        Server.Transfer("TransaksiPenjualan.aspx");
    }

    protected void grdObat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int sama = 0;
        int index = Convert.ToInt32(e.CommandArgument);

        try
        {

            foreach (GridViewRow gvr in grdDetailPenjualan.Rows)
            {
                string b = gvr.Cells[1].Text;
                if (grdObat.Rows[index].Cells[0].Text == gvr.Cells[1].Text)
                {
                    sama = 1;
                    break;
                }
            }
            if (sama == 0)
            {
                if (e.CommandName == "tambahPenjualan")
                {
                    Response.Write("<script>alert('Transaksi Berhasil Dilakukan')</script>");
                    int no = 1;

                    string jenistani = grdObat.Rows[index].Cells[1].Text;
                    string hasiltani = grdObat.Rows[index].Cells[2].Text;
                    string kualitas = grdObat.Rows[index].Cells[5].Text;
                    double harga = (Convert.ToInt32(grdObat.Rows[index].Cells[4].Text));



                    foreach (GridViewRow gvr in grdDetailPenjualan.Rows)
                    {
                        double hargalama = getHarga(Convert.ToInt32(gvr.Cells[1].Text));
                        DataRow dr = dt.NewRow();

                        dr["Colum0"] = Convert.ToInt32(gvr.Cells[0].Text);
                        dr["Colum1"] = gvr.Cells[1].Text;
                        dr["Colum2"] = gvr.Cells[2].Text;
                        dr["Colum3"] = gvr.Cells[3].Text;
                        dr["Colum4"] = gvr.Cells[4].Text;
                        dr["Colum5"] = hargalama;

                        //Untuk set txtQty & txtSub
                        int rowindex = Convert.ToInt32(gvr.Cells[0].Text) - 1;
                        TextBox qty = (TextBox)grdDetailPenjualan.Rows[rowindex].FindControl("txtQty");
                        TextBox sub = (TextBox)grdDetailPenjualan.Rows[rowindex].FindControl("txtSub");
                        //string q = qty.Text;
                        dr["Colum6"] = qty.Text;
                        dr["Colum7"] = sub.Text;
                        dt.Rows.Add(dr);

                        no++;
                    }
                    DataRow drNew = dt.NewRow();
                    drNew["Colum0"] = no;
                    drNew["Colum1"] = grdObat.Rows[index].Cells[0].Text;
                    drNew["Colum2"] = grdObat.Rows[index].Cells[1].Text;
                    drNew["Colum3"] = grdObat.Rows[index].Cells[2].Text;
                    drNew["Colum4"] = grdObat.Rows[index].Cells[5].Text;
                    drNew["Colum5"] = harga;
                    drNew["Colum6"] = "";
                    drNew["Colum7"] = "";
                    dt.Rows.Add(drNew);

                    int jml = dt.Rows.Count;
                    int i = 0;
                    //Untuk memasukkan harga, qty & subtotal sebelumnya
                    if (jml != 1)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            if (i == (jml - 1))
                            {
                                break;
                            }
                            TextBox txt = (TextBox)grdDetailPenjualan.Rows[i].FindControl("txtHarga");
                            TextBox txt1 = (TextBox)grdDetailPenjualan.Rows[i].FindControl("txtQty");
                            TextBox txt2 = (TextBox)grdDetailPenjualan.Rows[i].FindControl("txtSub");
                           
                            txt.Text = row["Colum5"].ToString();
                            txt1.Text = row["Colum6"].ToString();
                            txt2.Text = row["Colum7"].ToString();

                            i++;
                        }
                    }

                    grdDetailPenjualan.DataSource = dt;
                    grdDetailPenjualan.DataBind();

                    totalPemesanan = Convert.ToInt32(grdDetailPenjualan.Rows[index].Cells[7].Text);
                   
                }

                totalPemesananAk = totalPemesananAk + totalPemesanan;
                txtTotalHargaPemesanan.Text = totalPemesananAk.ToString();

            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    private double getHarga(int id)
    {
        //int index = Convert.ToInt32(e.CommandArgument);
        System.Data.SqlClient.SqlParameter param;
        conn.Open();
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("sp_SelectObatAktif", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        param = cmd.Parameters.Add("@namaObat", SqlDbType.Int);
        param.Direction = ParameterDirection.Input;
        param.Value = id;

        cmd.Connection = conn;
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        adapter.Fill(ds);
        double harga = double.Parse(ds.Tables[0].Rows[0]["Harga"].ToString());
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        return harga;

    }


    protected void txtQty_TextChanged(object sender, EventArgs e)
    {

    }
}