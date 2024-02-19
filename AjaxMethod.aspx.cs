using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ASP_Tutorial
{
    public partial class AjaxMethod : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["aspcoursecs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Attribute to serve/handle AJAX Requests. Without it, AJAX Request will not be handled.
        [WebMethod]
        public static string GetData(string name, string surname)
        {
            Thread.Sleep(3000);
            SqlConnection con = new SqlConnection(cs);
            string query = "Insert into Person values(@name,@surname)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@surname", surname);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();
            if (a > 0)
            {
                return "Data has been inserted successfully!";
            }
            else
            {
                return "Data insertion failed!";
            }
        }
    }
}