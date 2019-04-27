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

public partial class Pages_Schedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //This Method is called everytime a new Item got bound to the datalist
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e) {
        Label weekday = e.Item.FindControl("weekdayLabel") as Label;
        Label weekdayName = e.Item.FindControl("weekdayName") as Label;
        //The nested DataList
        DataList list2 = e.Item.FindControl("DataList2") as DataList;
        weekdayName.Text = GetWeekdayName(weekday.Text);
        DataTable dataTable = GetSportsPerWeekday(weekday.Text);
        list2.DataSource = dataTable;
        list2.DataBind();
    }

    //Get all the sports for one weekday
    protected DataTable GetSportsPerWeekday(string weekday) {
        //Append the time to the weekday to set it as a parameter for the db query
        string weekdayParsed = weekday + " 00:00:00";
        DataTable dataTable = new DataTable();
        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        
        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string selectString = "SELECT sportName, time, place, isCancelled FROM schedule WHERE weekday=@weekday";
        SqlCommand selectCommand = new SqlCommand(selectString, connection);
        //selectCommand.Parameters.AddWithValue("@weekday", weekday);
        selectCommand.Parameters.AddWithValue("@weekday", DateTime.Parse(weekdayParsed));    
        SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
        adapter.Fill(dataTable);

        //Sort the table by the time of each course
        dataTable.DefaultView.Sort = "time asc";
        dataTable = dataTable.DefaultView.ToTable();
        connection.Close();
        dataTable.Dispose();
        return dataTable;
    }

    //Get the name of the current weekday, binded to the DataList
    protected string GetWeekdayName(string weekday) {
        DateTime date = DateTime.Parse(weekday + " 00:00:00");
        return date.ToString("dddd" , new CultureInfo("en-US"));   
    }

    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e) {
        Label cancelledLabel = e.Item.FindControl("cancelledLabel") as Label;
        //If a lesson is cancelled, set the cancelled Label to visible and the color to a dark red
        if(cancelledLabel.Text == "True") {
            cancelledLabel.Visible = true;
            cancelledLabel.Text = "CANCELLED";
            cancelledLabel.ForeColor = Color.FromArgb(204, 0, 0);
        }
        
    }
}