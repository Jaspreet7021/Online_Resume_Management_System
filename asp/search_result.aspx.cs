using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class search_result : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("USP_DDL_SELECT", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_CITY_HAVING_DATA");
        cmd.Parameters.AddWithValue("@location", Request.QueryString["cid"].ToString().Replace("-", " "));
        cmd.Parameters.AddWithValue("@type_of_internship", Request.QueryString["tid"].ToString().Replace("-"," "));
        cmd.Parameters.AddWithValue("@profile", txtSearch.Text.Replace("-", " "));
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rprCompanyDetails.DataSource = ds.Tables[0];
                    rprCompanyDetails.DataBind();
                }
            }
        }
    }
    protected void btnSearh_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_DDL_SELECT", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_CITY_HAVING_DATA");
        cmd.Parameters.AddWithValue("@location", txtInternshipLocation.Text);
        cmd.Parameters.AddWithValue("@type_of_internship", ddlSearchInternShipType.SelectedValue.ToString());
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("search_result.aspx?cid=" + txtInternshipLocation.Text.Replace(" ", "-") + "&" + "tid=" + ddlSearchInternShipType.SelectedValue.ToString().Replace(" ", "-"));
                }
            }
        }
    }
}