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
    public partial class Review : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proAddCategory", cnn))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sCategoryName", txtProductID.Text);

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
                using (SqlCommand Cmd = new SqlCommand("select * from tblReview", Cnn))
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

        //protected void dgvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    switch (e.Row.RowType)
        //    {
        //        case DataControlRowType.Header:
        //            break;
        //        case DataControlRowType.DataRow:
        //            e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(this.dgv, "Select$" + e.Row.RowIndex));
        //            break;
        //    }
        //}

        //protected void dgvCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Label cateID = (Label)dgv.SelectedRow.FindControl("categoryID");
        //    Label cateName = (Label)dgv.SelectedRow.FindControl("categoryName");
        //    Label categoryState = (Label)dgv.SelectedRow.FindControl("categoryName");

        //    txtProductID.Text = cateID.Text.ToString();
        //    txtProductID.Text = cateName.Text.ToString();
        //    txtProductID.Text = categoryState.Text.ToString();

        //}

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //using (SqlConnection cnn = new SqlConnection(connectionString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("proUpdateCategory", cnn))
            //    {
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.Parameters.AddWithValue("@sCategoryID", txtProductID.Text);
            //        cmd.Parameters.AddWithValue("@sCategoryName", txtProductID.Text);
            //        cmd.Parameters.AddWithValue("@iState", txtProductID.Text);


            //        cnn.Open();
            //        int i = cmd.ExecuteNonQuery();
            //        if (i == 0)
            //        {
            //            lblNotify.Text = "Sửa thất bại";
            //            lblNotify.ForeColor = System.Drawing.Color.Red;
            //        }
            //        else
            //        {
            //            lblNotify.Text = "Sửa thành công";
            //        }
            //        cnn.Close();
            //    }
            //}
            //ShowList();
            //Reset();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            //using (SqlConnection cnn = new SqlConnection(connectionString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("proDeleteCategory", cnn))
            //    {
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.Parameters.AddWithValue("@sCategoryID", txtProductID.Text);

            //        cnn.Open();
            //        int i = cmd.ExecuteNonQuery();
            //        if (i == 0)
            //        {
            //            lblNotify.Text = "Xóa thất bại";
            //            lblNotify.ForeColor = System.Drawing.Color.Red;
            //        }
            //        else
            //        {
            //            lblNotify.Text = "Xóa thành công";
            //        }
            //        cnn.Close();

            //    }
            //}
            //ShowList();
            //Reset();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            //Reset();
        }
        public void Reset()
        {
            //txtProductID.Text = txtProductID.Text = "";
        }
    }
}