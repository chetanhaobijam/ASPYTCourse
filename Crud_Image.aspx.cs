using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;

namespace ASP_Tutorial
{
    public partial class Crud_Image : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["aspcoursecs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void Btn_Insert_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("images/");
            string fileName = Path.GetFileName(FU_Image.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = FU_Image.PostedFile;
            int size = postedFile.ContentLength;
            if (FU_Image.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".png")
                {
                    if (size <= 1000000)
                    {
                        string query2 = "select * from Employee where Id = @Id";
                        SqlCommand cmd2 = new SqlCommand(query2, con);
                        cmd2.Parameters.AddWithValue("@Id", Txt_Id.Text);
                        con.Open();
                        SqlDataReader dr = cmd2.ExecuteReader();
                        if (dr.HasRows == true)
                        {
                            Response.Write("<script>alert('ID already exists')</script>");
                            con.Close();
                        }
                        else
                        {
                            con.Close();
                            FU_Image.SaveAs(filePath + fileName);
                            string path2 = "images/" + fileName;
                            string query = "Insert into Employee values(@Id, @Name, @Age, @Gender, @Designation, @Salary, @Image_Path)";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@Id", Txt_Id.Text);
                            cmd.Parameters.AddWithValue("@Name", Txt_Name.Text);
                            cmd.Parameters.AddWithValue("@Age", Txt_Age.Text);
                            cmd.Parameters.AddWithValue("@Gender", Ddl_Gender.SelectedValue);
                            cmd.Parameters.AddWithValue("@Designation", Ddl_Designation.SelectedValue);
                            cmd.Parameters.AddWithValue("@Salary", Txt_Salary.Text);
                            cmd.Parameters.AddWithValue("@Image_Path", path2);
                            con.Open();
                            int a = cmd.ExecuteNonQuery();
                            if (a > 0)
                            {
                                Response.Write("<script>alert('Inserted successfully')</script>");
                                BindGridView();
                                ClearControls();
                                Lbl_Image.Visible = false;
                            }
                            else
                            {
                                Response.Write("<script>alert('Inserted failed')</script>");
                            }
                            con.Close();
                        }
                    }
                    else
                    {
                        Lbl_Image.Visible = true;
                        Lbl_Image.Text = "Length should be less than 1 MB!!!";
                        Lbl_Image.ForeColor = Color.Red;
                    }
                }
                else
                {
                    Lbl_Image.Visible = true;
                    Lbl_Image.Text = "File Format not supported!!!";
                    Lbl_Image.ForeColor = Color.Red;
                }
            }
            else
            {
                Lbl_Image.Visible = true;
                Lbl_Image.Text = "Please upload an image!!!";
                Lbl_Image.ForeColor = Color.Red;
            }


        }

        protected void ClearControls()
        {
            Txt_Id.Text = Txt_Name.Text = Txt_Age.Text = Txt_Salary.Text = "";
            Ddl_Gender.ClearSelection();
            Ddl_Designation.ClearSelection();
        }

        protected void Btn_Reset_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        protected void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select * from Employee";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}