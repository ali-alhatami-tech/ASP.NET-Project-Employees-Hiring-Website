using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace project
{
    public partial class userProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user_profile = HttpContext.Current.Session["UserProfile"] as string;

            if (user_profile == null)
            {
                Response.Redirect("index.aspx");
            }
                Class1.conn.Close();

            //show the reviews
            Class1.conn.Open();
            SqlDataAdapter rate_date = new SqlDataAdapter("SELECT * FROM rate WHERE profile_id = @username", Class1.conn);
            rate_date.SelectCommand.Parameters.AddWithValue("@username", user_profile);
            DataTable rate_show = new DataTable();
            rate_date.Fill(rate_show);
            int number_rate = 0;
            if (rate_show.Rows.Count > 0)
            {
                for (int i = 0; i < rate_show.Rows.Count; i++)
                {
                    number_rate += Convert.ToInt32(rate_show.Rows[i]["rate"]);
                }

                double rate_result = number_rate / (double)rate_show.Rows.Count;
                reviews.Text = rate_result.ToString("F2") + " (" + rate_show.Rows.Count  + " Reviews)";
            }
            else
            {
                reviews.Text = "0 (0 Reviews)";
            }
            Class1.conn.Close();

            //end show the reviews
            DataTable dt = new DataTable();
                using (SqlDataAdapter ad = new SqlDataAdapter("select * from project where username_id = '" + user_profile + "'", Class1.conn))
                {
                    ad.Fill(dt);
                }

                if (dt.Rows.Count > 0)
                {
                    repeater1.DataSource = dt;
                    repeater1.DataBind();
                no_res_project.Visible = false;
                }
                else
                {
                    repeater1.DataSource = null;
                no_res_project.Visible = true;
                }


            Class1.conn.Open();
            SqlDataAdapter add = new SqlDataAdapter("select * from profile where Username = '" + user_profile + "' ", Class1.conn);
            DataTable dtt = new DataTable();
            add.Fill(dtt);

            info_txt_name.Text = dtt.Rows[0]["Name"].ToString();
            info_image.ImageUrl = dtt.Rows[0]["image"].ToString();
            dateT.Text = dtt.Rows[0]["date"].ToString();
            C_C_Ph.Text = dtt.Rows[0]["Country"] +", "  + dtt.Rows[0]["City"] + " :  "+ dtt.Rows[0]["PhoneNumber"];
            info_desc.Text = dtt.Rows[0]["description"].ToString();
            job.Text = dtt.Rows[0]["Job"].ToString();



            Class1.conn.Close();


            //show comments
            string query = "SELECT p.image, p.Name, p.Country, p.City, p.Job, r.date, r.rate, r.comment_name " +
                           "FROM profile p " +
                           "INNER JOIN rate r ON p.Username = r.username_id " +
                           "WHERE r.profile_id = '" + user_profile + "'";
            Class1.conn.Open();

            SqlDataAdapter username = new SqlDataAdapter(query, Class1.conn);

            DataTable dtt_user = new DataTable();
            username.Fill(dtt_user);
            if(dtt_user.Rows.Count > 0)
            {
            Repeater2.DataSource = dtt_user;
            Repeater2.DataBind();
                resuilt_rate.Visible = false;
            }
            else
            {
                resuilt_rate.Visible = true;
                Repeater2.DataSource = null;

            }


            Class1.conn.Close();



        }

        protected void info_desc_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user_profile = HttpContext.Current.Session["UserProfile"] as string;
            string username = HttpContext.Current.Session["Username"] as string;

            Class1.conn.Close();

            if (w_rate.Text == "")
            {
                Label20.Text = "Required a Comment...";
            }
            else
            {
                Label20.Text = "";
                //show the all the rate for the user
              Class1.conn.Open();
              SqlDataAdapter add = new SqlDataAdapter("select * from rate where profile_id = '" + user_profile + "'  ", Class1.conn);
              DataTable dtt = new DataTable();
              add.Fill(dtt);
              Class1.conn.Close();
                bool j = true;
                for(int i = 0; i < dtt.Rows.Count; i++)
                {
                    if(dtt.Rows[i]["username_id"].ToString().Trim() == username.Trim())
                    {
                        j = false;
                        //break;
                    }
                    else
                    {
                        j = true;
                    }
                    
                    
                }

                if(j == true)
                {

                Class1.conn.Open();
                SqlCommand cmd = new SqlCommand(
                     "INSERT INTO rate VALUES " +
                     "(@comment_name, @username_id, @profile_id, @rate, @date)",
                     Class1.conn);


                cmd.Parameters.AddWithValue("@comment_name", w_rate.Text);
                cmd.Parameters.AddWithValue("@username_id", username);
                cmd.Parameters.AddWithValue("@profile_id", user_profile);
                cmd.Parameters.AddWithValue("@rate", DropDownList1.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@date", DateTime.Today);
                


                cmd.ExecuteNonQuery();
                w_rate.Text = "";
                Response.Redirect(Request.Url.AbsoluteUri);
                    Response.Write("insert");
                Class1.conn.Close();
                }
                else
                {
                    Class1.conn.Open();
                    SqlCommand cmd = new SqlCommand(
                       "UPDATE rate SET comment_name = @comment_name, rate = @rate, date = @date " +
                       "WHERE username_id = @username_id and profile_id = @profile_id",
                       Class1.conn);

                    cmd.Parameters.AddWithValue("@comment_name", w_rate.Text);
                    cmd.Parameters.AddWithValue("@username_id", username);
                    cmd.Parameters.AddWithValue("@profile_id", user_profile);
                    cmd.Parameters.AddWithValue("@rate", DropDownList1.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@date", DateTime.Today);

                    cmd.ExecuteNonQuery();
                    w_rate.Text = "";
                    Response.Redirect(Request.Url.AbsoluteUri);
                    Response.Write("update");
                    Class1.conn.Close();
                }

            }
        }

        protected void w_rate_TextChanged(object sender, EventArgs e)
        {

        }
    }
}