using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

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
    }

}