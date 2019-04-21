using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e) {
        //Extract the data from the CreateUserWizard control
        string viaId = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName")).Text;
        string firstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFirstName")).Text;
        string surname = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxSurname")).Text;

        //Give the new user the default role
        Roles.AddUserToRole(viaId, "unregisteredStudent");

        //Get default connection string/path to our database from the webconfig file
        string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Create a connection to our database
        SqlConnection con = new SqlConnection(dbString);


        string sqlCommandString = "INSERT INTO users (viaId, firstName, surname, role) VALUES (@viaId, @firstName, @surname, @role)";

        //Open the database connection
        con.Open();
       
        SqlCommand sqlCmd = new SqlCommand(sqlCommandString, con);

        //Fill in the parameters in our prepared SQL statement      
        sqlCmd.Parameters.AddWithValue("@viaId", Int32.Parse(viaId));
        sqlCmd.Parameters.AddWithValue("@firstName", firstName);
        sqlCmd.Parameters.AddWithValue("@surname", surname);
        sqlCmd.Parameters.AddWithValue("@role", "unregisteredStudent");
        //Execute the sqlCmd
        sqlCmd.ExecuteNonQuery();

        //Close the connection to the database
        con.Close();

        //Redirect to the Login Page
        Response.Redirect("Login.aspx");
    }
}