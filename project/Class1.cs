using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
namespace project
{
    public class Class1
    {
        // static public string username;
        // static public string user_profile;
         static public SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=freelancerProfile;Integrated Security=True");
        //   static public SqlConnection conn = new SqlConnection(@"Data Source = SQL8010.site4now.net; Initial Catalog = db_aa91ed_jaberfhemy2024; User Id = db_aa91ed_jaberfhemy2024_admin; Password=aliali77!!");

        static public string search;
       static public string search_name;

        
        
    }
}