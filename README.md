# Cloud-Uploader-CLI
## Overview
This project is a command-line interface (CLI) tool built using Bash scripting to upload files to Amazon Web Services (AWS) S3 (Simple Storage Service). It provides a simple and efficient way to upload files securely to the cloud.

## Features
* Upload files to AWS S3.
* Check AWS configuration.
* Handle file synchronization options.
* Generate shareable links post-upload.
* Log events and errors for troubleshooting.

## Prerequisites
Before using this tool, ensure you have the following installed and configured:

- Bash: A Unix shell and command language.
- AWS CLI: Command-line tool to manage AWS services.
- AWS Credentials: Access Key ID and Secret Access Key configured with appropriate permissions for S3 operations.
- Installation

### AWS CLI Installation on Linux
The AWS CLI can be installed on Linux systems using the package manager or by manually downloading and installing it. Here's how to install it and configure it for this project:

## Using Package Manager (e.g., apt)

Update package index:
- sudo apt update
- Install AWS CLI:

- sudo apt install awscli
This installs the AWS CLI along with its dependencies.

<a href="/Screenshot 2024-07-23 at 6.54.44 PM.png"><>
Replace /path/to/local/file.txt with the path to your local file and s3://your-bucket-name/destination/ with your S3 bucket destination.

## Additional Notes
* Ensure the file path is correct and the file exists locally before uploading.
* Review synchronization options (overwrite, skip, rename) if the file already exists in S3.
* After upload, a shareable link will be generated for easy access to the uploaded file.
* Troubleshooting
* Check the clouduploader.log file for detailed logs of upload events and errors.
* Verify AWS CLI configuration and permissions if you encounter access or upload issues.