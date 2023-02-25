using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace giadinhthoxinh1
{
    public partial class Product : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowList();
            AddEnable();
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proAddProduct", cnn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FK_iCategoryID", txtCategoryID.Text);
                    cmd.Parameters.AddWithValue("@FK_iPromoteID", txtPromoteID.Text);
                    cmd.Parameters.AddWithValue("@sProductName", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@iPrice", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@sDescribe", txtDescrible.Text);
                    cmd.Parameters.AddWithValue("@sColor", txtColor.Text);
                    cmd.Parameters.AddWithValue("@sSize", txtSize.Text);

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
                }
            }
            ShowList();
            Reset();
        }

        public void ShowList()
        {
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("select * from tblProduct", Cnn))
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
            Label productID = (Label)dgv.SelectedRow.FindControl("productID");
            Label categoryID = (Label)dgv.SelectedRow.FindControl("categoryID");
            Label promoteID = (Label)dgv.SelectedRow.FindControl("promoteID");
            Label productName = (Label)dgv.SelectedRow.FindControl("productName");
            Label price = (Label)dgv.SelectedRow.FindControl("price");
            Label describle = (Label)dgv.SelectedRow.FindControl("describle");
            Label color = (Label)dgv.SelectedRow.FindControl("color");
            Label size = (Label)dgv.SelectedRow.FindControl("size");

            txtProductID.Text = productID.Text.ToString();
            txtCategoryID.Text = categoryID.Text.ToString();
            txtPromoteID.Text = promoteID.Text.ToString();
            txtProductName.Text = productName.Text.ToString();
            txtPrice.Text = price.Text.ToString();
            txtDescrible.Text = describle.Text.ToString();
            txtColor.Text = color.Text.ToString();
            txtSize.Text = size.Text.ToString();
            UpDateDelEnalble();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proUpdateProduct", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iProductID", txtProductID.Text);
                    cmd.Parameters.AddWithValue("@FK_iCategoryID", txtCategoryID.Text);
                    cmd.Parameters.AddWithValue("@FK_iPromoteID", txtPromoteID.Text);
                    cmd.Parameters.AddWithValue("@sProductName", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@iPrice", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@sDescribe", txtDescrible.Text);
                    cmd.Parameters.AddWithValue("@sColor", txtColor.Text);
                    cmd.Parameters.AddWithValue("@sSize", txtSize.Text);


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
                }
            }
            ShowList();
            Reset();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proDeleteProduct", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iProductID", txtProductID.Text);

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
            ShowList();
            Reset();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
        }
        public void Reset()
        {
            txtProductID.Text = txtCategoryID.Text = txtPromoteID.Text = txtProductName.Text = txtPrice.Text = txtDescrible.Text = txtColor.Text = txtSize.Text = txtProductID.Text = "";
            AddEnable();
        }
    }
}