#region Namespaces

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

using Amazon.EC2.Model;
using Amazon.SimpleDB;
using Amazon.SimpleDB.Model;
using Amazon.S3;
using Amazon.S3.Model;
using Amazon.EC2;
using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.DataModel;
using Amazon.DynamoDBv2.DocumentModel;
using Amazon.Runtime;
using Amazon.CloudFormation;
using Amazon.CloudFormation.Model;
using Amazon.RDS;
using Amazon.RDS.Model;

#endregion


namespace mybbAdminManagementPortal.core
{
    public class AWSManager
    {
        protected IAmazonEC2 ec2;
        protected IAmazonS3 s3;
        protected IAmazonSimpleDB sdb;

        private IAmazonEC2 AWSLogin()
        {
           
            StringBuilder sb = new StringBuilder(1024);
            using (StringWriter sr = new StringWriter(sb))
            {
                try
                {

                    ec2 = new AmazonEC2Client();

                    this.WriteEC2Info();
                    return ec2;
                }
                catch (AmazonEC2Exception ex)
                {
                    if (ex.ErrorCode != null && ex.ErrorCode.Equals("AuthFailure"))
                    {
                        sr.WriteLine("The account you are using is not signed up for Amazon EC2.");
                        sr.WriteLine("<br />");
                        sr.WriteLine("You can sign up for Amazon EC2 at http://aws.amazon.com/ec2");
                        sr.WriteLine("<br />");
                        sr.WriteLine("<br />");
                    }
                    else
                    {
                        sr.WriteLine("Caught Exception: " + ex.Message);
                        sr.WriteLine("<br />");
                        sr.WriteLine("Response Status Code: " + ex.StatusCode);
                        sr.WriteLine("<br />");
                        sr.WriteLine("Error Code: " + ex.ErrorCode);
                        sr.WriteLine("<br />");
                        sr.WriteLine("Error Type: " + ex.ErrorType);
                        sr.WriteLine("<br />");
                        sr.WriteLine("Request ID: " + ex.RequestId);
                        sr.WriteLine("<br />");
                        sr.WriteLine("<br />");
                        throw new Exception(sr.ToString());
                    }
                    return (null);
                }
            }

        }

        private string WriteEC2Info()
        {
            StringBuilder output = new StringBuilder();
            DescribeInstancesRequest ec2Request = new DescribeInstancesRequest();
            DescribeInstancesResponse ec2Response = ec2.DescribeInstances(ec2Request);
            foreach (Reservation reservation in ec2Response.Reservations)
            {
                foreach (Instance instance in reservation.Instances)
                {
                    output.AppendFormat("<li>{0}</li>", instance.InstanceId);
                }
            }
            return (output.ToString());
        }



        public List<AWSInstance> GetAllInstances()
        {
            List<AWSInstance> awsintances = new List<AWSInstance>();
            IAmazonEC2 ec2 = AWSLogin();

            StringBuilder output = new StringBuilder();
            DescribeInstancesRequest ec2Request = new DescribeInstancesRequest();
            DescribeInstancesResponse ec2Response = ec2.DescribeInstances();
            foreach (Reservation reservation in ec2Response.Reservations)
            {
                foreach (Instance instance in reservation.Instances)
                {
                    AWSInstance awsinstance = new AWSInstance();
                    awsinstance.Id = instance.InstanceId;
                    awsinstance.Status = GetStatus(awsinstance.Id, ec2);
                    awsintances.Add(awsinstance);
                }
            }
            return (awsintances);
        }

        public string GetStatus (string instanceId, IAmazonEC2 ec2)
        {
            var statusRequest = new DescribeInstanceStatusRequest();
            statusRequest.IncludeAllInstances = true;
            Amazon.EC2.Model.Filter filter = new Amazon.EC2.Model.Filter();
            filter.Name = "InstanceId";
            filter.Values = new List<string>() { instanceId };
            //statusRequest.Filters.Add(filter);
           
            var result = ec2.DescribeInstanceStatus(statusRequest);
            List<InstanceStatus> instanceStatus = result.InstanceStatuses;
            if (result!=null) { 
            if (instanceStatus[0].InstanceState.Code == 16)
                return "running";
            else
                return "shutdown";
            }
            return "No instances found...";


        }
        public List<AWSDBInstance> ListAllRDSInstances()
        {
            
            IAmazonEC2 ec2 = AWSLogin();
            List<AWSDBInstance> dbinstances = new List<AWSDBInstance>();
            var c = new AmazonRDSClient(); //Move region to configs
            var request = new DescribeDBInstancesRequest();
            var response = c.DescribeDBInstances(request);

            response.DBInstances
                .ForEach(instance => {
                    //do stuff for each instance in region
                    AWSDBInstance dbInstance = new AWSDBInstance();
                    dbInstance.DBName = instance.DBName;
                    dbInstance.Endpoint = instance.Endpoint.Address;
                    dbInstance.StatusInfos = instance.DBInstanceStatus;
                    dbInstance.Engine = instance.Engine;
                    dbinstances.Add(dbInstance);
                  

            });
            return (dbinstances);
        }
        public IEnumerable<Users> CheckLogin(string userName, string Password)
        {
            IAmazonEC2 ec2 = AWSLogin();
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            DynamoDBContext context = new DynamoDBContext(client);
            
            IEnumerable<Users> user = context.Scan<Users>(
                new ScanCondition("UserName", ScanOperator.Equal, userName),
                new ScanCondition("Password", ScanOperator.Equal, Password)
                );
            if (user.Count() > 0)
            {
                Console.WriteLine("User found .....");
                return user;
            }
            else
                return null;
           

            

        }

        public IEnumerable<StorageSettings> GetStorageSettings(string deploymentName)
        {
            IAmazonEC2 ec2 = AWSLogin();
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            DynamoDBContext context = new DynamoDBContext(client);

            IEnumerable<StorageSettings> storageSetting = context.Scan<StorageSettings>(
            new ScanCondition("deploymentName", ScanOperator.Equal, deploymentName)
             );
            if (storageSetting.Count() > 0)
            {
                Console.WriteLine("storageSetting found .....");
               
                return storageSetting;
            }
            else
                return null;
        }

        public void SaveStorageSettings(StorageSettings storageSetting)
        {
            IAmazonEC2 ec2 = AWSLogin();
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            DynamoDBContext context = new DynamoDBContext(client);

            Table storageSettingsCatalog = Table.LoadTable(client, "StorageSettings");
            GetItemOperationConfig config = new GetItemOperationConfig();

            Document document = storageSettingsCatalog.GetItem(storageSetting.deploymentName, config);
            document["emailAddress"] = storageSetting.emailAddress;
            storageSettingsCatalog.UpdateItem(document);



        }

        public void SetStorageSettings(StorageSettings storageSetting)
        {
            IAmazonEC2 ec2 = AWSLogin();
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            DynamoDBContext context = new DynamoDBContext(client);
            IEnumerable<StorageSettings> storageSettingA = context.Scan<StorageSettings>(
            new ScanCondition("deploymentName", ScanOperator.Equal, storageSetting.deploymentName)
            );
            DynamoDBOperationConfig config = new DynamoDBOperationConfig();
            config.IgnoreNullValues = true;
            
            context.Save< StorageSettings>(storageSetting, config);
        }

        public string FireCFforBBAdmin()
        {

            AmazonCloudFormationClient CFclient = new AmazonCloudFormationClient();

            CreateStackRequest stackRequest = new CreateStackRequest();

            IEnumerable<StorageSettings> storageSettings =  GetStorageSettings("mybbadmin");
            StorageSettings storageSetting = storageSettings.First();


            //OperationalEMail
            Amazon.CloudFormation.Model.Parameter OperationalEMail = new Amazon.CloudFormation.Model.Parameter();
            OperationalEMail.ParameterKey = "OperationalEMail";
            OperationalEMail.ParameterValue = storageSetting.emailAddress;
            stackRequest.Parameters.Add(OperationalEMail);

            //WWWInstanceType
            Amazon.CloudFormation.Model.Parameter WWWInstanceType = new Amazon.CloudFormation.Model.Parameter();
            WWWInstanceType.ParameterKey = "WWWInstanceType";
            WWWInstanceType.ParameterValue = storageSetting.InstanceType;
            stackRequest.Parameters.Add(WWWInstanceType);


            //WWWTargetCount
            Amazon.CloudFormation.Model.Parameter WWWTargetCount = new Amazon.CloudFormation.Model.Parameter();
            WWWTargetCount.ParameterKey = "WWWTargetCount";
            WWWTargetCount.ParameterValue = "1";
            stackRequest.Parameters.Add(WWWInstanceType);

            //DBInstanceClass
            Amazon.CloudFormation.Model.Parameter DBInstanceClass = new Amazon.CloudFormation.Model.Parameter();
            DBInstanceClass.ParameterKey = "DBInstanceClass";
            DBInstanceClass.ParameterValue = storageSetting.DBInstanceType;
            stackRequest.Parameters.Add(DBInstanceClass);

            //DBName
            Amazon.CloudFormation.Model.Parameter DBName = new Amazon.CloudFormation.Model.Parameter();
            DBName.ParameterKey = "DBName";
            DBName.ParameterValue = storageSetting.DBName;
            stackRequest.Parameters.Add(DBInstanceClass);

            //DBUsername
            Amazon.CloudFormation.Model.Parameter DBUsername = new Amazon.CloudFormation.Model.Parameter();
            DBUsername.ParameterKey = "DBUsername";
            DBUsername.ParameterValue = storageSetting.DBUsername;
            stackRequest.Parameters.Add(DBUsername);

            //DBPassword
            Amazon.CloudFormation.Model.Parameter DBPassword = new Amazon.CloudFormation.Model.Parameter();
            DBPassword.ParameterKey = "DBPassword";
            DBPassword.ParameterValue = storageSetting.DBPassword;
            stackRequest.Parameters.Add(DBPassword);

            //DBPort
            Amazon.CloudFormation.Model.Parameter DBPort = new Amazon.CloudFormation.Model.Parameter();
            DBPort.ParameterKey = "DBPort";
            DBPort.ParameterValue = storageSetting.DBPort;
            stackRequest.Parameters.Add(DBPort);


            //SSHKeyName
            Amazon.CloudFormation.Model.Parameter SSHKeyName = new Amazon.CloudFormation.Model.Parameter();
            SSHKeyName.ParameterKey = "SSHKeyName";
            SSHKeyName.ParameterValue = storageSetting.SSHKeyName;
            stackRequest.Parameters.Add(SSHKeyName);

            //BillingThreshold
            Amazon.CloudFormation.Model.Parameter BillingThreshold = new Amazon.CloudFormation.Model.Parameter();
            BillingThreshold.ParameterKey = "BillingThreshold";
            BillingThreshold.ParameterValue = storageSetting.BillingThreshold.ToString();
            stackRequest.Parameters.Add(BillingThreshold);

            // Read from Web.config MyBB_CF_TemplateUrl

            stackRequest.TemplateURL = System.Configuration.ConfigurationManager.AppSettings["MyBB_CF_TemplateUrl"];
            stackRequest.StackName = "mybbadmin" + (new Random(1000)).ToString();


            //stackRequest.
            CreateStackResponse response = CFclient.CreateStack(stackRequest);
            
            return response.StackId;

        }
    }


    [DynamoDBTable("Users")]
    public class Users
    {
        [DynamoDBHashKey]
        public string UserName
        {
            get; set;
        }
        [DynamoDBProperty]
        public string Password
        {
            get; set;
        }
        [DynamoDBProperty("LastLoggedIn")] //String Set datatype
        public string LastLoggedIn
        {
            get; set;
        }


        [DynamoDBProperty("WelcomeMessage")] //String Set datatype
        public string WelcomeMessage
        {
            get; set;
        }
    }


    [DynamoDBTable("StorageSettings")]
    public class StorageSettings
    {
        [DynamoDBHashKey]
        public string deploymentName
        {
            get; set;
        }
        [DynamoDBProperty]
        public string emailAddress
        {
            get; set;
        }
        [DynamoDBProperty("InstanceType")] //String Set datatype
        public string InstanceType
        {
            get; set;
        }


        [DynamoDBProperty("InstanceCount")] //String Set datatype
        public int InstanceCount
        {
            get; set;
        }

        [DynamoDBProperty("DBInstanceType")] //String Set datatype
        public string DBInstanceType
        {
            get; set;
        }

        [DynamoDBProperty("DBName")] //String Set datatype
        public string DBName
        {
            get; set;
        }

        [DynamoDBProperty("DBPort")] //String Set datatype
        public string DBPort
        {
            get; set;
        }

        [DynamoDBProperty("BillingThreshold")] //String Set datatype
        public int BillingThreshold
        {
            get; set;
        }


        [DynamoDBProperty("SSHKeyName")] //String Set datatype
        public string SSHKeyName
        {
            get; set;
        }

        [DynamoDBProperty("DBUsername")] //String Set datatype
        public string DBUsername
        {
            get; set;
        }


        [DynamoDBProperty("DBPassword")] //String Set datatype
        public string DBPassword
        {
            get; set;
        }
    }

}