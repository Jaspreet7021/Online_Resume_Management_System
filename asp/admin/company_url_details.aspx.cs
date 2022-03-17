using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_company_url_details : System.Web.UI.Page
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
                div_url.Visible = false;
                BindRepeater();
                QueryString();
                
            }
        }
    }
    public void BindRepeater()
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_COMPANY_URL");
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rprComapnyUrl.DataSource = ds.Tables[0];
                    rprComapnyUrl.DataBind();
                }
            }
        }
    }

    public void QueryString()
    {
        if (Request.QueryString["uid"] != null)
        {
            div_url.Visible = true;
            rprComapnyUrl.Visible = false;
            string str = string.Empty;
            str = Request.QueryString["uid"].ToString();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "SELECT_COMPANY_URL_WITH_CODE");
            cmd.Parameters.AddWithValue("@comp_code", str);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txtWebsiteUrl.Text = ds.Tables[0].Rows[0]["website_url"].ToString();
                        txtFacebook.Text = ds.Tables[0].Rows[0]["facebook"].ToString();
                        txtInstagram.Text = ds.Tables[0].Rows[0]["instagram"].ToString();
                        txtYoutube.Text = ds.Tables[0].Rows[0]["youtube"].ToString();
                        txtLinkdeln.Text = ds.Tables[0].Rows[0]["linkdeln"].ToString();

                        //btnCompanyRegistartion.Text = "Update";
                        //btnInsertUrl.Text = "Update";
                    }
                }
            }
        }
    }
    protected void btnUpdateUrl_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "UPDATE_COMPANY_SOCIAL_URL_DETAILS");
        cmd.Parameters.AddWithValue("@comp_code", Request.QueryString["uid"].ToString());
        cmd.Parameters.AddWithValue("@website_url", txtWebsiteUrl.Text);
        cmd.Parameters.AddWithValue("@facebook", txtFacebook.Text);
        cmd.Parameters.AddWithValue("@instagram", txtInstagram.Text);
        cmd.Parameters.AddWithValue("@linkdeln", txtLinkdeln.Text);
        cmd.Parameters.AddWithValue("@youtube", txtYoutube.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0][0].ToString() == "SUCCESS")
                    {
                        Response.Write("<script>alert('Url Updated Succesfully')</script>");
                        div_url.Visible = false;
                        BindRepeater();
                        rprComapnyUrl.Visible = true;
                    }
                }
            }
        }
    }
}