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

public partial class Sports_DanceHall : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) {
        DataList1.DataBind();
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

        string sportname = "Dance Hall";

        string username = Helper.Helper.GetUserFirstName();

        insertCommand.Parameters.AddWithValue("@username", username);
        insertCommand.Parameters.AddWithValue("@sportname", sportname);
        insertCommand.Parameters.AddWithValue("@message", message);

        insertCommand.ExecuteNonQuery();

        connection.Close();

        DataListChat.DataBind();

        currentMessage.Text = "";
    }
}