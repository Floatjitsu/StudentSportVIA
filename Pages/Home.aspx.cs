using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            //Gets the default connection string/path to our database from the web.config file
            string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            //Set up Connection
            SqlConnection connection = new SqlConnection(dbstring);
            connection.Open();
            //Build the select String and the SqlCommand
            string selectString = "SELECT id as id, sportname as sportname, news as news FROM news WHERE sportname IN (SELECT sportname FROM sportSubscription WHERE viaID=@viaID) ORDER BY id";
            SqlCommand selectCommand = new SqlCommand(selectString, connection);
            selectCommand.Parameters.AddWithValue("@viaID", Int32.Parse(Membership.GetUser().UserName));
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            adapter.Fill(dataTable);

            DataList datalist = (DataList)NewsLoginView.FindControl("DataListNews");
            if (datalist != null)
            {
                datalist.DataSource = dataTable;
                datalist.DataBind();
            }
            //DataListNews.DataSource = dataTable;
            //DataListNews.DataBind();

            connection.Close();
        }
    }
