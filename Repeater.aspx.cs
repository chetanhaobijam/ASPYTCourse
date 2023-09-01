using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ASP_Tutorial
{
    public partial class Repeater : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = getData();
            MyGridView.DataSource = dt;
            MyGridView.DataBind();
            MyRepeater.DataSource = dt;
            MyRepeater.DataBind();
        }

        protected DataTable getData()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from student";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
    }
}