# Cloud-Uploader-CLI
##Overview
This project is a command-line interface (CLI) tool built using Bash scripting to upload files to Amazon Web Services (AWS) S3 (Simple Storage Service). It provides a simple and efficient way to upload files securely to the cloud.

##Features
Upload files to AWS S3.
Check AWS configuration.
Handle file synchronization options.
Generate shareable links post-upload.
Log events and errors for troubleshooting.
##Prerequisites
Before using this tool, ensure you have the following installed and configured:

Bash: A Unix shell and command language.
AWS CLI: Command-line tool to manage AWS services.
AWS Credentials: Access Key ID and Secret Access Key configured with appropriate permissions for S3 operations.
Installation
AWS CLI Installation on Linux
The AWS CLI can be installed on Linux systems using the package manager or by manually downloading and installing it. Here's how to install it and configure it for this project:

Using Package Manager (e.g., apt)
Update package index:

bash
Copy code
sudo apt update
Install AWS CLI:

bash
Copy code
sudo apt install awscli
This installs the AWS CLI along with its dependencies.

Manual Installation
Download AWS CLI Bundle:

bash
Copy code
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
Extract and Install AWS CLI:

bash
Copy code
unzip awscliv2.zip
sudo ./aws/install
This installs the AWS CLI globally for all users on your system.

AWS CLI Configuration
Configure the AWS CLI with your credentials and default region:

Configure AWS CLI:

bash
Copy code
aws configure
Follow the prompts to enter your AWS Access Key ID, Secret Access Key, default region, and output format.

Example:

bash
Copy code
AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID
AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY
Default region name [None]: YOUR_DEFAULT_REGION
Default output format [None]: json
Replace YOUR_ACCESS_KEY_ID, YOUR_SECRET_ACCESS_KEY, and YOUR_DEFAULT_REGION with your actual AWS credentials and preferred region.

Usage
Uploading a File to S3
To upload a file to your S3 bucket:

bash
Copy code
./clouduploader.sh /path/to/local/file.txt s3://your-bucket-name/destination/
Replace /path/to/local/file.txt with the path to your local file and s3://your-bucket-name/destination/ with your S3 bucket destination.

##Additional Notes
Ensure the file path is correct and the file exists locally before uploading.
Review synchronization options (overwrite, skip, rename) if the file already exists in S3.
After upload, a shareable link will be generated for easy access to the uploaded file.
Troubleshooting
Check the clouduploader.log file for detailed logs of upload events and errors.
Verify AWS CLI configuration and permissions if you encounter access or upload issues.