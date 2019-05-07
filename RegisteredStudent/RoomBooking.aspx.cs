using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Pages_RoomBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ConfirmButton_Click(object sender, EventArgs e) {
        //No Validation Errors
        if (Page.IsValid) {
            string name = TextBoxName.Text;
            string desc = TextBoxDescription.Text;
            DateTime date = DateTime.Parse(TextBoxDate.Text);
            string startTime = DropDownListStartTime.SelectedItem.Text;
            string endTime = DropDownListEndTime.SelectedItem.Text;
            string location = "";
            if (gymRadioButton.Checked) {
                location = "Gym";
            } else if (leftHallRadioButton.Checked) {
                location = "Left Hall";
            } else if (rightHallRadioButton.Checked) {
                location = "Right Hall";
            }
            try {
                checkBooking(date, startTime, endTime, location);
                insertBooking(name, desc, date, startTime, endTime, location);
            } catch (Exception ex) {
                failureLabel.Visible = true;
                failureLabel.Text = ex.Message;
            }
            
        }
    }

    //Check if there is a booking already
    protected void checkBooking(DateTime date, string startTime, string endTime, string location) {
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        string checkStatement = "SELECT COUNT(*) FROM schedule WHERE weekday = @weekday AND time = @time AND place = @place";
        SqlCommand checkCommand = new SqlCommand(checkStatement, connection);

        //Append the endTime to the startTime
        string time = startTime + "-" + endTime;

        checkCommand.Parameters.AddWithValue("@weekday", date);
        checkCommand.Parameters.AddWithValue("@time", time);
        checkCommand.Parameters.AddWithValue("@place", location);

        int bookingExists = (int)checkCommand.ExecuteScalar();

        if (bookingExists != 0) {
            throw new Exception("Room already booked at the given time and date!");
        }
    }

    protected void insertBooking(string name, string description, DateTime date, string startTime, string endTime, string location) {
        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        string insertStatement = "INSERT INTO schedule(sportName, weekday, time, place) VALUES(@sportName, @weekday, @time, @place)";
        SqlCommand insertCommand = new SqlCommand(insertStatement, connection);

        //Append the name and the description to be the "sportName" in the schedule
        string sportName = name + "-" + description;
        //Append the endTime to the startTime
        string time = startTime + "-" + endTime;

        //Add Parameters to the insertCommand
        insertCommand.Parameters.AddWithValue("@sportName", sportName);
        insertCommand.Parameters.AddWithValue("@weekday", date);
        insertCommand.Parameters.AddWithValue("@time", time);
        insertCommand.Parameters.AddWithValue("@place", location);

        //Execute the SQL command
        insertCommand.ExecuteNonQuery();

        connection.Close();

        failureLabel.Visible = false;
        successLabel.Visible = true;        
    }
}