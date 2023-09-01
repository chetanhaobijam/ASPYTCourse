using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace ASP_Tutorial
{
    public partial class BindDDL : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindDropDownList();
            }
        }

        public void BindDropDownList()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select * from Employee";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            BindDropDown.DataSource = dt;
            BindDropDown.DataTextField = "Name";
            BindDropDown.DataValueField = "Id";
            BindDropDown.DataBind();

            ListItem SelectOne = new ListItem("Select Employee", "-1");
            SelectOne.Selected = true;
            BindDropDown.Items.Insert(0, SelectOne);
        }

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            if(BindDropDown.SelectedValue == "-1")
            {
                Response.Write("Please select an employee name!");
            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "Select * from Employee where name = @name";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                sda.SelectCommand.Parameters.AddWithValue("@name", BindDropDown.SelectedItem.Text);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                Lbl_1.Text = "Rows Found";
                Lbl_1.ForeColor = Color.Green;
                Lbl_1.Visible = true;
            }
        }
    }
}