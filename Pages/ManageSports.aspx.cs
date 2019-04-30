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

public partial class Pages_ManageSports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string teachername = Helper.Helper.GetUserFirstName();
        DataTable dataTable = new DataTable();
        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string selectString = "SELECT sportName FROM sports WHERE teacherName=@teachername";
        SqlCommand selectCommand = new SqlCommand(selectString, connection);
        //selectCommand.Parameters.AddWithValue("@weekday", weekday);
        selectCommand.Parameters.AddWithValue("@teachername", teachername);
        SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
        adapter.Fill(dataTable);

        dropDownSportName.DataSource = dataTable;
        dropDownSportName.DataBind();
        dropDownSportName.DataTextField = "sportName";
        
        dropDownSportName.DataBind();
    }

    protected void sendNews_Click(object sender, EventArgs e)
    {

        String news = sendNewsTextBox.Text;
        String sportname = dropDownSportName.SelectedValue;

        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string insertString = "INSERT INTO news(sportname,news) VALUES(@sportname,@news)";
        SqlCommand insertCommand = new SqlCommand(insertString, connection);

        insertCommand.Parameters.AddWithValue("@sportname", sportname);
        insertCommand.Parameters.AddWithValue("@news", news);

        insertCommand.ExecuteNonQuery();

        connection.Close();

        sendNewsTextBox.Text = "";
    }
}