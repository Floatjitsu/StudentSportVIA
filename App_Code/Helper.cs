using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace Helper {
    /// <summary>
    /// Summary description for Helper
    /// </summary>

    public class Helper {
        public Helper() {
            
        }

        //Get the name of a given weekday string (For example "Monday")
        public static string GetWeekdayName(string weekday) {
            DateTime date = DateTime.Parse(weekday + " 00:00:00");
            return date.ToString("dddd", new CultureInfo("en-US"));
        }

        //Gets the firstName of the current user from the users table
        public static string GetUserFirstName() {
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

            firstName = (string)selectCommand.ExecuteScalar();

            connection.Close();

            return firstName;
        }
    }

}