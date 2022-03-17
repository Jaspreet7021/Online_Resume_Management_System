using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_company_details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"data source=LAPTOP-ICB68L9D;initial catalog=db_resume_management; user=sa; password=tiger123;");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State.ToString()=="Open")
        {
            con.Close();
        }
        else
        {
            con.Open();
        }
        if(!IsPostBack)
        {
            BindCity();
            QueryString();
        }

    }
    protected void btnCompanyRegistartion_Click(object sender, EventArgs e)
    {
        if (btnCompanyRegistartion.Text=="Update")
        {
            string dbSave = string.Empty;
            if (fuCompLogo.HasFile)
            {
                string str = System.DateTime.Now.ToString("MMddyyyy hhmmss");
                str = str.Replace(" ", "");
                string image = Server.MapPath("/images/") + str + fuCompLogo.FileName;
                dbSave = "/image/" + str + fuCompLogo.FileName;
                fuCompLogo.SaveAs(image);
            }
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "UPDATE_COMPANY_DETAILS");
            cmd.Parameters.AddWithValue("@comp_code", hfCompCode.Value);
            cmd.Parameters.AddWithValue("@name", txtCompName.Text);
            cmd.Parameters.AddWithValue("@email_id", txtCompEmail.Text);
            cmd.Parameters.AddWithValue("@logo", dbSave);
            cmd.Parameters.AddWithValue("@about_company", txtAboutComapny.Text);
            cmd.Parameters.AddWithValue("@phone", txtCompPhone.Text);
            cmd.Parameters.AddWithValue("@city_id", ddlCompCity.SelectedValue);
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
                            Response.Write("<script>alert('Updated Succesfully')</script>");
                            btnCompanyRegistartion.Text = "Save";
                        }
                    }
                }
            }
        }
        else
        {
            GetCode();
            string dbSave = string.Empty;
            if (fuCompLogo.HasFile)
            {
                string str = System.DateTime.Now.ToString("MMddyyyy hhmmss");
                str = str.Replace(" ", "");
                string image = Server.MapPath("/images/") + str + fuCompLogo.FileName;
                dbSave = "/image/" + str + fuCompLogo.FileName;
                fuCompLogo.SaveAs(image);
            }
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "INSERT_COMPANY_DETAILS");
            cmd.Parameters.AddWithValue("@comp_code", hfCompCode.Value);
            cmd.Parameters.AddWithValue("@name", txtCompName.Text);
            cmd.Parameters.AddWithValue("@email_id", txtCompEmail.Text);
            cmd.Parameters.AddWithValue("@logo", dbSave);
            cmd.Parameters.AddWithValue("@about_company", txtAboutComapny.Text);
            cmd.Parameters.AddWithValue("@phone", txtCompPhone.Text);
            cmd.Parameters.AddWithValue("@city_id", ddlCompCity.SelectedValue);
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
                            Response.Write("<script>alert('Inserted Succesfully')</script>");
                        }
                    }
                }
            }
        }
        
    }
    public void BindCity()
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_DDL_SELECT", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_CITY");
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlCompCity.DataSource = ds.Tables[0];
                    ddlCompCity.DataBind();
                    ddlCompCity.Items.Insert(0, "Select city");
                }
            }
        }

    }
    private static int i = 0;
    public void GetCode()
    {
        i++;
        hfCompCode.Value = "COM" + (1000 + i).ToString();
        
    }
    protected void btnCompanySkills_Click(object sender, EventArgs e)
    {
        if (btnCompanySkills.Text=="Update")
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "UPDATE_COMPANY_SKILL_DETAILS");
            cmd.Parameters.AddWithValue("@comp_code", hfCompCode.Value);
            cmd.Parameters.AddWithValue("@profile", txtProfile.Text);
            cmd.Parameters.AddWithValue("@type_of_internship", rblTypeOfInternship.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@location", txtLocation.Text);
            cmd.Parameters.AddWithValue("@start_date", txtStartDate.Text);
            cmd.Parameters.AddWithValue("@skills", txtSkillNeeded.Text);
            cmd.Parameters.AddWithValue("@perks", txtPerks.Text);
            cmd.Parameters.AddWithValue("@responsibilities", txtResponsibilities.Text);
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
                            Response.Write("<script>alert('Skills Updated Succesfully')</script>");
                            btnCompanySkills.Text = "Save";
                        }
                    }
                }
            }
        }
        else
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "INSERT_COMPANY_SKILL");
            cmd.Parameters.AddWithValue("@comp_code", hfCompCode.Value);
            cmd.Parameters.AddWithValue("@profile", txtProfile.Text);
            cmd.Parameters.AddWithValue("@type_of_internship", rblTypeOfInternship.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@location", txtLocation.Text);
            cmd.Parameters.AddWithValue("@start_date", txtStartDate.Text);
            cmd.Parameters.AddWithValue("@skills", txtSkillNeeded.Text);
            cmd.Parameters.AddWithValue("@perks", txtPerks.Text);
            cmd.Parameters.AddWithValue("@responsibilities", txtResponsibilities.Text);
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
                            Response.Write("<script>alert('Skills Inserted Succesfully')</script>");
                        }
                    }
                }
            }
        }
        
    }
    protected void btnInsertUrl_Click(object sender, EventArgs e)
    {
        if (btnInsertUrl.Text=="Update")
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "UPDATE_COMPANY_SOCIAL_URL_DETAILS");
            cmd.Parameters.AddWithValue("@comp_code", hfCompCode.Value);
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
                            Response.Write("<script>alert('Url Inserted Succesfully')</script>");
                            btnInsertUrl.Text = "Save";
                        }
                    }
                }
            }
        }
        else
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "INSERT_COMPANY_SOCIAL_URL");
            cmd.Parameters.AddWithValue("@comp_code", hfCompCode.Value);
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
                            Response.Write("<script>alert('Url Inserted Succesfully')</script>");
                        }
                    }
                }
            }   
        }
        
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        hfCompCode.Value = "";
        txtAboutComapny.Text = "";
        txtCompEmail.Text = "";
        txtCompName.Text = "";
        txtCompPhone.Text = "";
        txtFacebook.Text = "";
        txtInstagram.Text = "";
        txtLinkdeln.Text = "";
        txtLocation.Text = "";
        txtPerks.Text = "";
        txtProfile.Text = "";
        txtResponsibilities.Text = "";
        txtSkillNeeded.Text = "";
        txtStartDate.Text = "";
        txtWebsiteUrl.Text = "";
        txtYoutube.Text = "";
        rblTypeOfInternship.ClearSelection();
        ddlCompCity.ClearSelection();
    }
    public void QueryString()
    {
        if (Request.QueryString["uid"] != null)
        {
            string str = string.Empty;
            str = Request.QueryString["uid"].ToString();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("USP_COMPANY_MASTER", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "SELECT_COMPANY_WITH_CODE");
            cmd.Parameters.AddWithValue("@comp_code", str);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(ds);
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        hfCompCode.Value = ds.Tables[0].Rows[0]["comp_code"].ToString();
                        txtCompName.Text = ds.Tables[0].Rows[0]["name"].ToString();
                        txtCompEmail.Text = ds.Tables[0].Rows[0]["email_id"].ToString();
                        txtAboutComapny.Text = ds.Tables[0].Rows[0]["about_company"].ToString();
                        txtCompPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                        //fuCompLogo.v = ds.Tables[0].Rows[0]["linkdeln"].ToString();
                        BindCity();
                        string city = string.Empty;
                        city = ds.Tables[0].Rows[0]["city"].ToString();
                        ddlCompCity.Items.FindByText(city).Selected = true;
                        txtWebsiteUrl.Text = ds.Tables[0].Rows[0]["website_url"].ToString();
                        txtFacebook.Text = ds.Tables[0].Rows[0]["facebook"].ToString();
                        txtInstagram.Text = ds.Tables[0].Rows[0]["instagram"].ToString();
                        txtYoutube.Text = ds.Tables[0].Rows[0]["youtube"].ToString();
                        txtLinkdeln.Text = ds.Tables[0].Rows[0]["linkdeln"].ToString();

                        btnCompanyRegistartion.Text = "Update";
                        btnInsertUrl.Text = "Update";    
                    }
                }
            }
        }
    }
}