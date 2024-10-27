
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace project
{
   

    public partial class WebForm1 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
                Class1.conn.Close();
            string username = HttpContext.Current.Session["Username"] as string;

            if (username == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                //show the reviews
                try { 
                Class1.conn.Open();
                SqlDataAdapter rate_date = new SqlDataAdapter("SELECT * FROM rate WHERE profile_id = '"+username+"'", Class1.conn);
                //rate_date.SelectCommand.Parameters.AddWithValue("@username", username);
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


                } catch {
                
                    Response.Redirect("login.aspx");
                }
                //end show the reviews

                try
                {

                    DataTable dt = new DataTable();
                    using (SqlDataAdapter ad = new SqlDataAdapter("select * from project where username_id = '" + username + "'", Class1.conn))
                    {
                        ad.Fill(dt);
                    }

                    if (dt.Rows.Count > 0)
                    {
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                    }
                    else
                    {
                        Repeater1.DataSource = null;
                    }

                }
                catch
                {
                    Response.Redirect("login.aspx");
                }
            }

             try
             {
           
            if (!IsPostBack)
            {

                Class1.conn.Open();
                SqlCommand command = new SqlCommand("select * from Countries ORDER BY CountryName ASC", Class1.conn);
                SqlDataReader reader = command.ExecuteReader();

                DDL_country.DataSource = reader;
                DDL_country.DataBind();
                Class1.conn.Close();

                //end show country


                Class1.conn.Open();
                SqlDataAdapter add = new SqlDataAdapter("select * from profile where Username = '" + username + "' ", Class1.conn);
                DataTable dtt = new DataTable();
                add.Fill(dtt);

                Image1.ImageUrl = dtt.Rows[0]["image"].ToString();
                Label1.Text = dtt.Rows[0]["Name"].ToString().Trim();

                info_name.Text = dtt.Rows[0]["Name"].ToString().Trim();
                info_txt_name.Text = dtt.Rows[0]["Name"].ToString().Trim();
                info_phone.Text = dtt.Rows[0]["PhoneNumber"].ToString().Trim();
                info_username.Text = dtt.Rows[0]["Username"].ToString().Trim();
                info_password.Text = dtt.Rows[0]["Password"].ToString().Trim();
                info_image.ImageUrl = dtt.Rows[0]["image"].ToString();
                dateT.Text = dtt.Rows[0]["date"].ToString();
                info_desc.Text = dtt.Rows[0]["description"].ToString().Trim();


                
              DDL_country.SelectedItem.Text = dtt.Rows[0]["Country"].ToString().Trim();
              DDL_city.Items.Insert(0, dtt.Rows[0]["City"].ToString());

            Class1.conn.Close();


            string job = dtt.Rows[0]["Job"].ToString().Trim();
                if ( job == "Programmer")
                 {
                     DropDownList1.SelectedIndex = 0;
                 }
                 else if(job == "Teacher")
                 {
                     DropDownList1.SelectedIndex = 1;
               
                 }
                 else if(job == "Designer")
                 {
                     DropDownList1.SelectedIndex = 2;
               
                 }
                else if( job == "Photography")
                {
                    DropDownList1.SelectedIndex = 3;

                }

                string gender = dtt.Rows[0]["Gender"].ToString().Trim();
                if (gender == "Male")
                {
                    RadioButton1.Checked = true;
                }
                else
                {
                    RadioButton2.Checked = true;
                }
            }
          }
          catch
          {
              Response.Redirect("login.aspx");
          }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

          
        }

            protected void Button3_Click(object sender, EventArgs e)
        {
            if(TextBox2.Text == "")
            {
                Label20.Text = "Required Descrbation";
            }
            else
            {
                Label20.Text = "";
            }

            string username = HttpContext.Current.Session["Username"] as string;

            if (FileUpload2.HasFile && Path.GetExtension(FileUpload2.FileName) == ".jpg" && TextBox2.Text != "")
            {
               
                //get image to folder
                string imagePath = "~/project/";
                string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(FileUpload2.FileName);
                FileUpload2.SaveAs(Server.MapPath(imagePath + uniqueFileName));
                string imageFilePath = imagePath + uniqueFileName;

                //end get image to folder

                Class1.conn.Open();

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO project VALUES " +
                "(@project_name, @project_image,@username_id)",
                Class1.conn);


            cmd.Parameters.AddWithValue("@project_name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@project_image", imageFilePath);
            cmd.Parameters.AddWithValue("@username_id", username);
            
            cmd.ExecuteNonQuery();

                TextBox2.Text = "";
                Label19.Text = "";
            Class1.conn.Close();
            }
            //end
            
            if(!FileUpload2.HasFile)    
            {
                Label19.Text = "Choose Image ";
            } 
            else if(Path.GetExtension(FileUpload2.FileName) != ".jpg")
            {
                    Label19.Text = " Only .jpg is allowed ";
            }
            else
            {
                Label19.Text = "";
            }
                //show in repeater 
                SqlDataAdapter ad = new SqlDataAdapter("select * from project where username_id = '" + username + "' ", Class1.conn);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }

            
        }
        protected void shape_button_Click(object sender, EventArgs e)
        {
            string username = HttpContext.Current.Session["Username"] as string;

            Button btn = (Button)sender;
             string id = btn.CommandArgument;
           
                Class1.conn.Open();

                SqlCommand delete_id = new SqlCommand("DELETE FROM project WHERE id = @Id", Class1.conn);
                delete_id.Parameters.AddWithValue("@Id", id);
                delete_id.ExecuteNonQuery();

                string script = $"alert('Row deleted:');";
                ScriptManager.RegisterStartupScript(this, GetType(), "DeleteRowScript", script, true);

                Class1.conn.Close(); 
            
            //show in repeater
            Class1.conn.Open();
            SqlDataAdapter ad = new SqlDataAdapter("select * from project where username_id = '" + username + "' ", Class1.conn);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            Class1.conn.Close();



        }

        

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void DDL_country_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = DDL_country.SelectedValue;
            Class1.conn.Open();
            SqlCommand command = new SqlCommand("select * from Cities where CountryId = '" + id + "' ORDER BY CityName ASC ", Class1.conn);
            SqlDataReader reader = command.ExecuteReader();
            DDL_city.Items.Clear();
            DDL_city.DataSource = reader;
            DDL_city.DataBind();
            Class1.conn.Close();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string username = HttpContext.Current.Session["Username"] as string;

            Class1.conn.Open();
            SqlDataAdapter add = new SqlDataAdapter("select * from profile where Username = '" + username + "' ", Class1.conn);
            DataTable dtt = new DataTable();
            add.Fill(dtt);
            Class1.conn.Close();
            string image;
            if (FileUpload1.HasFile)
            {

                //get image to folder
                string imgPath = "~/uploads/";
                string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath(imgPath + uniqueFileName));
                image = imgPath + uniqueFileName;
                //end get image to folder

            }
            else
            {
                image = dtt.Rows[0]["image"].ToString();
            }

            //check username

            SqlDataAdapter ad = new SqlDataAdapter("select * from profile where Username = '" + info_username.Text + "'   ", Class1.conn);
            DataTable dt = new DataTable();
            ad.Fill(dt);
             if(info_username.Text == username)
            {

                checkUsername.Text = "";
            }
            else if (dt.Rows.Count > 0 )
            {
                checkUsername.Text = "UserName is already Used";
            }
            else
            {
                checkUsername.Text = "";

            }
            //end check username

            if ( checkUsername.Text == "" && info_name.Text != "" && info_phone.Text != "" && info_username.Text != "" && info_password.Text != "")
            {

            Class1.conn.Open();

            SqlCommand cmd = new SqlCommand("update profile set  Name = @Name, PhoneNumber = @phoneNumber," +
                " Country = @Country, City = @City, Job = @Job, Username = @Username, Password = @Password," +
                " Gender = @Gender, description = @description," +
                " image = @image where userName = '" + username + "'", Class1.conn);

            string gender = RadioButton1.Checked ? "Male" : "Female";

           // cmd.Parameters.AddWithValue("@id", dtt.Rows[0]["id"]);
            cmd.Parameters.AddWithValue("@Name", info_name.Text);
            cmd.Parameters.AddWithValue("@phoneNumber", info_phone.Text);
            cmd.Parameters.AddWithValue("@Country", DDL_country.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@City", DDL_city.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Job", DropDownList1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Username", info_username.Text);
            cmd.Parameters.AddWithValue("@Password", info_password.Text);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@description", info_desc.Text);
            cmd.Parameters.AddWithValue("@image", image);
            cmd.Parameters.AddWithValue("@date", dtt.Rows[0]["date"]);

            cmd.ExecuteNonQuery();
                errors.Text = " ";
                Response.Write("seccuful Update");
                Class1.conn.Close();









                Class1.conn.Open();
                SqlDataAdapter addd = new SqlDataAdapter("select * from profile where Username = '" + username + "' ", Class1.conn);
                DataTable dttt = new DataTable();
                addd.Fill(dttt);

                Image1.ImageUrl = dttt.Rows[0]["image"].ToString();
                Label1.Text = dttt.Rows[0]["Name"].ToString().Trim();

                info_name.Text = dttt.Rows[0]["Name"].ToString().Trim();
                info_txt_name.Text = dttt.Rows[0]["Name"].ToString().Trim();
                info_phone.Text = dttt.Rows[0]["PhoneNumber"].ToString().Trim();
                info_username.Text = dttt.Rows[0]["Username"].ToString().Trim();
                info_password.Text = dttt.Rows[0]["Password"].ToString().Trim();
                info_image.ImageUrl = dttt.Rows[0]["image"].ToString();
                dateT.Text = dttt.Rows[0]["date"].ToString();
                info_desc.Text = dttt.Rows[0]["description"].ToString().Trim();



                DDL_country.SelectedItem.Text = dttt.Rows[0]["Country"].ToString().Trim();
                DDL_city.Items.Insert(0, dttt.Rows[0]["City"].ToString());

                Class1.conn.Close();







            }
            else
            {
                errors.Text = "Missing Details";
            }
        }

        protected void info_password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void info_desc_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string username = HttpContext.Current.Session["Username"] as string;

            Class1.conn.Open();
            SqlCommand delete = new SqlCommand("delete from profile where Username = '" + username + "'", Class1.conn);
            delete.ExecuteNonQuery();
            Class1.conn.Close();
            Response.Redirect("login.aspx");
            
        }

        protected void info_username_TextChanged(object sender, EventArgs e)
        {

        }
    }
}