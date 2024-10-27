using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace project
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAdapter shape_data;
                
                if(Class1.search_name != null)
                {
                  shape_data = new SqlDataAdapter("select * from profile where Name LIKE '%" + Class1.search_name + "%'", Class1.conn);

                }
                else if (Class1.search == null)
                {

                  shape_data = new SqlDataAdapter("select * from profile", Class1.conn);
                }
                else
                {
                  shape_data = new SqlDataAdapter("select * from profile where Job = '"+Class1.search+"'", Class1.conn);

                }
                DataTable dd = new DataTable();
                shape_data.Fill(dd);

                Repeater1.DataSource = dd;
                Repeater1.DataBind();


                
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void shape_button_Click(object sender, EventArgs e)
        {


            Button btn = (Button)sender;

            string username = btn.CommandArgument;
            HttpContext.Current.Session["UserProfile"] = username;
            //Class1.Profile_user;


            
            Response.Redirect("userProfile.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            

           SqlDataAdapter shape_data = new SqlDataAdapter("select * from profile where Name LIKE '%" + TextBox1.Text.Trim() + "%'", Class1.conn);
            DataTable dd = new DataTable();
            shape_data.Fill(dd);
            if(dd.Rows.Count > 0)
            {

            Repeater1.Visible = true;
               Label3.Visible = false;
            Repeater1.DataSource = null;
            Repeater1.DataSource = dd;
            Repeater1.DataBind();
            }
            else
            {
            Repeater1.DataSource = null;
            Repeater1.Visible = false;
               Label3.Visible = true;
            }
        }

        protected void Button2_Command(object sender, CommandEventArgs e)
        {
           
           SqlDataAdapter shape_data = new SqlDataAdapter("select * from profile where Job = '" + e.CommandArgument.ToString().Trim() + "'", Class1.conn);

            DataTable dd = new DataTable();
            shape_data.Fill(dd);


            if (dd.Rows.Count > 0)
            {

                Repeater1.Visible = true;
                Label3.Visible = false;
                Repeater1.DataSource = null;
                Repeater1.DataSource = dd;
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.Visible = false;
                Label3.Visible = true;
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

        }
    }
}