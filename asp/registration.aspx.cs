using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class registration : System.Web.UI.Page
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
            }
        }
    }
    protected void btn_registeration_save_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        GetCode();
        SqlCommand cmd = new SqlCommand("USP_USER_MASTER", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "INSERT_USER");
        cmd.Parameters.AddWithValue("@user_code", hfUserCode.Value);
        cmd.Parameters.AddWithValue("@name", txtName.Text);
        cmd.Parameters.AddWithValue("@DOB", txtdob.Text);
        cmd.Parameters.AddWithValue("@email_id", txtEmail.Text);
        cmd.Parameters.AddWithValue("@password", txtPasswordConfirm.Text);
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
                        Response.Write("<script>alert('Registered sucesfully.')</script>");
                        txtName.Text = "";
                        txtdob.Text = "";
                        txtEmail.Text = "";
                        txtMobile.Text = "";
                        rblGender.ClearSelection();
                        txtAddress.Text = "";
                        ddlCity.ClearSelection();
                        ddlState.ClearSelection();
                    }
                }
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
    private static int i = 0;
    public void GetCode()
    {

        i++;
        hfUserCode.Value = "STU" + (1000 + i).ToString();
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity();
    }
}