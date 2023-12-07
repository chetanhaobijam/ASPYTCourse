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

        }

        protected void Btn_Insert_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string filePath = Server.MapPath("images/");
            string fileName = Path.GetFileName(FU_Image.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = FU_Image.PostedFile;
            int size = postedFile.ContentLength;

            if (FU_Image.HasFile)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (size < 1000000)
                    {
                        string query1 = "select * from Employee where Id = @Id";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.Parameters.AddWithValue("@Id", Txt_Id.Text);
                        con.Open();
                        SqlDataReader dr = cmd1.ExecuteReader();
                        if (dr.HasRows)
                        {
                            Response.Write("<script>alert('Id already present';)</script>");
                            con.Close();
                        } else
                        {
                            con.Close();
                            FU_Image.SaveAs(filePath + fileName);
                            string path2 = "images/" + fileName;
                            string query2 = "Insert into Employee values(@Id, @Name, @Age, @Gender, @Designation, @Salary, @Image)";
                            SqlCommand cmd2 = new SqlCommand(query2, con);
                            cmd2.Parameters.AddWithValue("@Id", Txt_Id.Text);
                            cmd2.Parameters.AddWithValue("@Name", Txt_Name.Text);
                            cmd2.Parameters.AddWithValue("@Age", Txt_Age.Text);
                            cmd2.Parameters.AddWithValue("@Gender", Ddl_Gender.SelectedValue);
                            cmd2.Parameters.AddWithValue("@Designation", Ddl_Designation.SelectedValue);
                            cmd2.Parameters.AddWithValue("@Salary", Txt_Salary.Text);
                            cmd2.Parameters.AddWithValue("@Image", path2);
                            con.Open();
                            int a = cmd2.ExecuteNonQuery();
                            if(a > 0)
                            {
                                Response.Write("<script>alert('Insertion successful!!!')</script>");
                                ClearControls();
                            } else
                            {
                                Response.Write("<script>alert('Insertion failed')</script>");
                            }
                            con.Close();
                        }
                    } else
                    {
                        Lbl_Image.Visible = true;
                        Lbl_Image.Text = "File too large!!!";
                        Lbl_Image.ForeColor = Color.Red;
                    }
                } else
                {
                    Lbl_Image.Visible = true;
                    Lbl_Image.Text = "File Format not supported!!!";
                    Lbl_Image.ForeColor = Color.Red;
                }
            } else
            {
                Lbl_Image.Visible = true;
                Lbl_Image.Text = "File not present!!!";
                Lbl_Image.ForeColor = Color.Red;
            }
        }

        protected void ClearControls()
        {
            Txt_Id.Text = Txt_Name.Text = Txt_Age.Text = Txt_Salary.Text = "";
            Ddl_Gender.ClearSelection();
            Ddl_Designation.ClearSelection();
        }
    }
}