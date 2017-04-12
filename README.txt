MyBBAWS Infrastructure


MyBB is a tiered application architecture consisting of a web, application and database tiers. The web and app tier are compute workloads and database.
MyBB Cloudformation deployment is a comprehensive deployment which addresses
- deploying the source code from github
- Addressing Non functional requirement such as security, scalability, availability and Monitoring.
The Management Application for Mybb is deployed on us-west-1 region can help in setting the deployment settings and fire the cloud formation from this application.


### Get the Stack running

To run this project in an AWS Account do the following:

- Create an EC2 KeyPair (required for SSH access, can't be automated by CF);
- Launch a stack from this template with CloudFormation;
- Go to the URL in the "ELBDNSName" output variable for the live MyBB application.

## Evaluation Access Account
Evaluation Access

AWS Console access
URL: https://747298667540.signin.aws.amazon.com/console
Username: mybbuserOne
Password: b!ctgzUqqADs

Notes:
Currently there are 2 stacks deployed in region uswest1
Read-only access granted for: CloudFormation, EC2, RDS, S3, SNS and CloudWatch.


MyBB application 
URL: http://ec2-52-53-151-145.us-west-1.compute.amazonaws.com
Administrator Account:
Username: admin
Password: 1234

Management Application 
URL: http://ec2-52-53-119-60.us-west-1.compute.amazonaws.com/login.aspx
Username: xo@crosssover.com
Password:mexx@2010


The Design document explains the Architecture , Design of mybb and management application