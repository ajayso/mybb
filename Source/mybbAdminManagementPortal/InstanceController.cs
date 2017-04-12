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

    public class AWSInstance
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
       
    }



    public class AWSInstanceController : ApiController
    {
        List<AWSInstance> instances;


        public List<AWSInstance> GetAllInstances()
        {
            AWSManager awsManager = new AWSManager();
            instances = awsManager.GetAllInstances();
            return instances;
        }

        public AWSInstance GetInstanceById(string id)
        {
            var instance = instances.FirstOrDefault((p) => p.Id == id);
            if (instance == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return instance;
        }

        public IEnumerable<AWSInstance> GetInstancesByStatus(string status)
        {
            return instances.Where(
                (p) => string.Equals(p.Status, status,
                    StringComparison.OrdinalIgnoreCase));
        }
    }
}