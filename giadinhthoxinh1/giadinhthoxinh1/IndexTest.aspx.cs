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
    public partial class IndexTest : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Show();
        }
        protected void Show()
        {
            SqlConnection Cnn = new SqlConnection(connectionString);
            SqlCommand Cmd = new SqlCommand("proGetAllImageToDisplay", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            //Cmd.Parameters.AddWithValue("@sId", 2);
            Cnn.Open();
            int i = Cmd.ExecuteNonQuery();
            grvData.DataSource = Cmd.ExecuteReader();
            grvData.DataBind();
            Cnn.Close();
            Cnn.Dispose();
        }
    }
}