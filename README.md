# RackWare SWIFT
## Product Overview
Move and Protect your Kubernetes/OpenShift deployments with RackWare SWIFT. Migrate Kubernetes/OpenShift applications from any environment to the IBM IKS Cloud or IBM OpenShift. Protect critical workloads with SWIFT’s Converged Disaster Recovery and Backup solution.
- Migration and Disaster Recovery: Move any container application to IBM Kubernetes Service (IKS) or IBM OpenShift or OpenShift Origins on IBM cloud
- Cross-cloud, Cross-platform, Cross-version replication, backup, and DR support 
- Automated: Configure flexible replication policies for your application to automate lift-and-shift migrations 
- Move Stateful AND Stateless applications 
- Automatic storage conversions: Break storage lock-in on the source side by choosing any IBM storage configured in your IKS or OpenShift cluster for the target
- Large sets of storage types supported for source and all IBM storage types supported for IKS or OpenShift target
- Migrate or set up DR for your container image registries: SWIFT is the first and only solution that allows setting up migration or DR for diverse set of on-prem and cloud container image registries
- Deploy and start using the solution in minutes 
- Free migrations: Move two micro-services with up to 400GB worth volumes and four image registries for free for a month! (IBM Cloud storage charges need to be paid separately)

[RackWare SWIFT Overview](https://www.rackwareinc.com/swift) | [Request a Demo](https://www.rackwareinc.com/contact-us)

## Before you begin
-	Make sure that you have IBM Cloud account permissions and access. 
-	Identify the region and subnet where you want to deploy the SWIFT
-	Create an SSH key that will be needed to connect to SWIFT after deployment. Or you can use the existing ssh key 

## Software Installation/Deployment
With the help of the following parameters, you can create the SWIFT server instance,
| Parameter | Description |
| --- | --- | 
| instance_name | Host name of the SWIFT virtual server instance |
| region | IBM Cloud region where all resources will be deployed |
| subnet_name | The name of [subnet](https://cloud.ibm.com/vpc-ext/network/subnets) |
| ssh_key | The name of public [SSH key](https://cloud.ibm.com/vpc-ext/compute/sshKeys) |
| profile | [Profile](https://cloud.ibm.com/docs/virtual-servers?topic=virtual-servers-about-virtual-server-profiles) for compute server |
| attach_floating_ip | Create and attach floating public IP Address |

After creation of a SWIFT instance, connect/ssh to the instance and execute the below command to set a password for the 'admin' user.
```
# sudo swiftcli user modify admin --password <password_of_your_choice>  
```
## Login to the SWIFT dashboard
To access the SWIFT dashboard, use the URL:
```
https://<swift-host-ip>/swift/dashboard
```  
![alt text](https://images.squarespace-cdn.com/content/v1/5c1e6c1896e76f8c9319d545/1618120718596-UZ97USN3QVZKX37EULD7/Login.png?format=750w "SWIFT Login")
```
Username: admin
Password: <password_set_in_prerequisite_step>
```  
If you have logged in successfully, then congratulations! You are now ready to migrate the Kubernetes/OpenShift applications to the Azure Kubernetes Service and/or enable DR/backup.

## Downloading Operations Guide/Get Additional Help
You can download operations guide from login page,  
![alt text](https://images.squarespace-cdn.com/content/v1/5c1e6c1896e76f8c9319d545/1618120805390-H9ZU2R2E2WSFSNE1FCU6/Login+Page.png?format=750w "Download SWIFT user guide")  

## SWIFT Demo
<iframe width="560" height="315" src="https://www.youtube.com/embed/DHT3GS7x-xs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## License
SWIFT is deployed with free tier license which will allow you move two micro-services (with up to 400GB worth of volumes) for free for a month! (IBM Storage charges need to be paid separately)
To know more about licensing reach out to us at sales@rackwareinc.com 

## Uninstalling the software
Complete the following steps to uninstall a Helm chart from your account. 

1. Go to the **Menu** > **Schematics**.
2. Select your workspace name. 
3. Click **Actions** > **Destroy resources**. All resources in your workspace are deleted.
4. Click **Update**.
5. To delete your workspace, click **Actions** > **Delete workspace**.

## Support
For support please contact us at support@rackwareinc.com. 
The support team is available 365x24x7 and will respond to the cases within 24 hours.

