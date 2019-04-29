using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Helper;
using System.Drawing;

public partial class Sports_Stretching : System.Web.UI.Page
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
}