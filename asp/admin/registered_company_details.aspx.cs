using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_registered_company_details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"data source=LAPTOP-ICB68L9D; initial catalog=db_resume_management; user=sa; password=tiger123;");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State.ToString()=="Open")
        {
            con.Close();
        }
        else
        {
            con.Open();
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }
    }

    public void BindRepeater()
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("[USP_COMPANY_MASTER]", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_REGISTERED_COMPANY");
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rprComapnyRecords.DataSource = ds.Tables[0];
                    rprComapnyRecords.DataBind();
                }
            }
        }
    }
}