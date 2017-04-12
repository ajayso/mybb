using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using mybbAdminManagementPortal.core;

namespace mybbAdminManagementPortal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      

        protected void Button1_Click1(object sender, EventArgs e)
        {
            AWSManager awsManager = new AWSManager();
            IEnumerable<Users> user = awsManager.CheckLogin(txtUserName.Text, txtpPassword.Text);

            if (user != null)
            {
                Users uu = user.First<Users>();
                Response.Write(uu.WelcomeMessage);
                Session.Add("UserName", uu.UserName);
                Session.Add("LoggedInAt", DateTime.Now);
                Session.Add("CognitoToken", "");

                Response.Redirect("index.aspx");
            }
            else
                Response.Write("Incorrect username , password OR no user found...");
        }
    }
}