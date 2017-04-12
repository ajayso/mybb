using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using mybbAdminManagementPortal.core;
namespace mybbAdminManagementPortal
{

    public class CFStack
    {

        public string stackId { get; set; }
        
    }

    public class CFStackController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<CFStack> Get()
        {
            AWSManager awsManager = new AWSManager();
            string stackId = awsManager.FireCFforBBAdmin();
            CFStack cfStack = new CFStack();
            cfStack.stackId = stackId;
            CFStack[] stacks = new CFStack[1];
            stacks[0] = cfStack;

            return stacks;
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}