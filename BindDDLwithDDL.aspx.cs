using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ASP_Tutorial
{
    public partial class BindDDLwithDDL : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["aspcoursecs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindCountryDDL();
            }
        }

        protected void BindCountryDDL()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Country";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DDL_Country.DataSource = dt;
            DDL_Country.DataTextField = "country_name";
            DDL_Country.DataValueField = "country_id";
            DDL_Country.DataBind();
            DDL_Country.Items.Insert(0, "Select Country");
        }

        protected void BindCityDDL(int countryId)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from City where country_id = @country_id";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@country_id", countryId);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DDL_City.DataSource = dt;
            DDL_City.DataTextField = "city_name";
            DDL_City.DataValueField = "city_id";
            DDL_City.DataBind();
            DDL_City.Items.Insert(0, "Select City");
        }

        protected void DDL_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int countryId = Convert.ToInt32(DDL_Country.SelectedValue);
                BindCityDDL(countryId);
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Country is required!');</script>");
            }
        }

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            Response.Write($"Selected Country is {DDL_Country.SelectedItem} and Selected City is {DDL_City.SelectedItem}. ");
        }
    }
}