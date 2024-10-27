using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace project
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            



                //            string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=freelancerProfile;Integrated Security=True";
                string query = "SELECT * FROM Countries";

  //              SqlConnection connection = new SqlConnection(connectionString);
            
                SqlCommand command = new SqlCommand(query, Class1.conn);
                Class1.conn.Open();

                SqlDataReader reader = command.ExecuteReader();

                DropDownList1.DataSource = reader;
                DropDownList1.DataTextField = "CountryName";
                DropDownList1.DataValueField = "CountryId";
                DropDownList1.DataBind();
                Class1.conn.Close();

            
             ListItem ss = new ListItem("--select--" , "-1");

                DropDownList1.Items.Insert(0, ss);
                DropDownList2.Items.Insert(0, ss);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

             
            Class1.conn.Open();
            SqlCommand cmd = new SqlCommand("select image from profile where id = '"+TextBox1.Text+"'", Class1.conn);
            SqlDataReader read = cmd.ExecuteReader();
            if (read.Read())
            {
                string imagePath =  read["image"].ToString();
                Image1.ImageUrl = read["image"].ToString();
            }
            Class1.conn.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=freelancerProfile;Integrated Security=True";

            string ss =  DropDownList1.SelectedValue;
            string query = "SELECT * FROM Cities where CountryId = '"+ss+"' ";

            SqlConnection connection = new SqlConnection(connectionString);

            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            DropDownList2.DataSource = reader;
            DropDownList2.DataTextField = "CityName";
            DropDownList2.DataValueField = "CountryId";
            DropDownList2.DataBind();

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string message = "Please Fill all felds";
            string scrpt = "alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, GetType(), "MessageBox", scrpt, true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToString();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {


            using (SqlConnection conn = Class1.conn)
            {
                conn.Open(); // Open the connection

                SqlCommand delete_id = new SqlCommand("DELETE FROM project WHERE id = @Id", conn);
                delete_id.Parameters.AddWithValue("@Id", 1);
                delete_id.ExecuteNonQuery();

                conn.Close(); // Close the connection after executing the command
            }
        }
    }
}