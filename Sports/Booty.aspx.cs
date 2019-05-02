using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Helper;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class Sports_Booty : System.Web.UI.Page
{

    //checking if the current user is already subscribed or not to the sport
    private bool checkIfSubscribed()
    {
        bool check = false;

        //Retrieving the UserName (viaID) of the current user
        int viaID = Int32.Parse(Membership.GetUser().UserName);

        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string insertString = "SELECT viaID FROM sportSubscription WHERE viaID=@viaID AND sportName=@sportname";
        SqlCommand cmd = new SqlCommand(insertString, connection);
        cmd.Parameters.AddWithValue("@viaID", viaID);
        string sportname = "Booty";
        cmd.Parameters.AddWithValue("@sportname", sportname);
        SqlDataReader reader = cmd.ExecuteReader();

        //if this condition is true, the user is already registered to the current sport
        if (reader != null && reader.HasRows)
        {
            check = true;
        }
        return check;
    }

    protected void Page_Load(object sender, EventArgs e) {
        DataList1.DataBind();
        //user subscribed
        if (checkIfSubscribed())
        {

            //Hide the subscribe button if the user is SUBSCRIBED
            SubscribeButton.Visible = false;
            UnsubscribeButton.Visible = true;
            Master.sportWrapper4Visible.Visible = true;

        }
        //user not subscribed
        else
        {
            SubscribeButton.Visible = true;
            UnsubscribeButton.Visible = false;
            Master.sportWrapper4Visible.Visible = false;
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e) {
        Label weekdayName = e.Item.FindControl("weekdayName") as Label;
        Label weekday = e.Item.FindControl("weekdayLabel") as Label;
        Label cancelledLabel = e.Item.FindControl("cancelledLabel") as Label;
        weekdayName.Text = Helper.Helper.GetWeekdayName(weekday.Text);
        if (cancelledLabel.Text == "True") {
            cancelledLabel.Visible = true;
            cancelledLabel.Text = "CANCELLED";
            cancelledLabel.ForeColor = Color.FromArgb(204, 0, 0);
        }
    }

    protected void sendMessage_Click(object sender, EventArgs e) {

        String message = currentMessage.Text;

        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string insertString = "INSERT INTO chatmessage(username,sportname,message) VALUES(@username,@sportname,@message)";
        SqlCommand insertCommand = new SqlCommand(insertString, connection);

        Helper.Helper helper = new Helper.Helper();

        string sportname = "Booty";

        string username = Helper.Helper.GetUserFirstName();

        insertCommand.Parameters.AddWithValue("@username", username);
        insertCommand.Parameters.AddWithValue("@sportname", sportname);
        insertCommand.Parameters.AddWithValue("@message", message);

        insertCommand.ExecuteNonQuery();

        connection.Close();

        DataListChat.DataBind();

        currentMessage.Text = "";
    }

    protected void subscribeSport(object sender, EventArgs e)
    {
        //When the user press the button, his viaID is added in the 'sportSubscription' table

        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string insertString = "INSERT INTO sportSubscription(sportName,viaID) VALUES(@sportName,@viaID)";
        SqlCommand insertCommand = new SqlCommand(insertString, connection);

        string sportName = "Booty";
        //Retrieving the UserName (viaID) of the current user
        int viaID = Int32.Parse(Membership.GetUser().UserName);


        //Inserting the values
        insertCommand.Parameters.AddWithValue("@sportName", sportName);
        insertCommand.Parameters.AddWithValue("@viaID", viaID);
        insertCommand.ExecuteNonQuery();
        connection.Close();

        //Refresh the page after the subscription is done (redirect to itself)
        //This is necessary for the unsubscribe button to appear (the page load method is recalled)
        Response.Redirect(Request.RawUrl);
    }


    protected void unsubscribeSport(object sender, EventArgs e)
    {
        //When the user press the button, his viaID is deleted in the 'sportSubscription' table

        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string insertString = "DELETE FROM sportSubscription WHERE viaID=@viaID AND sportName=@sportname";
        SqlCommand insertCommand = new SqlCommand(insertString, connection);

        //Retrieving the UserName (viaID) of the current user
        int viaID = Int32.Parse(Membership.GetUser().UserName);
        string sportname = "Booty";

        //Inserting the values
        insertCommand.Parameters.AddWithValue("@viaID", viaID);
        insertCommand.Parameters.AddWithValue("@sportname", sportname);
        insertCommand.ExecuteNonQuery();
        connection.Close();

        //Refresh the page after the subscription is done (redirect to itself)
        //This is necessary for the unsubscribe button to appear (the page load method is recalled)
        Response.Redirect(Request.RawUrl);
    }
}