using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace mybbAdminManagementPortal
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Net.Http;
    using System.Web.Http;
    using mybbAdminManagementPortal.core;



    public class AWSDBInstance
    {

        public string DBName { get; set; }
        public string Endpoint { get; set; }
        public string StatusInfos { get; set; }
        public string Engine { get; set; }
    }

    public class AWSDBInstanceController : ApiController
    {

        List<AWSDBInstance> instances;


        public List<AWSDBInstance> GetAllInstances()
        {
            AWSManager awsManager = new AWSManager();
            instances = awsManager.ListAllRDSInstances();
            return instances;
        }

        public AWSDBInstance GetInstanceByDBName(string dbName)
        {
            var instance = instances.FirstOrDefault((p) => p.DBName == dbName);
            if (instance == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return instance;
        }

      
    }
}