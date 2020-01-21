using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_Booking : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tampilanBooking();
            AddNewRow();
            loadData();
            secAddRiwayat.Visible = false;
            secKeranjang.Visible = false;
            secObat.Visible = false;
            secViewRiwayat.Visible = false;
            //loadIDPasien();
        }
        loadIDPasien();
        loadData();

    }

    private void loadIDPasien()
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);

        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select u.Nama as 'Nama', u.IDUser from Booking b, [User] u where b.IDBooking = @IDBooking and u.IDUser= b.IDUser", conn);
        myCommand.Parameters.AddWithValue("@IDBooking", lblIDqu.Text);

        conn.Open();
        myReader = myCommand.ExecuteReader();
        while (myReader.Read())
        {
            lblIDPasien.Text = myReader["Nama"].ToString();
            labelIDUSer.Text = myReader["IDUser"].ToString();
            lblKaryawan.Text = myReader["IDUser"].ToString();
        }

    }

    protected void btnSaveRiwayat_Click(object sender, EventArgs e)
    {

        DateTime CreateDate = DateTime.Now;
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_InputRiwayat]";
        com.CommandType = CommandType.StoredProcedure;
        //masih diakal2in


        com.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);
        com.Parameters.AddWithValue("@IDUser", labelIDUSer.Text);
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

        secViewRiwayat.Visible = true;
        secAddRiwayat.Visible = false;
        Response.Write("<script>alert('Data berhasil ditambahkan    ');</script>");

    }

    private void AddNewRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;

        dt.Columns.Add("namaObat");
        dt.Columns.Add("Satuan");
        dt.Columns.Add("jumlah");
        dt.Columns.Add("Harga");
        dt.Columns.Add("IDObat");


        dr = dt.NewRow();

        dr["namaObat"] = string.Empty;
        dr["Satuan"] = string.Empty;
        dr["jumlah"] = string.Empty;
        dr["Harga"] = string.Empty;
        dr["IDObat"] = string.Empty;


        dt.Rows.Add(dr);

        ViewState["currentTable"] = dt;
        ViewState["currentTable2"] = dt;

        grdKeranjang.DataSource = dt;
        grdKeranjang.DataBind();
    }

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectJual]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaObat", txtSearch.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridObat.DataSource = ds;
        gridObat.DataBind();
        return ds;
    }

    private DataSet tampilanBooking()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectBooking]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDBooking", txtSearch.Text);
        com.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);
        SqlDataAdapter adapt = new SqlDataAdapter(com);
        adapt.Fill(ds);
        gridBooking.DataSource = ds;
        gridBooking.DataBind();
        return ds;
    }

    protected void gridObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridObat.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridObat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            
            string Name = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[1].Text;
            string satuan = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            string jumlah = ((TextBox)gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[5].FindControl("jumlahBeli")).Text;
            string harga = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            string IDObat = gridObat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;

            int rowIndex = 0;
            if (ViewState["currentTable"] != null)
            {
                DataTable dtr = (DataTable)ViewState["currentTable"];
                DataRow drr = null;
                if (dtr.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtr.Rows.Count; i++)
                    {
                        Label box1 = (Label)grdKeranjang.Rows[rowIndex].Cells[1].FindControl("namaObat");
                        Label box2 = (Label)grdKeranjang.Rows[rowIndex].Cells[2].FindControl("Satuan");
                        Label box3 = (Label)grdKeranjang.Rows[rowIndex].Cells[3].FindControl("jumlah");
                        Label box4 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("Harga");
                        Label box5 = (Label)grdKeranjang.Rows[rowIndex].Cells[5].FindControl("IDObat");

                        drr = dtr.NewRow();

                        dtr.Rows[i - 1]["namaObat"] = box1.Text;
                        dtr.Rows[i - 1]["Satuan"] = box2.Text;
                        dtr.Rows[i - 1]["jumlah"] = box3.Text;
                        dtr.Rows[i - 1]["Harga"] = box4.Text;
                        dtr.Rows[i - 1]["IDObat"] = box5.Text;

                        rowIndex++;
                    }
                    dtr.Rows.Add(drr);

                    grdKeranjang.DataSource = dtr;
                    grdKeranjang.DataBind();
                }
                else
                {

                }
            }

            rowIndex = 0;
            if (ViewState["currentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["currentTable"];
                DataTable dt2 = (DataTable)ViewState["currentTable2"];
                DataRow dr2 = null;
                int row = dt.Rows.Count;
                double valuefinal = 0;
                if (row > 0)
                {
                    for (int i = 0; i < row; i++)
                    {
                        Label box1 = (Label)grdKeranjang.Rows[rowIndex].Cells[1].FindControl("namaObat");
                        Label box2 = (Label)grdKeranjang.Rows[rowIndex].Cells[2].FindControl("Satuan");
                        Label box3 = (Label)grdKeranjang.Rows[rowIndex].Cells[3].FindControl("jumlah");
                        Label box4 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("harga");
                        Label box5 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("IDObat");

                        if (i == row - 2)
                        {
                            String id = gridObat.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                            lblID.Text = id;
                            double hargatot = Convert.ToDouble(harga) * Convert.ToDouble(jumlah);

                            box1.Text = Name;
                            box2.Text = satuan;
                            box3.Text = jumlah.ToString();
                            box4.Text = Convert.ToString(hargatot);
                            box5.Text = IDObat;
                            valuefinal += hargatot;

                            dr2 = dt2.NewRow();
                            dt2.Rows[i]["namaObat"] = box1.Text;
                            dt2.Rows[i]["Satuan"] = box2.Text;
                            dt2.Rows[i]["jumlah"] = box3.Text;
                            dt2.Rows[i]["Harga"] = box4.Text;
                            dt2.Rows[i]["IDObat"] = box5.Text;
                            dt2.Rows.Add(dr2);
                            ViewState["currentTable2"] = dt2;

                            lblTotalHarga.Text = Convert.ToString(valuefinal);
                            lblJumlahPembelian.Text = "TOTAL PEMBAYARAN RP " + valuefinal; //Convert.ToString(valuefinal);
                        }
                        else if (i == row - 1)
                        {
                            box1.Text = dt.Rows[i]["namaObat"].ToString();
                            box2.Text = dt.Rows[i]["Satuan"].ToString();
                            box3.Text = dt.Rows[i]["jumlah"].ToString();
                            box4.Text = dt.Rows[i]["Harga"].ToString();
                            box5.Text = dt.Rows[i]["IDObat"].ToString();
                        }
                        else
                        {
                            box1.Text = dt.Rows[i]["namaObat"].ToString();
                            box2.Text = dt.Rows[i]["Satuan"].ToString();
                            box3.Text = dt.Rows[i]["jumlah"].ToString();
                            box4.Text = dt.Rows[i]["Harga"].ToString();
                            box5.Text = dt.Rows[i]["IDObat"].ToString();

                            valuefinal += Convert.ToDouble(box4.Text);
                        }
                        rowIndex++;
                    }
                }
            }
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

    protected void gridObat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gridObat_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        loadData();
    }

    protected string generateIDTrans()
    {
        string IDTrans = DateTime.Now.ToString("yyyyMMddhhmmss");
        return IDTrans;
    }

    protected void btnProses_Click(object sender, EventArgs e)
    {
        string strIDPembelian = generateIDTrans();


        string strID = generateIDTrans();
        DateTime tanggal = DateTime.Now;
        SqlCommand insert = new SqlCommand("[sp_InputTransaksi]", conn);
        insert.CommandType = CommandType.StoredProcedure;

        insert.Parameters.AddWithValue("@IDTransaksi", strID);
        insert.Parameters.AddWithValue("@IDKaryawan", Convert.ToInt16(lblID.Text)); //customer
        insert.Parameters.AddWithValue("@Tanggal", tanggal);
        insert.Parameters.AddWithValue("@FotoResep", DBNull.Value);
        insert.Parameters.AddWithValue("@totalBayar", Convert.ToDecimal(lblTotalHarga.Text));
        insert.Parameters.AddWithValue("@status", 2);
        insert.Parameters.AddWithValue("@ID_Dokter", Convert.ToInt16(Session["creaby"]));

        conn.Open();
        insert.ExecuteNonQuery();
        conn.Close();

        DataTable dt = (DataTable)ViewState["currentTable"];
        int row = dt.Rows.Count;
        for (int i = 0; i < row - 1; i++)
        {
            SqlCommand ins = new SqlCommand("[sp_InputDetailTransaksi]", conn);
            ins.CommandType = CommandType.StoredProcedure;

            ins.Parameters.AddWithValue("IDTransaksi", strID);
            ins.Parameters.AddWithValue("jumlah", dt.Rows[i]["jumlah"]);
            ins.Parameters.AddWithValue("subTotal", dt.Rows[i]["harga"]);
            ins.Parameters.AddWithValue("IDObat", dt.Rows[i]["IDObat"]);
            conn.Open();
            ins.ExecuteNonQuery();
            conn.Close();
        }
        AddNewRowTogrid();
        Response.Write("<script>alert('Data berhasil Ditambahkan');</script>");
        loadData();
    }

    private void AddNewRowTogrid()
    {
        int rowIndex = 0;
        if (ViewState["currentTable"] != null)
        {
            DataTable dtr = (DataTable)ViewState["currentTable"];
            DataRow drr = null;
            if (dtr.Rows.Count > 0)
            {
                for (int i = 1; i <= dtr.Rows.Count; i++)
                {
                    Label box1 = (Label)grdKeranjang.Rows[rowIndex].Cells[1].FindControl("namaObat");
                    Label box2 = (Label)grdKeranjang.Rows[rowIndex].Cells[2].FindControl("Satuan");
                    Label box3 = (Label)grdKeranjang.Rows[rowIndex].Cells[3].FindControl("jumlah");
                    Label box4 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("Harga");
                    Label box5 = (Label)grdKeranjang.Rows[rowIndex].Cells[5].FindControl("IDObat");

                    drr = dtr.NewRow();

                    dtr.Rows[i - 1]["namaObat"] = box1.Text;
                    dtr.Rows[i - 1]["Satuan"] = box2.Text;
                    dtr.Rows[i - 1]["jumlah"] = box3.Text;
                    dtr.Rows[i - 1]["Harga"] = box4.Text;
                    dtr.Rows[i - 1]["IDObat"] = box5.Text;

                    rowIndex++;
                }
                dtr.Rows.Add(drr);
                ViewState["currentTable"] = dtr;

                grdKeranjang.DataSource = dtr;
                grdKeranjang.DataBind();
            }
            else
            {

            }
        }
    }

    protected void gridBooking_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void gridBooking_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            loadData();
            String id = gridBooking.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblIDqu.Text = id;
            secBooking.Visible = false;
            secViewRiwayat.Visible = true;
            secObat.Visible = true;
            secKeranjang.Visible = true;

        }

    }

    protected void gridBooking_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void gridBooking_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridBooking_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = gridBooking.Rows[e.RowIndex].Cells[3];
        string cells = cell.Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        string id = gridBooking.DataKeys[e.RowIndex].Value.ToString();
        com.CommandText = "[sp_DeleteBooking]";

        com.Parameters.AddWithValue("@IDBooking", id);
        com.Parameters.AddWithValue("@status", 1);
        com.CommandType = CommandType.StoredProcedure;

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();

        Response.Redirect("konf_booking.aspx");


    }

    protected void gridBooking_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        var linkDelete = (LinkButton)e.Row.FindControl("linkDelete");
        var linkAktif = (LinkButton)e.Row.FindControl("linkAktif");

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TableCell statusCell = e.Row.Cells[3];
            if (statusCell.Text == "2")
            {
                linkAktif.Visible = false;
            }
            else if (statusCell.Text == "1")
            {
                linkDelete.Visible = false;
            }
        }
    }



    protected void keranjang_Click(object sender, EventArgs e)
    {
        decimal valuefinal = 0;
        DataTable dt = new DataTable();
        dt.Columns.Add("namaObat");
        dt.Columns.Add("Satuan");
        dt.Columns.Add("jumlahBeli");
        dt.Columns.Add("harga");
        dt.Columns.Add("IDObat");


        foreach (GridViewRow grow in gridObat.Rows)
        {
            var checkboxselect = grow.FindControl("CheckBox1") as CheckBox;
            if (checkboxselect.Checked)
            {
                string Name = (grow.FindControl("labNama") as Label).Text;
                string satuan = (grow.FindControl("labSat") as Label).Text;
                string jumlah = (grow.FindControl("jumlahBeli") as TextBox).Text;
                string harga = (grow.FindControl("Harga") as Label).Text;
                string IDObat = (grow.FindControl("labIDObat") as Label).Text;

                decimal hargatot = Convert.ToDecimal(harga) * Convert.ToDecimal(jumlah);
                dt.Rows.Add(Name, satuan, jumlah, hargatot, IDObat);
                valuefinal += hargatot;

                lblJumlahPembelian.Text = "TOTAL PEMBAYARAN RP " + Convert.ToString(valuefinal);
                lblTotalHarga.Text = Convert.ToString(valuefinal);
            }

            grdKeranjang.DataSource = dt;
            grdKeranjang.DataBind();
        }
        Response.Write("<script>alert('Data berhasil dimasukkan kekeranjang');</script>");

    }

    protected void btntambahRiwayat_Click(object sender, EventArgs e)
    {
        secAddRiwayat.Visible = true;
        secViewRiwayat.Visible = false;
    }


}