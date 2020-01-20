using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Karyawan_Booking : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadData();
        }
        string str = RandomString(10, false);
        txtBooking.Text = str;
        ddlvalue();
    }

    private void ddlvalue()
    {
        conn.Open();
        SqlCommand read = new SqlCommand("[sp_pilihDokter]", conn);
        read.CommandType = CommandType.StoredProcedure;
        read.Parameters.AddWithValue("@ID_SP", ddlJenisE.SelectedValue.ToString());
        SqlDataAdapter adap = new SqlDataAdapter(read);
        adap.Fill(ds);
        ddlDokter.DataSource = ds;
        ddlDokter.DataBind();
        conn.Close();
    }

    private DataSet loadData()
    {
        conn.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = conn;
        com.CommandText = "[sp_SelectBookingCust]";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@IDUser", Session["creaby"]);
        conn.Close();

        SqlDataAdapter adap = new SqlDataAdapter(com);
        adap.Fill(ds);
        gridBooking.DataSource = ds;
        gridBooking.DataBind();
        return ds;
       
    }

    protected void booking_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        com.CommandText = "sp_InputBooking";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("IDBooking", txtBooking.Text);
        com.Parameters.AddWithValue("dateBooking",Convert.ToDateTime(txtTanggal.Text));
        com.Parameters.AddWithValue("IDUser",Session["creaby"]);
        com.Parameters.AddWithValue("statusBooking", 2);
        com.Parameters.AddWithValue("ID_Dokter", ddlDokter.SelectedValue);
        com.Parameters.AddWithValue("Deskripsi",txtDeskripsi.Text);
       
        conn.Open();

        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();

        if (result > 0)
        {
            Response.Write("<script>alert('Booking berhasil dilakukan');</script>");
            Response.Redirect("Booking.aspx");
           
        }
        else
        {
            Response.Write("<script>alert('Booking Gagal');</script>");
        }

    }

    public string RandomString(int size, bool lowerCase)
    {
        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        char ch;
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch);
        }
        if (lowerCase)
            return builder.ToString().ToLower();
        return builder.ToString();
    }

    protected void ddlJenisE_TextChanged(object sender, EventArgs e)
    {

    }



    protected void gridBooking_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gridBooking_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void gridBooking_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridBooking_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = gridBooking.Rows[e.RowIndex].Cells[7];
        string cells = cell.Text;

        SqlCommand com = new SqlCommand();
        com.Connection = conn;

        string id = gridBooking.DataKeys[e.RowIndex].Value.ToString();
        com.CommandText = "[sp_DeleteBooking]";


        com.Parameters.AddWithValue("@IDBooking", id);
        com.Parameters.AddWithValue("@status", cells);
        com.CommandType = CommandType.StoredProcedure;

        conn.Open();
        int result = Convert.ToInt32(com.ExecuteNonQuery());
        conn.Close();
        if (result > 0)
        {
            gridBooking.EditIndex = -1;
            Response.Redirect("Booking.aspx");

        }
        else
        {

        }

    }

    protected void gridBooking_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void gridBooking_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
}