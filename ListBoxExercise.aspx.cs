using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Tutorial
{
    public partial class ListBoxExercise : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetData();
            }
        }

        protected void GetData()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select * from Employee";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListBox1.DataSource = dt;
            ListBox1.DataTextField = "Name";
            ListBox1.DataValueField = "Id";
            ListBox1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(ListBox1.SelectedIndex == -1)
            {
                Response.Write("Please select an item");
            } else
            {
                foreach(ListItem li in ListBox1.Items)
                {
                    if(li.Selected)
                    {
                        Response.Write($"Selected Item Text is {li.Text}. <br/>");
                        Response.Write($"Selected Item Value is {li.Value}. <br/>");
                        Response.Write($"Selected Item Index is {ListBox1.Items.IndexOf(li)}. <br/>");
                        Response.Write("---------------------------------------<br/>");
                    }
                }
            }
        }
    }
}