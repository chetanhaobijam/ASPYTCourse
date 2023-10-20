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
    public partial class AutoIncrement : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetId();
                BindGridView();
            }
        }

        protected void GetId()
        {
            SqlConnection con = new SqlConnection(cs);
            string query1 = "select id from autoincrement";
            SqlDataAdapter sda = new SqlDataAdapter(query1, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count < 1 )
            {
                Txt_Id.Text = "1";
            }
            else
            {
                string query2 = "select max(id) from autoincrement";
                SqlCommand cmd = new SqlCommand(query2, con);
                con.Open();
                int i = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                i = i + 1;
                Txt_Id.Text = i.ToString();
            }
        }

        protected void Btn_Insert_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into autoincrement values(@id, @name, @age)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Txt_Id.Text);
            cmd.Parameters.AddWithValue("@name", Txt_Name.Text);
            cmd.Parameters.AddWithValue("@age", Txt_Age.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if(a > 0)
            {
                Response.Write("<script>alert('Data inserted')</script>");
                GetId();
                BindGridView();
                Txt_Name.Text = "";
                Txt_Age.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Data not inserted')</script>");
            }
        }

        protected void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query1 = "select * from autoincrement";
            SqlDataAdapter sda = new SqlDataAdapter(query1, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lbl_Id = (Label)row.FindControl("Lbl_Id");
            Label lbl_Name = (Label)row.FindControl("Lbl_Name");
            Label lbl_Age = (Label)row.FindControl("Lbl_Age");
            Txt_Id.Text = lbl_Id.Text;
            Txt_Name.Text= lbl_Name.Text;
            Txt_Age.Text= lbl_Age.Text;

        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "update autoincrement set name = @name, age = @age where id = @id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Txt_Id.Text);
            cmd.Parameters.AddWithValue("@name", Txt_Name.Text);
            cmd.Parameters.AddWithValue("@age", Txt_Age.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data updated')</script>");
                GetId();
                BindGridView();
                Txt_Name.Text = "";
                Txt_Age.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Data not updated')</script>");
            }
        }

        protected void Btn_Delete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from autoincrement where id = @id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Txt_Id.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data deleted')</script>");
                GetId();
                BindGridView();
                Txt_Name.Text = "";
                Txt_Age.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Data not deleted')</script>");
            }
        }
    }
}