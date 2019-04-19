# aws-workshop
Materials for an introductory AWS Workshop, originally made for my course, Large Scale Data Methods.

Setup instructions - necessary before starting the workshop - are below.

## Setup
Please follow the steps below in preparation for the Amazon Web Services Workshop:
* Go to https://aws.amazon.com/
* Click Create an Account  and follow the ensuing instructions. Note you will have to: 
  * Enter Payment Information (I will teach you how to be sure you are not paying for things you do not intend to pay for).
  * Note that part of the sign-up procedure involves receiving a phone call and entering a PIN using the phone keypad. 
* Install the AWS Command Line Interface (CLI): https://docs.aws.amazon.com/cli/latest/userguide/installing.html 
* Configure the AWS CLI with your AWS credentials (note running 'aws configure' might be the easiest was to do this): https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html 

## Windows Users Additional Setup: Install Putty and PuttyGen
Windows users will need to use Putty and PuttyGen in order to use remote login through Secure Shell (SSH) to access you AWS resources. Go ahead and install Putty (which also installs PuttyGen).


## (Optional) Requesting Funding
* Request funding (free AWS credits) through AWS Educate.
  * Go to this page: https://www.awseducate.com/Registration
  * Select Student, then follow the instructions and fill out the ensuing forms.
* Alternatively, request funding through the GitHub Student Developer Pack: https://education.github.com/pack/join

## (Optional, Recommended Eventually) Configure AWS Billing Alerts

After you have setup your AWS account and installed the AWS CLI, you should setup notifications for costs incurred by AWS services. Neglecting to do this could lead to you incurring costs when you forget to terminate an instance or service - sometimes in the hundreds of dollars. Even still, you should also make sure to check in on your AWS billing page every few days, or even every day if you are actively running AWS services.

### Creating AWS Billing Notifications
First, you must enable billing notifications, by going to the Billing and Cost Management Console, navigation to Preferences, and checking the Receive Billing Alerts option, then saving your preferences. Next, head to the CloudWatch console to configure a specific billing alert. Change the AWS region to US East (N. Virginia) - it is not important why - and then select Alarms from the left navigation pane. At this point, a blue button with the text 'Create Alarm' should be visible, click this now. As you progress through the ensuing menus, you should:
* Click 'Total Estimated Charge'
* Choose currency 'USD' for United States Dollars, then click next.
* Set a name and description for the alarm.
* Set a threshold amount to trigger the alarm (between $25 or $50 might make sense)
* Define an action that will occur when the threshold is exceeded (see image below)

Note you will need to confirm your email address after selecting Create Alarm. You can see the complete instructions for this process from AWS at this link: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/monitor-charges.html
