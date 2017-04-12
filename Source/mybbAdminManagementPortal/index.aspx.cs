using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using mybbAdminManagementPortal.core;

namespace mybbAdminManagementPortal
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            NameValueCollection nvclc = Request.Form;
           
            if (IsValid)
            {
                string textDeploymentName = nvclc["textDeploymentName"];
                core.StorageSettings storageSetting = new core.StorageSettings();
                storageSetting.deploymentName = textDeploymentName;
                storageSetting.emailAddress = EmailAddress.Text;
                storageSetting.InstanceType = InstanceType.SelectedValue ;
                storageSetting.DBInstanceType = DBInstanceType.SelectedValue ;
                storageSetting.DBName= DBName.Text ;
                storageSetting.DBPort = DBPort.Text;
                storageSetting.BillingThreshold = int.Parse(BillinThreshold.Text);
                storageSetting.SSHKeyName = SSHKeyName.Text ;
                storageSetting.DBUsername= DBUsername.Text ;
                storageSetting.DBPassword = DBPassword.Text;
                AWSManager awsManager = new AWSManager();
                awsManager.SetStorageSettings(storageSetting);

            }
        }

        protected void RetreiveBtn_Click(object sender, EventArgs e)
        {
            NameValueCollection nvclc = Request.Form;
            
            if (IsValid)
            {
                string textDeploymentName = nvclc["textDeploymentName"];
                Response.Write("Step One..." + textDeploymentName);
                AWSManager awsManager = new AWSManager();
                IEnumerable<mybbAdminManagementPortal.core.StorageSettings> storageSettings = awsManager.GetStorageSettings(textDeploymentName);

                // Get the settings from the database.
            
                if (storageSettings.Count() > 0) {
                    mybbAdminManagementPortal.core.StorageSettings storageSetting = storageSettings.ElementAt(0);
                    EmailAddress.Text = storageSetting.emailAddress; // "test@test.com";
                    InstanceType.SelectedValue = storageSetting.InstanceType;
                    DBInstanceType.SelectedValue = storageSetting.DBInstanceType;
                    DBName.Text = storageSetting.DBName;
                    DBPort.Text = storageSetting.DBPort.ToString();
                    BillinThreshold.Text = storageSetting.BillingThreshold.ToString();
                    SSHKeyName.Text = storageSetting.SSHKeyName;
                    DBUsername.Text = storageSetting.DBUsername;
                    DBPassword.Text = storageSetting.DBPassword;

                }
            }

            Response.Write("<script> activaTab('menu1') </script>");    
        }

    }
}