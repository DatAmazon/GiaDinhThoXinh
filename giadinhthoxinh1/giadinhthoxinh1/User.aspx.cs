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
    public partial class User : System.Web.UI.Page
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
                using (SqlCommand cmd = cnn.CreateCommand())
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "proAddUser";
                    cmd.Parameters.AddWithValue("@FK_iPermissionID", txtPermissionUser.Text);
                    cmd.Parameters.AddWithValue("@sEmail", txtUserEmail.Text);
                    cmd.Parameters.AddWithValue("@sPass", txtUserPass.Text);
                    cmd.Parameters.AddWithValue("@sUserName", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@sPhone", txtUserPhone.Text);
                    cmd.Parameters.AddWithValue("@sAddress", txtUserAddress.Text);
                    cmd.Parameters.AddWithValue("@iState", txtUserState.Text);
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
                using (SqlCommand Cmd = new SqlCommand("select * from tblUser", Cnn))
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
            Label userID = (Label)dgv.SelectedRow.FindControl("userID");
            Label userPermission = (Label)dgv.SelectedRow.FindControl("userPermission");
            Label userEmail = (Label)dgv.SelectedRow.FindControl("userEmail");
            Label userUsername = (Label)dgv.SelectedRow.FindControl("userUsername");
            Label userPass = (Label)dgv.SelectedRow.FindControl("userPass");
            Label userPhone = (Label)dgv.SelectedRow.FindControl("userPhone");
            Label userAddress = (Label)dgv.SelectedRow.FindControl("userAddress");
            Label userState = (Label)dgv.SelectedRow.FindControl("userState");

            txtUserID.Text = userID.Text.ToString();
            txtPermissionUser.Text = userPermission.Text.ToString();
            txtUserEmail.Text = userEmail.Text.ToString();
            txtUsername.Text = userUsername.Text.ToString();
            txtUserPass.Text = userPass.Text.ToString();
            txtUserPhone.Text = userPhone.Text.ToString();
            txtUserAddress.Text = userAddress.Text.ToString();
            txtUserState.Text = userState.Text.ToString();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "proUpdateUser";
                    cmd.Parameters.AddWithValue("@PK_iAccountID", txtUserID.Text);
                    cmd.Parameters.AddWithValue("@FK_iPermissionID", txtPermissionUser.Text);
                    cmd.Parameters.AddWithValue("@sEmail", txtUserEmail.Text);
                    cmd.Parameters.AddWithValue("@sPass", txtUserPass.Text);
                    cmd.Parameters.AddWithValue("@sUserName", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@sPhone", txtUserPhone.Text);
                    cmd.Parameters.AddWithValue("@sAddress", txtUserAddress.Text);
                    cmd.Parameters.AddWithValue("@iState", txtUserState.Text);

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
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "proDeleteUser";
                    cmd.Parameters.AddWithValue("@PK_iAccountID", txtUserID.Text);

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
            txtUserID.Text = txtPermissionUser.Text = txtUserEmail.Text = txtUsername.Text = txtUserPass.Text = txtUserPhone.Text = txtUserAddress.Text = txtUserState.Text = "";
        }
    }
}