#!/bin/bash

#!/bin/bash

# Log file for recording events and troubleshooting
logfile="clouduploader.log"

log() {
    local message="$1"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" >> "$logfile"
}

# Read AWS credentials and configuration from environment variables or use defaults
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}"
S3_BUCKET="${S3_BUCKET}"

# Function to check S3 configuration
check_s3_configuration() {
    echo "Checking S3 configuration..."
    if aws s3 ls "s3://$S3_BUCKET" &> /dev/null; then
        echo "S3 configuration is set correctly. The bucket $S3_BUCKET is accessible."
    else
        echo "Error: S3 configuration is incorrect or the bucket $S3_BUCKET is not accessible."
        exit 1
    fi
}

# Check if the number of arguments is exactly 2
if [ $# -ne 2 ]; then
    echo "Please provide exactly two parameters: the file path and the destination path."
    exit 1
fi

# Assign the first argument and second argument to FILEPATH and S3_DESTINATION respectively
FILEPATH="$1"
S3_DESTINATION="$2"

# Extract the filename from FILEPATH
file_name=$(basename "$FILEPATH")
echo "Filename: $file_name"

# Function to check if the file exists locally
file_check() {
    if [ -f "$FILEPATH" ]; then
        echo "$file_name exists."
    else
        echo "Error: $file_name does not exist."
        exit 1
    fi
}

# Check if the file exists locally
file_check

# Function to upload file to S3 with progress bar using pv
upload_to_s3() {
    local local_file="$1"
    local s3_destination="$2"

    # Upload the file to S3 using AWS CLI and capture output/error
    if pv "$local_file" | aws s3 cp - "$s3_destination"; then
        log "File upload successful: $local_file -> $s3_destination"
        echo "File upload successful: $local_file -> $s3_destination"
    else
        log "Error: Failed to upload file $local_file to $s3_destination"
        echo "Error: Failed to upload file $local_file to $s3_destination"
        exit 1
    fi
}

# Function to handle file synchronization options in S3
file_sync() {
    if aws s3 ls "$S3_DESTINATION$file_name"; then
        read -p "File already exists in S3. Overwrite, skip, or rename? [o/s/r]: " choice
        case $choice in
            o)
                upload_to_s3 "$FILEPATH" "$S3_DESTINATION"
                ;;
            s)
                echo "Skipping upload."
                ;;
            r)
                upload_to_s3 "$FILEPATH" "$S3_DESTINATION-renamed"
                ;;
            *)
                echo "Invalid choice. Skipping upload."
                ;;
        esac
    else
        upload_to_s3 "$FILEPATH" "$S3_DESTINATION"
    fi
}

# Perform file synchronization if needed
file_sync

# Check the result of the upload
if aws s3 ls "$S3_DESTINATION$file_name"; then
    echo "Upload process completed successfully."
else
    echo "Upload process encountered an error."
fi

# Generate and display shareable link post-upload
presigned_url=$(aws s3 presign "$S3_DESTINATION$file_name" --expires-in 3600)
echo "Shareable link for the uploaded file: $presigned_url"
