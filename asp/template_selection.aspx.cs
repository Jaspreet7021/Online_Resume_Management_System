using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class template_selection : System.Web.UI.Page
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
        }
    }
    protected void btnTemplate1_Click(object sender, EventArgs e)
    {
        StreamReader reader = new StreamReader(Server.MapPath("~/HtmlPage3.html"));
        {
            string readfile = reader.ReadToEnd();
            string msg = "";
            msg = readfile;
            msg = msg.Replace("$$name$$", Session["_NAME"].ToString());
            msg = msg.Replace("$$mobile$$", Session["_MOBILE"].ToString());
            msg = msg.Replace("$$email_id$$", Session["_EMAIL"].ToString());
            msg = msg.Replace("$$education$$", Session["_EDUCATION"].ToString());
            msg = msg.Replace("$$skills$$", Session["_SKILLS"].ToString());
            msg = msg.Replace("$$training$$", Session["_TRAINING"].ToString());
            msg = msg.Replace("$$certificate$$", Session["_CERTIFICATION"].ToString());
            msg = msg.Replace("$$project$$", Session["_PROJECT"].ToString());
            msg = msg.Replace("$$technicalknowledge$$", Session["_PROFFSUMMARY"].ToString());
            msg = msg.Replace("$$additionaldetails$$", Session["_ADDETAILS"].ToString());
            msg = msg.Replace("$$hobbies$$", Session["_HOBBIES"].ToString());
            msg = msg.Replace("$$language$$", Session["_LANGUAGE"].ToString());
            msg = msg.Replace("$$objective$$", Session["_OBJECTIVE"].ToString());
            msg = msg.Replace("$$strengths$$", Session["_STRENGTHS"].ToString());
            try
            {
                StreamWriter writer = new StreamWriter(Server.MapPath("~/HtmlPage2.html"));
                writer.Write(msg);
                writer.Close();
                Response.Redirect("HtmlPage2.html");
            }
            catch (IOException io)
            {

                Response.Write(io);
            }

        }
    }
}