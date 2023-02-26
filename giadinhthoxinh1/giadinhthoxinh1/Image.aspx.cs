using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace giadinhthoxinh1
{
    public partial class Image1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            //Lấy tên danh mục ra dropdownlist
            if (!IsPostBack)
            {
                DataTable productTable = GetProduct();//table lấy sản phẩm
                rptProduct.DataSource = productTable;
                rptProduct.DataBind();
                foreach (DataRow row in productTable.Rows)
                {
                    drlProduct.Items.Add(new ListItem(row["sProductName"].ToString(), row["PK_iProductID"].ToString()));
                }

                rptProduct.DataSource = productTable;
                rptProduct.DataBind();
                ShowList();
                AddEnable();
            }
        }


        public void AddEnable()
        {
            btnAdd.Enabled = true;
            btnUpdate.Enabled = false;
            btnDel.Enabled = false;
        }
        public void UpDateDelEnalble()
        {
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
            btnDel.Enabled = true;
        }
        private DataTable GetProduct()//table lấy sản phẩm
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "pro_getProduct";
                    DataTable dt = new DataTable();
                    cnn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        cnn.Close();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }
        protected bool checkFileType(string fileName)// hàm check file ảnh
        {
            String fileExtension = Path.GetExtension(fileName);
            if (fileExtension == ".jpg" || fileExtension == ".png" || fileExtension == ".jpeg" || fileExtension == ".PNG")
            {
                return true;
            }
            else return false;
        }
        protected void btnAdd_Click(object sender, EventArgs e)// khi click vào btn thêm
        {
            string fileName = "";
            if (uploadImage.HasFile)
            {
                if (checkFileType(uploadImage.FileName))
                {
                    fileName = "./Assets/img/post" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + uploadImage.FileName;
                    String filePath = MapPath(fileName);
                    uploadImage.SaveAs(filePath);
                }
            };
            if (InsertImage(fileName) != 0)
            {
                //Response.Write("<script>alert('Đăng bài viết thành công! nội dung trang web sẽ sớm được cập nhật!');</script>");
                //updateContent();
            }
            else
            {
                Response.Write("<script>alert('Thêm bài viết thất bại! hãy thử lại sau')</script>");
            }
            ShowList();

        }

        public void ShowList()
        {
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("select * from tblImage", Cnn))
                {
                    Cmd.CommandType = CommandType.Text;
                    Cnn.Open();
                    using (SqlDataReader reader = Cmd.ExecuteReader())
                    {
                        dgv.DataSource = reader;
                        dgv.DataBind();

                    }
                    Cnn.Close();
                }
            }
        }

        protected void dgvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.Header:
                    break;
                case DataControlRowType.DataRow:
                    e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(this.dgv, "Select$" + e.Row.RowIndex));
                    break;
            }
        }

        protected void dgvCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dgv.SelectedDataKey != null)
            {
                using (SqlConnection cnn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("procSelectImageByID", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@PK_iImageID", dgv.SelectedValue.ToString());
                        cnn.Open();
                        SqlDataReader dataReader = cmd.ExecuteReader();
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            txtImageID.Text = dataReader["PK_iImageID"].ToString();
                            string id_sanpham = dataReader["FK_iProductID"].ToString();
                            foreach (ListItem item in drlProduct.Items)
                            {
                                if (item.Value.Equals(id_sanpham))
                                {
                                    drlProduct.ClearSelection();
                                    item.Selected = true;
                                    break;
                                }
                            }
                            imageShow.ImageUrl = dataReader["sImage"].ToString();
                            txtState.Text = dataReader["iState"].ToString();
                        }
                        cnn.Close();
                    }
                }

            }
            else
            {
                txtState.Text = "TESST";
            }
            UpDateDelEnalble();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string fileName = "";
            if (uploadImage.HasFile)
            {
                if (checkFileType(uploadImage.FileName))
                {
                    fileName = "./Assets/img/post" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + uploadImage.FileName;
                    String filePath = MapPath(fileName);
                    uploadImage.SaveAs(filePath);
                }
            };
            if (UpdateImage(fileName) != 0)
            {
                //Response.Write("<script>alert('Đăng bài viết thành công! nội dung trang web sẽ sớm được cập nhật!');</script>");
                //updateContent();
            }
            else
            {
                Response.Write("<script>alert('Thêm bài viết thất bại! hãy thử lại sau')</script>");
            }
            ShowList();
        }

        protected int InsertImage(string fileName)//hàm thêm 
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "proAddImage";
                    cmd.Parameters.AddWithValue("@FK_iImageID", drlProduct.SelectedValue);
                    cmd.Parameters.AddWithValue("@url", fileName);
                    cmd.Parameters.AddWithValue("@state", txtState.Text);
                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        lblNotify.Text = "Thêm thất bại";
                        lblNotify.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblNotify.Text = "Thêm thành công";
                    }
                    cnn.Close();
                    cnn.Close();
                    return i;
                }
            }
        }

        protected int UpdateImage(string fileName)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "proUpdateImage";
                    cmd.Parameters.AddWithValue("@PK_iImageID", txtImageID.Text);
                    cmd.Parameters.AddWithValue("@FK_iProductID", drlProduct.SelectedValue);
                    cmd.Parameters.AddWithValue("@urlImage", fileName);
                    cmd.Parameters.AddWithValue("@state", txtState.Text);
                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        lblNotify.Text = "Sửa thất bại";
                        lblNotify.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblNotify.Text = "Sửa thành công";
                    }
                    cnn.Close();
                    cnn.Close();
                    Reset();
                    return i;
                }
            }

        }


        protected void btnUpload_Click(object sender, EventArgs e)// đã cho câu lệnh vào hàm add
        {

        }
        protected void btnDel_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "proDeleteImage";
                    cmd.Parameters.AddWithValue("@PK_iImageID", txtImageID.Text);
                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        lblNotify.Text = "Xóa thất bại";
                        lblNotify.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblNotify.Text = "Xóa thành công";
                    }
                    cnn.Close();
                }
            }
            Reset();
            ShowList();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
        public void Reset()
        {
            txtState.Text = "";
            AddEnable();

        }

    }


}