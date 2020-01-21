using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_konf_booking : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();
    private const string Ascending = " ASC";
    private const string Descending = " DESC";
    protected void Page_Load(object sender, EventArgs e)
    {
        string strID = generateIDTrans();
        lblIDTrans.Text = "ID Transaksi " + strID;
        if (!IsPostBack)
        {
            tampilanBooking();
            loadData();
            tampilRiwayat();
            AddNewRow();
            secObat.Visible = false;
            secKeranjang.Visible = false;
            secAddRiwayat.Visible = false;
            //secEditRiwayat.Visible = false;
            secViewRiwayat.Visible = false;
            Section1.Visible = false;
            loadData();

        }
        loadIDPasien();
        //loadData();
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
        grdKeranjang.DataSource = dt;
        grdKeranjang.DataBind();
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
            lblKaryawan.Text= myReader["IDUser"].ToString();


        }

    }


    private DataSet tampilRiwayat()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "sp_SelectRiwayat";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@nama", txtCariRiwayat.Text);
        
        com.Parameters.AddWithValue("@dokter", Convert.ToInt32(Session["creaby"]));

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridRiwayat.DataSource = ds;
        gridRiwayat.DataBind();
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

    

    private DataSet loadData()
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectJual]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@namaObat", txtCariObat.Text);

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridObat.DataSource = ds;
        gridObat.DataBind();
        return ds;

       
    }
   

    protected void gridObat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

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
                    ViewState["currentTable"] = dtr;

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
                int row = dt.Rows.Count;
                double valuefinal = 0;
                if (row > 0)
                {
                    for (int i = 0; i < row; i++)
                    {
                        Label box1 = (Label)grdKeranjang.Rows[rowIndex].Cells[1].FindControl("namaObat");
                        Label box2 = (Label)grdKeranjang.Rows[rowIndex].Cells[2].FindControl("Satuan");
                        Label box3 = (Label)grdKeranjang.Rows[rowIndex].Cells[3].FindControl("jumlah");
                        Label box4 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("Harga");
                        Label box5 = (Label)grdKeranjang.Rows[rowIndex].Cells[4].FindControl("IDObat");

                        if (i == row - 2)
                        {
                            String id = gridObat.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
                            lblIDObat.Text = id;

                            double hargatot = Convert.ToDouble(harga) * Convert.ToDouble(jumlah);

                            box1.Text = Name;
                            box2.Text = satuan;
                            box3.Text = jumlah.ToString();
                            box4.Text = Convert.ToString(hargatot);
                            box5.Text = IDObat;
                            valuefinal += hargatot;

                            lblJumlahPembelian.Text = "TOTAL PEMBAYARAN RP " + valuefinal; //Convert.ToString(valuefinal);
                            lblTotalHarga.Text = Convert.ToString(valuefinal);
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

    }

    protected void gridObat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridObat_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      
    }

    protected void gridObat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

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

    protected string generateIDTrans()
    {
        string IDTrans = DateTime.Now.ToString("yyyyMMddhhmmss");
        return IDTrans;
    }

    protected void btnProses_Click(object sender, EventArgs e)
    {
        try
        {
            string strID = generateIDTrans();
            DateTime tanggal = DateTime.Now;
            SqlCommand insert = new SqlCommand("[sp_InputTransaksi]", conn);
            insert.CommandType = CommandType.StoredProcedure;

            insert.Parameters.AddWithValue("@IDTransaksi", strID);
            insert.Parameters.AddWithValue("@IDKaryawan", Convert.ToInt16(lblKaryawan.Text)); //customer
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
                i++;
                conn.Open();
                ins.ExecuteNonQuery();
                conn.Close();
            }
            Response.Write("<script>alert('Data berhasil Ditambahkan');</script>");
            loadData();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Data Gagal Ditambahkan');</script>");
        }
    }

    protected void ddlStatusView_TextChanged(object sender, EventArgs e)
    {

        //if (ddlStatusView.Text.Equals("2"))
        //{
        //    SqlCommand com = new SqlCommand();
        //    com.Connection = conn;
        //    com.CommandText = "[sp_SelectBooking]";
        //    com.CommandType = CommandType.StoredProcedure;
        //    com.Parameters.AddWithValue("@IDBooking", txtSearch.Text);
        //    com.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);
        //    SqlDataAdapter adapt = new SqlDataAdapter(com);
        //    adapt.Fill(ds);
        //    gridBooking.DataSource = ds;
        //    gridBooking.DataBind();
        //}
        //else if (ddlStatusView.Text.Equals("1"))
        //{
        //    SqlCommand com = new SqlCommand();
        //    com.Connection = conn;
        //    com.CommandText = "[sp_SelectBookingAktif]";
        //    com.CommandType = CommandType.StoredProcedure;
        //    com.Parameters.AddWithValue("@IDBooking", txtSearch.Text);
        //    com.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);
        //    SqlDataAdapter adapt = new SqlDataAdapter(com);
        //    adapt.Fill(ds);
        //    gridBooking.DataSource = ds;
        //    gridBooking.DataBind();
        //}
        //else if (ddlStatusView.Text.Equals("0"))
        //{
        //    SqlCommand com = new SqlCommand();
        //    com.Connection = conn;
        //    com.CommandText = "[sp_SelectBookingNA]";
        //    com.CommandType = CommandType.StoredProcedure;
        //    com.Parameters.AddWithValue("@IDBooking", txtSearch.Text);
        //    com.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);
        //    SqlDataAdapter adapt = new SqlDataAdapter(com);
        //    adapt.Fill(ds);
        //    gridBooking.DataSource = ds;
        //    gridBooking.DataBind();
        //}
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        tampilanBooking();
    }

    protected void gridBooking_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void gridBooking_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            String id = gridBooking.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            lblIDqu.Text = id;

            secKeranjang.Visible = true;
            secObat.Visible = true;
            secView.Visible = false;
            secViewRiwayat.Visible = true;
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

    protected void btnSaveRiwayat_Click(object sender, EventArgs e)
    {
        try
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
            //secEditRiwayat.Visible = false;
            secAddRiwayat.Visible = false;
            Response.Write("<script>alert('Data berhasil ditambahkan    ');</script>");

        }
        catch
        {
            Response.Write("<script>alert('Data Gagal Ditambahkan');</script>");

        }

    }

    protected void EditbtnSaveRiwayat_Click(object sender, EventArgs e)
    {

        //DateTime CreateDate = DateTime.Now;
        //SqlCommand com = new SqlCommand();
        //com.Connection = conn;
        //com.CommandText = "[sp_UpdateRiwayat]";
        //com.CommandType = CommandType.StoredProcedure;
        ////masih diakal2in

        //com.Parameters.AddWithValue("@IDRiwayat", lblID.Text);
        //com.Parameters.AddWithValue("@ID_Dokter", Session["creaby"]);
        //com.Parameters.AddWithValue("@IDUser", labelIDUSer.Text);
        //com.Parameters.AddWithValue("@berat", txtBeratE.Text);
        //com.Parameters.AddWithValue("@tinggi", txtTinggiE.Text);
        //com.Parameters.AddWithValue("@tensi", txtTensiE.Text);
        //com.Parameters.AddWithValue("@gula", txtGulaE.Text);
        //com.Parameters.AddWithValue("@kolestrol", txtKolestrolE.Text);
        //com.Parameters.AddWithValue("@pesan", txtPesanE.Text);
        //com.Parameters.AddWithValue("@penyakit", txtPenyakitE.Text);

        //conn.Open();

        //int result = Convert.ToInt32(com.ExecuteNonQuery());
        //conn.Close();
        //loadData();

        //secViewRiwayat.Visible = true;
        //secEditRiwayat.Visible = false;
        //secAddRiwayat.Visible = false;
    }

    protected void EditbtnCancelRiwayat_Click(object sender, EventArgs e)
    {
        secViewRiwayat.Visible = true;
        //secEditRiwayat.Visible = false;
        secAddRiwayat.Visible = false;
    }

    protected void btntambahRiwayat_Click(object sender, EventArgs e)
    {
        secAddRiwayat.Visible = true;
        //secEditRiwayat.Visible = false;
        secViewRiwayat.Visible = false;
        

    }

    protected void cariRiwayat_Click(object sender, EventArgs e)
    {
        tampilRiwayat();
    }

    protected void gridRiwayat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridRiwayat.PageIndex = e.NewPageIndex;
        loadData();
    }

    protected void gridRiwayat_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmEdit")
        {
            //String id = gridRiwayat.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString();
            //lblID.Text = id;    
            //txtPenyakitE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[2].Text;
            //txtBeratE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[6].Text;
            //txtTinggiE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[7].Text;
            //txtTensiE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[8].Text;
            //txtPesanE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[3].Text;
            //txtGulaE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[9].Text;
            //txtKolestrolE.Text = gridRiwayat.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[10].Text;

            //secAddRiwayat.Visible = false;
            //secEditRiwayat.Visible = true;
            //secViewRiwayat.Visible = false;
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
            secViewRiwayat.Visible = true;
            //secEditRiwayat.Visible = false;
            secAddRiwayat.Visible = false;
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
        DataTable dt = tampilRiwayat().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gridRiwayat.DataSource = dv;
        gridRiwayat.DataBind();
    }

    protected void gridRiwayat_SelectedIndexChanged(object sender, EventArgs e)
    {

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

    protected void btnclose_Click(object sender, EventArgs e)
    {
        GridViewDetails.Hide();
    }

    protected void btnKonf_booking_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent;
        //Get the column value and assign it to label in panel
        //Change the index as per your need
        string id = row.Cells[1].Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_statusBooking]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDBooking", id);
        SqlDataAdapter adapt = new SqlDataAdapter(com);
        adapt.Fill(ds);
        gridBooking.DataSource = ds;
        gridBooking.DataBind();
    }

    protected void lnkCariObat_Click(object sender, EventArgs e)
    {
        loadData();
    }

    protected void btnSelesai_Click(object sender, EventArgs e)
    {
        string id = lblIDqu.Text;
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_DeleteBooking]";

        com.Parameters.AddWithValue("@IDBooking", id);
        com.Parameters.AddWithValue("@status", 1);
        com.CommandType = CommandType.StoredProcedure;

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();

        if (result > 0)
        {
            Response.Write("<script>alert('Data berhasil dimasukkan kekeranjang');</script>");
        }
        else
        {
            Response.Write("<script>alert('Data Gagal dimasukkan kekeranjang');</script>");
        }
    }
}
