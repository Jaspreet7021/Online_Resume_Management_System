using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class dashboard : System.Web.UI.Page
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
                
                 BindGender();
                 BindCountry();
                 BindState();
                 ShowData();
            }
        }
    }

    public void BindGender()
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_GENDER_MASTER", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_GENDER");
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rblGender.DataSource = ds.Tables[0];
                    rblGender.DataBind();
                }
            }
        }

    }
    public void BindCountry()
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_DDL_SELECT", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_COUNTRY");
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlCountry.DataSource = ds.Tables[0];
                    ddlCountry.DataBind();

                }
            }
        }

    }
    public void BindState()
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_DDL_SELECT", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_STATE");
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlState.DataSource = ds.Tables[0];
                    ddlState.DataBind();
                    ddlState.Items.Insert(0, "Select state");
                    ddlCity.Items.Insert(0, "Select city");
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
                    ddlCity.DataSource = ds.Tables[0];
                    ddlCity.DataBind();
                    ddlCity.Items.Insert(0, "Select city");
                }
            }
        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_USER_MASTER", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "UPDATE_USER");
        cmd.Parameters.AddWithValue("@user_code", Session["_USERCODE"].ToString());
        cmd.Parameters.AddWithValue("@name", txtName.Text);
        cmd.Parameters.AddWithValue("@DOB", txtdob.Text);
        cmd.Parameters.AddWithValue("@email_id", txtEmail.Text);
        cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
        cmd.Parameters.AddWithValue("@gender_id", rblGender.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@country_id", ddlCountry.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@state_id", ddlState.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@city_id", ddlCity.SelectedValue.ToString());
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
                        Response.Write("<script>alert('Updated Sucesfully.')</script>");
                        //txtName.Text = "";
                        //txtdob.Text = "";
                        //txtEmail.Text = "";
                        //txtMobile.Text = "";
                        //rblGender.ClearSelection();
                        //txtAddress.Text = "";
                        //ddlCity.ClearSelection();
                        //ddlState.ClearSelection();
                    }
                }
            }
        }

    }
    protected void btnInsertResume_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_USER_MASTER", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "UPDATE_RESUME");
        cmd.Parameters.AddWithValue("@user_code", Session["_USERCODE"].ToString());
        cmd.Parameters.AddWithValue("@education", ckEducation.Text.ToString());
        cmd.Parameters.AddWithValue("@language", txtLanguage.Text);
        cmd.Parameters.AddWithValue("@skills", ckSkills.Text.ToString());
        cmd.Parameters.AddWithValue("@professional_summary", ckTechnical.Text.ToString());
        cmd.Parameters.AddWithValue("@certificate", ckCertificate.Text.ToString());
        cmd.Parameters.AddWithValue("@project", ckProject.Text.ToString());
        cmd.Parameters.AddWithValue("@training", ckTraining.Text.ToString());
        cmd.Parameters.AddWithValue("@additional_details", ckAdditionalDetails.Text.ToString());
        cmd.Parameters.AddWithValue("@hobbies", txtHobbies.Text);
        cmd.Parameters.AddWithValue("@strengths", ckStrengths.Text.ToString());
        cmd.Parameters.AddWithValue("@objective", ckObjective.Text.ToString());
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0][0].ToString() == "SUCCESS")
                {
                    Response.Write("<script>alert('Inserted Succesfully')</script>");
                    btnInsertResume.Text = "Update";
                }
            }
        }

    }
    public void ShowData()
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_USER_MASTER", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SELECT_USER_WITH_USER_CODE");
        cmd.Parameters.AddWithValue("@user_code", Session["_USERCODE"].ToString());
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblName.Text = ds.Tables[0].Rows[0]["name"].ToString();

                    ckEducation.Text = ds.Tables[0].Rows[0]["education"].ToString();
                    txtLanguage.Text = ds.Tables[0].Rows[0]["language"].ToString();
                    ckAdditionalDetails.Text = ds.Tables[0].Rows[0]["additional_details"].ToString();
                    ckCertificate.Text = ds.Tables[0].Rows[0]["certificate"].ToString();
                    txtHobbies.Text = ds.Tables[0].Rows[0]["hobbies"].ToString();
                    ckTechnical.Text = ds.Tables[0].Rows[0]["professional_summary"].ToString();
                    ckProject.Text = ds.Tables[0].Rows[0]["project"].ToString();
                    ckSkills.Text = ds.Tables[0].Rows[0]["skills"].ToString();
                    ckTraining.Text = ds.Tables[0].Rows[0]["training"].ToString();

                    txtName.Text = ds.Tables[0].Rows[0]["name"].ToString();
                    txtEmail.Text = ds.Tables[0].Rows[0]["email_id"].ToString();
                    txtdob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                    txtMobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                    txtAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                    ckObjective.Text = ds.Tables[0].Rows[0]["objective"].ToString();
                    ckStrengths.Text = ds.Tables[0].Rows[0]["strengths"].ToString();

                    string state = string.Empty;
                    state = ds.Tables[0].Rows[0]["state"].ToString();
                    ddlState.Items.FindByText(state).Selected = true;

                    BindCity();
                    string city = string.Empty;
                    city = ds.Tables[0].Rows[0]["city"].ToString();
                    ddlCity.Items.FindByText(city).Selected = true;

                    rblGender.SelectedValue = ds.Tables[0].Rows[0]["gender_id"].ToString();
                }
            }
        }
    
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["_NAME"] = txtName.Text;
        Session["_EMAIL"] = txtEmail.Text;
        Session["_MOBILE"] = txtMobile.Text;
        Session["_EDUCATION"] = ckEducation.Text.ToString();
        Session["_SKILLS"] = ckSkills.Text.ToString();
        Session["_TRAINING"] = ckTraining.Text.ToString();
        Session["_PROJECT"] = ckProject.Text.ToString();
        Session["_CERTIFICATION"] = ckCertificate.Text.ToString();
        Session["_ADDETAILS"] = ckAdditionalDetails.Text.ToString();
        Session["_HOBBIES"] = txtHobbies.Text;
        Session["_LANGUAGE"] = txtLanguage.Text;
        Session["_STRENGTHS"] = ckStrengths.Text.ToString();
        Session["_PROFFSUMMARY"] = ckTechnical.Text.ToString();
        Session["_OBJECTIVE"] = ckObjective.Text.ToString();
        Response.Redirect("template_selection.aspx");
    }
}