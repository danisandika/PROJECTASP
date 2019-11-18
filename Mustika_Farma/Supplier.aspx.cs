using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Supplier : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Apotek"].ConnectionString);
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtTanggal.Text = DateTime.Now.ToString("dd-MM-yyyy");
            txtTanggal.Enabled = false;

        }
    }

    protected void btnCancelAdd_Click(object sender, EventArgs e)
    {

    }


    protected void btnAdd_Click1(object sender, EventArgs e)
    {
        string uname = txtNamaSupplier.Text.ToUpper();
        SqlDataAdapter dataAdapter = new SqlDataAdapter();
        System.Data.SqlClient.SqlParameter param;
        int nilai = 1;



        try
        {
            // insert command
            SqlCommand insertCmd = new SqlCommand("[sp_InputSupplier]", con);
            insertCmd.CommandType = CommandType.StoredProcedure;

            param = insertCmd.Parameters.Add("@NamaSupplier", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = uname;

            param = insertCmd.Parameters.Add("@AlamatSupplier", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = txtAlamat.Text;


            param = insertCmd.Parameters.Add("@Email", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = txtEmail.Text;

            param = insertCmd.Parameters.Add("@NoHp", SqlDbType.VarChar);
            param.Direction = ParameterDirection.Input;
            param.Value = txtPhoneInsert.Text;

            param = insertCmd.Parameters.Add("@Status", SqlDbType.Int);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToInt16(nilai); 

            param = insertCmd.Parameters.Add("@CreateBy", SqlDbType.Int);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToInt16(nilai);
        // masih diakalin, karena belum buat login


            param = insertCmd.Parameters.Add("@CreateDate", SqlDbType.Date);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToDateTime(txtTanggal.Text);

            param = insertCmd.Parameters.Add("@ModifiedBy", SqlDbType.Int);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToInt16(nilai);

            param = insertCmd.Parameters.Add("@ModifiedDate", SqlDbType.Date);
            param.Direction = ParameterDirection.Input;
            param.Value = Convert.ToDateTime(txtTanggal.Text);
            con.Open();

            insertCmd.ExecuteNonQuery();

            Response.Write("<script>alert('Data Added!')</script>");
            con.Close();
            Server.Transfer("Supplier.aspx");

    }
        catch
        {
            con.Close();
          
        }
    }
}