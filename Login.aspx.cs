﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SignUpButton_Click(object sender, EventArgs e) {
        Response.Redirect("SignUp.aspx");
    }

    protected void LoginButton_Click(object sender, EventArgs e) {
        HttpContext.Current.Response.Redirect("~/UnregisterdStudent/Home.aspx");
    }
}