using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Data;
namespace project
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class1.conn.Close();
            try
            {

            if (!IsPostBack)
            {
                SqlCommand command = new SqlCommand("select * from Countries ORDER BY CountryName ASC", Class1.conn);
                Class1.conn.Open();

                SqlDataReader reader = command.ExecuteReader();

                DDLcountry.DataSource = reader;
                DDLcountry.DataBind();

                Class1.conn.Close();

                ListItem ss = new ListItem("--select--", "-1");

                DDLjobName.Items.Insert(0, ss);
                DDLcountry.Items.Insert(0, ss);
                DDLcity.Items.Insert(0, ss);

                Class1.conn.Close();

            }
            }catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //check username

            SqlDataAdapter ad = new SqlDataAdapter("select * from profile where Username = '" + userName.Text + "'   ", Class1.conn);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                
                Label11.Text = "UserName is already Used";
            }
            else
            {
                Label11.Text = "";
            }
            //end check username
            int length = FileUpload1.PostedFile.ContentLength;
            if (FileUpload1.HasFiles && length <= 5 * 1024 * 1024 && Path.GetExtension(FileUpload1.FileName) == ".jpg" && dt.Rows.Count == 0 )
            {
                if ( DDLcountry.SelectedIndex == 0 || DDLjobName.SelectedIndex == 0 )
                {
                    // string message = "Please Fill all felds";
                    // string scrpt = "alert('" + message + "');";
                    // ScriptManager.RegisterStartupScript(this, GetType(), "MessageBox", scrpt, true);

                    Label12.Text = "Please ensure that you fill in all the required details.";
                }
                else
                {

            //get image to folder


            string imgPath = "~/uploads/";
            string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath(imgPath + uniqueFileName));
            string imageFilePath = imgPath + uniqueFileName;

            //end get image to folder


            //check box
            string gender;
            if (RadioButton1.Checked)
            {
                gender = "Male";
            }
            else
            {
                gender = "Famale";
            }
            //end check box

            Class1.conn.Open(); 

                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO profile VALUES " +
                    "(@Name, @PhoneNumber, @Username, @Password, @image, " +
                    "@Job, @Gender, @Country, @City, @Description, @date)",
                    Class1.conn);

                
                cmd.Parameters.AddWithValue("@Name", fullName.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber.Text);
                cmd.Parameters.AddWithValue("@Username", userName.Text);
                cmd.Parameters.AddWithValue("@Password", passWord.Text);
                cmd.Parameters.AddWithValue("@image", imageFilePath);
                cmd.Parameters.AddWithValue("@Job", DDLjobName.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Country", DDLcountry.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@City", DDLcity.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Description", "  ");
                cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());


                    cmd.ExecuteNonQuery();
                    Class1.conn.Close();
                    string username = userName.Text;

                    //Class1.username = userName.Text ;
                    HttpContext.Current.Session["Username"] = username;

                    Response.Redirect("index.aspx");
                //Label10.Text = "";
                }
            }
            else
            {
                Label10.Text = "place Choose Image";
            }
            if (FileUpload1.HasFiles)
            {

            if(Path.GetExtension(FileUpload1.FileName) != ".jpg")
            {
                Label10.Text = "Only .jpg is allowed";
            }
            if(length >= 5 * 1024 * 1024)
            {
                Label10.Text = "File size  exceeds the allowed limit";
            }
            }
            if(length <= 5 * 1024 * 1024 && Path.GetExtension(FileUpload1.FileName) == ".jpg" && FileUpload1.HasFile)
            {
                Label10.Text = "";
            }
        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id =  DDLcountry.SelectedValue;
            SqlCommand command = new SqlCommand("select * from Cities where CountryId = '"+id+ "' ORDER BY CityName ASC ", Class1.conn);
            Class1.conn.Open();

            SqlDataReader reader = command.ExecuteReader();

            DDLcity.DataSource = reader;
            DDLcity.DataBind();
            Class1.conn.Close();


            
        }

        protected void phoneNumber_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        {
           
        }
    }
}