# Terraform

Notes:
- I made use of a terraform module for the VPCs, as it was easier/quicker for me
- The route tables could be simplified, having 1 routing table for all private subnets and 1 routing table for all public subnets. But I wanted to demonstrate a more granular option, which is easier to manage via modules, in case is necessary.
- Especifically for the S3 bucket, we could enable server-side encryption for objects stored there. We could enable logging, versioning and ACLs/Policies as well, depending on the usage.
- I separated each service in a different state file ensure security, availability and avoid mistakes. All states are stored in a S3 bucket.
- I didn't add any security groups because there's no EC2 requested for this assignment.


## Running terrafom

To create the whole structure is necessary to run the commands below in each service respository (s3, vpc and iam):

`terraform init`
`terraform plan`
`terraform apply`


### What type of security concerns do you have around the VPC?
In general:
- Who has permissions to change VPC configurations (defined on IAM)
- If the address range is under-defined for the VPC and related subnets (availability is a pillar of security)
- If subnets are defined in different AZs (again availability)
- If different environments correspond different VPCs (eg. VPC1 -> prod, VPC2 -> staging)
- If routes tables are well defined towards NAT, IGW and peering and if they are correctly associated with the right subnets
- Depending on the criticality of the business, if we monitor VPC activity with alerts (CloudWatch + CloudTrail)
- Depending on the criticality of the business, if we have the right network ACLs in place
(probably there are more but this is what I could remember)

### What questions do you have about the 2 users that have full admin access?
- Do we have specific role/function permissions to attach users to? What is preventig us from that?
- If they're not AWS account admins, could we change their permissions to something more granular/specific attached to their roles?
- Do we provide access/secret keys to these users? Could we remove them?
- Do we need to have users on IAM at all? Wouldn't be possible to use a SSO solution and connect users via roles?

### What security precautions would you take for system users vs. human users?
That's a very general question again that could not be fully connected to AWS & Terraform only, so in general:
For systems:
- use roles
- Do not use access/secret keys
- least privilege necessary, be granular with resource permissions
- strict security groups
- always use latest stable packages (or latest docker image) - hardening is a choice for non docker
- strong passwords (if aplicable, eg. SSH) and rotate them frequently
- implement secure (encrypted) communications whenever is possible (SSH,HTTPS,TLS)
For Humans:
- least privilege necessary attached to the employee role, be granular with resource permissions
- SSO
- MFA/2FA
- store passwords in a password management tool (not a in a pieace of paper or on slack or google docs)
- be careful with emails  (phishing)
- keep laptop up to date

There are much more stuff in security (vulnerability scanners, WAF, IDS/IPS, anti-virus, etc) but time's up :)
