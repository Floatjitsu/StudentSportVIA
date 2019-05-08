using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Drawing;
using System.Web.Security;

public partial class Pages_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            List<string> roleList = new List<string>(Roles.GetAllRoles());
            roleList.Remove("admin");
            RoleList.DataSource = roleList;
            RoleList.DataBind();
            fillDropDownSportName();
        }
    }

    protected void ButtonRegisterUser_Click(object sender, EventArgs e)
    {

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

    protected void ButtonDeleteUser_Click(object sender, EventArgs e)
    {
        //Delete User in ASP.NET Standard Table
        Membership.DeleteUser(UserSelected.Text);

        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();


        string selectString = "DELETE FROM users WHERE viaId=@viaId";
        SqlCommand selectCommand = new SqlCommand(selectString, connection);

        selectCommand.Parameters.AddWithValue("@viaId", Int32.Parse(UserSelected.Text));
        selectCommand.ExecuteNonQuery();

        //Refresh Page
        Response.Redirect("ManageUsers.aspx");
    }
    protected void giveSportToTeacher_Click(object sender, EventArgs e)
    {
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        string selectString = "UPDATE sports SET teacherName=@teacherName WHERE sportName=@sportName";

        SqlCommand selectCommand = new SqlCommand(selectString, connection);


        selectCommand.Parameters.AddWithValue("@teacherName", teacherTextBox.Text);
        selectCommand.Parameters.AddWithValue("@sportName", dropDownSportList.SelectedValue);
        selectCommand.ExecuteNonQuery();

    }

    public void fillDropDownSportName()
    {
        DataTable dataTable = new DataTable();
        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string selectString = "SELECT sportName FROM sports";
        SqlCommand selectCommand = new SqlCommand(selectString, connection);
        SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
        adapter.Fill(dataTable);
        dropDownSportList.DataSource = dataTable;
        dropDownSportList.DataBind();
        dropDownSportList.DataTextField = "sportName";
        dropDownSportList.DataValueField = "sportName";
        dropDownSportList.DataBind();

        connection.Close();
    }
}