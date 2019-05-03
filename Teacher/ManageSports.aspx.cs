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
        if (!Page.IsPostBack)
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

            connection.Close();


        }
        Control ctrl = GetPostBackControl(this);
        if (ctrl != (Control)cancelCourseButton)
        {
            getNextLessons(dropDownSportName.SelectedValue);
        }
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

    public void getNextLessons(String sportname)
    {
        DataTable dataTable = new DataTable();
        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();
        //Build the select String and the SqlCommand
        string selectString = "SET DATEFIRST 1 SELECT id, CONVERT(VARCHAR(10), [weekday], 104) as weekday, [time], [place], [isCancelled] FROM [schedule] WHERE ([sportName] = @sportName) AND weekday >= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) and weekday< dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))";
        SqlCommand selectCommand = new SqlCommand(selectString, connection);
        selectCommand.Parameters.AddWithValue("@sportname", sportname);
        SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
        adapter.Fill(dataTable);

        nextLessonsDataList.DataSource = dataTable;
        nextLessonsDataList.DataBind();

        connection.Close();
        fillDropDownLessonNumber(sportname);
    }

    public void fillDropDownLessonNumber(String sportname)
    {
        DataTable dataTable = new DataTable();
        //Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string selectString = "SET DATEFIRST 1 SELECT id, CONVERT(VARCHAR(10), [weekday], 104) as weekday, [time], [place], [isCancelled] FROM [schedule] WHERE ([sportName] = @sportName) AND weekday >= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) and weekday< dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))";
        SqlCommand selectCommand = new SqlCommand(selectString, connection);
        //selectCommand.Parameters.AddWithValue("@weekday", weekday);
        selectCommand.Parameters.AddWithValue("@sportname", sportname);
        SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
        adapter.Fill(dataTable);
        dropDownLessonNumber.DataSource = dataTable;
        dropDownLessonNumber.DataBind();
        dropDownLessonNumber.DataTextField = "id";
        dropDownLessonNumber.DataValueField = "id";
        dropDownLessonNumber.DataBind();

        connection.Close();
    }

    protected void cancelCourse_Click(object sender, EventArgs e)
    {

        String lessonNumberString = dropDownLessonNumber.SelectedValue;
        int lessonNumber = Int32.Parse(lessonNumberString);

        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //Set up Connection
        SqlConnection connection = new SqlConnection(dbstring);
        connection.Open();

        //Build the select String and the SqlCommand
        string updateString = "UPDATE schedule SET isCancelled = 1 WHERE id=@id";
        SqlCommand selectCommand = new SqlCommand(updateString, connection);
        //selectCommand.Parameters.AddWithValue("@weekday", weekday);
        selectCommand.Parameters.AddWithValue("@id", lessonNumber);
        selectCommand.ExecuteNonQuery();

        connection.Close();
        getNextLessons(dropDownSportName.SelectedValue);
    }

    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label cancelledLabel = e.Item.FindControl("cancelledLabel") as Label;
        //If a lesson is cancelled, set the cancelled Label to visible and the color to a dark red
        if (cancelledLabel.Text == "True")
        {
            cancelledLabel.Visible = true;
            cancelledLabel.Text = "CANCELLED";
            cancelledLabel.ForeColor = Color.FromArgb(204, 0, 0);
        }
    }

    public static Control GetPostBackControl(Page page)
    {
        Control control = null;

        string ctrlname = page.Request.Params.Get("__EVENTTARGET");
        if (ctrlname != null && ctrlname != string.Empty)
        {
            control = page.FindControl(ctrlname);
        }
        else
        {
            foreach (string ctl in page.Request.Form)
            {
                Control c = page.FindControl(ctl);
                if (c is System.Web.UI.WebControls.Button)
                {
                    control = c;
                    break;
                }
            }
        }
        return control;
    }
}