using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mybbAdminManagementPortal
{
    public partial class StorageSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Response.Write("Step One...");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}