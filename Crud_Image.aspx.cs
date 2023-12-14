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
using Image = System.Web.UI.WebControls.Image;

namespace ASP_Tutorial
{
    public partial class Crud_Image : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["aspcoursecs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
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
            Lbl_Image.Visible = false;
            Image_Preview.Visible = false;
            GridView1.SelectedIndex = -1;
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lblId = (Label)row.FindControl("Glbl_Id");
            Label lblName = (Label)row.FindControl("Glbl_Name");
            Label lblAge = (Label)row.FindControl("Glbl_Age");
            Label lblGender = (Label)row.FindControl("Glbl_Gender");
            Label lblDesignation = (Label)row.FindControl("Glbl_Designation");
            Label lblSalary = (Label)row.FindControl("Glbl_Salary");
            Image img = (Image)row.FindControl("GImage");

            Txt_Id.Text = lblId.Text;
            Txt_Name.Text = lblName.Text;
            Txt_Age.Text = lblAge.Text;
            Ddl_Gender.Text = lblGender.Text;
            Ddl_Designation.Text = lblDesignation.Text;
            Txt_Salary.Text = lblSalary.Text;
            Image_Preview.ImageUrl = img.ImageUrl;
            Image_Preview.Visible = true;
        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("images/");
            string fileName = Path.GetFileName(FU_Image.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = FU_Image.PostedFile;
            int size = postedFile.ContentLength;

            string updatePath = "images/";
            if (FU_Image.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (size <= 1000000)
                    {
                        updatePath += fileName;
                        FU_Image.SaveAs(Server.MapPath(updatePath));

                        string query = "Update Employee set Name = @Name, Age = @Age, Gender = @Gender, Designation = @Designation, Salary = @Salary, Image_Path = @Image where Id = @Id";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Id", Txt_Id.Text);
                        cmd.Parameters.AddWithValue("@Name", Txt_Name.Text);
                        cmd.Parameters.AddWithValue("@Age", Txt_Age.Text);
                        cmd.Parameters.AddWithValue("@Gender", Ddl_Gender.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@Designation", Ddl_Designation.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@Salary", Txt_Salary.Text);
                        cmd.Parameters.AddWithValue("@Image", updatePath);

                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Write("<script>alert('Updated successfully')</script>");
                            BindGridView();
                            ClearControls();

                            string deletePath = Server.MapPath(Image_Preview.ImageUrl.ToString());
                            if (File.Exists(deletePath))
                            {
                                File.Delete(deletePath);
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Update failed')</script>");
                        }
                        con.Close();
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
                updatePath = Image_Preview.ImageUrl.ToString();
                string query = "Update Employee set Name = @Name, Age = @Age, Gender = @Gender, Designation = @Designation, Salary = @Salary, Image_Path = @Image where Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", Txt_Id.Text);
                cmd.Parameters.AddWithValue("@Name", Txt_Name.Text);
                cmd.Parameters.AddWithValue("@Age", Txt_Age.Text);
                cmd.Parameters.AddWithValue("@Gender", Ddl_Gender.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Designation", Ddl_Designation.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Salary", Txt_Salary.Text);
                cmd.Parameters.AddWithValue("@Image", updatePath);

                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    Response.Write("<script>alert('Updated successfully')</script>");
                    BindGridView();
                    ClearControls();
                }
                else
                {
                    Response.Write("<script>alert('Update failed')</script>");
                }
                con.Close();
            }
        }

        protected void Btn_Delete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Delete from Employee where Id = @Id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Id", Txt_Id.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Deleted successfully')</script>");
                BindGridView();
                ClearControls();

                string deletePath = Server.MapPath(Image_Preview.ImageUrl.ToString());
                if(File.Exists(deletePath))
                {
                    File.Delete(deletePath);
                }
            }
            else
            {
                Response.Write("<script>alert('Deletion failed')</script>");
            }
            con.Close();
        }
    }
}