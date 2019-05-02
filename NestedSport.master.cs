using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

    public partial class NestedSport : System.Web.UI.MasterPage
    {
        public HtmlGenericControl sportWrapper4Visible
        {
            get { return sportWrapper4; }
            set { sportWrapper4 = value; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

}
