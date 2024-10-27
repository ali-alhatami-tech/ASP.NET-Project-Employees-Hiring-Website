using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
namespace project
{
    public partial class index : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
Class1.conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //try { 
              Class1.conn.Open();
            SqlDataAdapter ad = new SqlDataAdapter("select * from profile where Username = '" + TextBox1.Text + "' and Password = '" + TextBox2.Text + "'  ", Class1.conn);

            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                
                //Class1.username = TextBox1.Text;
                string username = TextBox1.Text;
                HttpContext.Current.Session["Username"] = username;
                Response.Redirect("index.aspx");


            }
            else
            {
                Label3.Text = "Wrong password or useraneme";
            }

            Class1.conn.Close();
           // }catch {
           
            // Response.Redirect("login.aspx");
           // }
        }
    }
}