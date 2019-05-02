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

public partial class Pages_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            List<string> roleList = new List<string>(Roles.GetAllRoles());
            roleList.Remove("admin");
            RoleList.DataSource = roleList;
            RoleList.DataBind();            
        }
    }

    protected void ButtonRegisterUser_Click(object sender, EventArgs e) {
       
        Roles.RemoveUserFromRoles(TextBoxID.Text, Roles.GetRolesForUser(TextBoxID.Text));
        
        //Update User Role in ASP.NET Standard Table
        Roles.AddUserToRole(TextBoxID.Text, RoleList.SelectedValue);

        //Update User Role in custom user table

        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the update String and the SqlCommand
        string updateString = "UPDATE users SET role=@role, paid=@paid WHERE viaId=@viaId";
        SqlCommand updateCommand = new SqlCommand(updateString, connection);

        //Add Parameters to the updateCommand
        updateCommand.Parameters.AddWithValue("@role", RoleList.SelectedValue);
        updateCommand.Parameters.AddWithValue("@paid", true);
        updateCommand.Parameters.AddWithValue("@viaId", TextBoxID.Text);

        //Execute the updateCommand
        updateCommand.ExecuteNonQuery();
        connection.Close();

        //Refresh Page
        Response.Redirect("ManageUsers.aspx");
    }
}