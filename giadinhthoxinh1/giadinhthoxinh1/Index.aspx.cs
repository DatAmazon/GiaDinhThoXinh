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
    public partial class Index : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            KhoiTaoDuLieu();
        }

        protected void rptProductItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
        protected void KhoiTaoDuLieu()
        {
            SqlConnection Cnn = new SqlConnection(connectionString);
            SqlCommand Cmd = new SqlCommand("proGetImageToDisplay", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.AddWithValue("@sId", 2);
            Cnn.Open();
            int i = Cmd.ExecuteNonQuery();
            rptProductItem.DataSource = Cmd.ExecuteReader();
            rptProductItem.DataBind();
            Cnn.Close();
            Cnn.Dispose();
        }
    }
}