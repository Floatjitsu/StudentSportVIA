using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label firstName = (Label) LoginView1.FindControl("LabelFirstName");
            firstName.Text = GetUserFirstName();
        }

        //Gets the firstName of the current user from the users table
        protected string GetUserFirstName() {
            string username = Membership.GetUser().UserName;
            string firstName = "";

            string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            //Set up Connection
            SqlConnection connection = new SqlConnection(dbstring);
            connection.Open();

            //Build the select String and the SqlCommand
            string selectString = "SELECT firstName FROM users WHERE viaId=@viaId";
            SqlCommand selectCommand = new SqlCommand(selectString, connection);
            selectCommand.Parameters.AddWithValue("@viaId", username);

            firstName = (string) selectCommand.ExecuteScalar();

            connection.Close();

            return firstName;
        }
    }
