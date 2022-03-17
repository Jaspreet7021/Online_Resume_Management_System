using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"data source=LAPTOP-ICB68L9D; initial catalog=db_resume_management; user=sa; password=tiger123;");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State.ToString() == "Open")
        {
            con.Close();
        }
        else
        {
            con.Open();
            
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand("USP_LOGIN_MASTER", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ON_LOGIN");
        cmd.Parameters.AddWithValue("@email_id", txtUserName.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0][0].ToString()=="SUCCESS")
                    {
                        Session["_USERCODE"] = ds.Tables[0].Rows[0]["user_code"].ToString();
                        if (Session["_USERCODE"].ToString().Contains("ADM"))
                        {
                            Response.Redirect("admin/create_user_resume.aspx");
                        }
                        else
                        {
                            Response.Redirect("dashboard.aspx");
                        }
                        
                    }
                    else
                    {
                        Response.Write("<script>alert('" + ds.Tables[0].Rows[0][0].ToString() + "')</script>");
                    }
                }
            }
        }
    }
}