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
    public partial class CheckoutDetail : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("proAddCheckoutDetail", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FK_iOrderID", txtFKOrderID.Text);
                    cmd.Parameters.AddWithValue("@FK_iProductID", txtFKProductID.Text);
                    cmd.Parameters.AddWithValue("@iQuantity", txtQuantity.Text);
                    cmd.Parameters.AddWithValue("@iTotalMoney", txtQuantity.Text);

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
                using (SqlCommand Cmd = new SqlCommand("select * from tblCheckoutDetail", Cnn))
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
            Label checkoutDetailID = (Label)dgv.SelectedRow.FindControl("checkoutDetailID");
            Label orderID = (Label)dgv.SelectedRow.FindControl("orderID");
            Label productID = (Label)dgv.SelectedRow.FindControl("productID");
            Label quantity = (Label)dgv.SelectedRow.FindControl("quantity");
            Label totalMoney = (Label)dgv.SelectedRow.FindControl("totalMoney");

            txtCheckoutDetailID.Text = checkoutDetailID.Text.ToString();
            txtFKOrderID.Text = orderID.Text.ToString();
            txtFKProductID.Text = productID.Text.ToString();
            txtQuantity.Text = quantity.Text.ToString();
            txtTotalMoney.Text = totalMoney.Text.ToString();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("proUpdateCheckoutDetail", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iCheckoutDetailID", txtCheckoutDetailID.Text);
                    cmd.Parameters.AddWithValue("@FK_iOrderID", txtFKOrderID.Text);
                    cmd.Parameters.AddWithValue("@FK_iProductID", txtFKProductID.Text);
                    cmd.Parameters.AddWithValue("@iQuantity", txtQuantity.Text);
                    cmd.Parameters.AddWithValue("@iTotalMoney", txtTotalMoney.Text);

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
                using (SqlCommand cmd = new SqlCommand("proDeleteCheckoutDetail", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PK_iCheckoutDetailID", txtCheckoutDetailID.Text);
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
            txtCheckoutDetailID.Text = txtFKOrderID.Text = txtFKProductID.Text = txtQuantity.Text = txtTotalMoney.Text = "";
        }
    }
}