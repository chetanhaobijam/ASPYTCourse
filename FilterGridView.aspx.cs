using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ASP_Tutorial
{
    public partial class FilterGridView : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["aspcoursecs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from search";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void SearchDataByMale()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from search where gender = @male";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@male", MaleRadioButton.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void SearchDataByFemale()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from search where gender = @female";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@female", FemaleRadioButton.Text);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void SearchDataByBoth()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from search";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if(MaleRadioButton.Checked)
            {
                SearchDataByMale();
            } else if(FemaleRadioButton.Checked)
            {
                SearchDataByFemale();
            } else if(BothRadioButton.Checked)
            {
                SearchDataByBoth();
            } else
            {
                Response.Write("<script>alert('Please select an option')</script>");
            }
        }

        protected void MaleRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            SearchDataByMale();
        }

        protected void FemaleRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            SearchDataByFemale();
        }

        protected void BothRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            SearchDataByBoth();
        }
    }
}