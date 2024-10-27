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
    public partial class index1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = HttpContext.Current.Session["Username"] as string;

            if (username == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {

            if (!IsPostBack)
            {
                //  Class1.conn.Open();
                //  SqlCommand cmd = new SqlCommand("select image from profile where id = 14 ", Class1.conn);
                //  SqlDataReader read = cmd.ExecuteReader();
                //  if (read.Read())
                //  {
                //      string imagePath = read["image"].ToString();
                //      Image1.ImageUrl = read["image"].ToString();
                //  }
                //  Class1.conn.Close();

                SqlDataAdapter ad = new SqlDataAdapter("select * from profile where Username = '" + username + "' ", Class1.conn);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                Image1.ImageUrl = dt.Rows[0]["image"].ToString();
                Label1.Text = dt.Rows[0]["name"].ToString();




                    ///////////////////

                    SqlDataAdapter shape_data = new SqlDataAdapter("select * from profile order by id ", Class1.conn);
                    DataTable dd = new DataTable();
                    shape_data.Fill(dd);

                    Repeater1.DataSource = dd;
                    Repeater1.DataBind();
                    /*

                    SqlDataAdapter shape_data = new SqlDataAdapter("select * from profile", Class1.conn);
                    DataTable dd = new DataTable();
                    shape_data.Fill(dd);

                    // Find the ASP.NET controls within the shape div
                    Label label8 = (Label)FindControl("Label8");
                    Image image4 = (Image)FindControl("Image4");
                    Label label9 = (Label)FindControl("Label9");
                    Label label14 = (Label)FindControl("Label14");
                    Label label15 = (Label)FindControl("Label15");
                    
                    

               for(int i = 0; i < dd.Rows.Count; i++)
                  { 
                    if (label8 != null && image4 != null && label9 != null && label14 != null && label15 != null)
                    {
                        // Assign the values from the DataTable to the controls

                        label8.Text = dd.Rows[i]["Country"].ToString();
                        image4.ImageUrl = dd.Rows[i]["image"].ToString();
                        label9.Text = dd.Rows[i]["Name"].ToString();
                        label14.Text = dd.Rows[i]["Job"].ToString();
                        label15.Text = dd.Rows[i]["description"].ToString();
                    }
                        }

                     */


                    ////////////////////

                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void shape_button_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;

            
            string username = btn.CommandArgument;
            
            string user_profile = username;
            HttpContext.Current.Session["UserProfile"] = user_profile;

            //Class1.user_profile = username;
            Response.Redirect("userProfile.aspx");
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btn_programmer_Click(object sender, EventArgs e)
        {
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Class1.search_name = TextBox1.Text.Trim();
            Response.Redirect("search.aspx");
            
        }

        protected void btn_teacher_Click(object sender, EventArgs e)
        {

        }

        protected void btn_teacher_Command(object sender, CommandEventArgs e)
        {
                        
            Class1.search = e.CommandArgument.ToString().Trim();
            Class1.search_name = null;
            Response.Redirect("search.aspx");

        }
    }
}