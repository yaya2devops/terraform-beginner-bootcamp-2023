## Installation of AWS CLI for Quick Interaction

In our quest to communicate swiftly and efficiently with AWS CLI, we've devised a streamlined installation process.

Although we've already incorporated it into Gitpod, we're now taking an extra step to ensure authentication.

To achieve this, we will create a bash script named `install_aws_cli` within the `./bin` directory.

This script will contain all the necessary commands,

- Starting with the shebang declaration
- Integrating the existent instructional commands

```sh
#!/usr/bin/env bash

# Navigate to the project's root directory
cd /workspace

# Download the AWS CLI installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer package
unzip awscliv2.zip

# Install AWS CLI
sudo ./aws/install

# Return to the project's root directory
cd $PROJECT_ROOT
```

We will update the environment variable to match the one previously established in our coding section.

You can find more information in the [branch five labeled](https://github.com/yaya2devops/terraform-beginner-bootcamp-2023/tree/5-project-root-environment-variable).

This is how we previously executed these commands in Gitpod:

```yaml
before: |
  cd /workspace
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  cd $THEIA_WORKSPACE_ROOT
```

Now, instead of duplicating this code in various places, we can simply reference our newly created script like this:

```yaml
before: |
  source .bin/install_aws_cli
```

This approach not only simplifies our workflow but also ensures consistency and ease of maintenance.

### Verifying Your AWS CLI Configuration

Before proceeding, it's crucial to ensure that your AWS CLI is properly configured for authentication. Follow these detailed steps to confirm your setup:

1. Check Your AWS CLI Authentication Status

```
aws sts get-caller-identity
```

If you see a message indicating that you are not authenticated, it's time to address this issue.

![Not Auth](assets/0.4.0/ur-not-authenticated.png)

#### Resolving the Unauthenticated Issue

To resolve the authentication issue, you have two options:

- follow the [official AWS documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
- or use me as your documentation.

2. Manual Configuration:

You can manually set your AWS CLI credentials.

These values provided here are for instructional purposes;

```
$ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
$ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$ export AWS_DEFAULT_REGION=us-west-2
```

Ensure you replace them with your actual

- AWS access key
- Secret key
- Preferred AWS region

Next, open your `.env` file that was created in again [branch five](https://github.com/yaya2devops/terraform-beginner-bootcamp-2023/tree/5-project-root-environment-variable).

Insert the following lines with your actual credentials:

```
# .env file

AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION=YOUR_PREFERRED_REGION
```

### 3. AWS IAM User Configuration

- Navigate to your AWS Management Console, specifically the IAM (Identity and Access Management) section.
- Create a new IAM user, naming it "yourname-terraform-beginner-bootcamp".
- Next, create a group of permissions and assign it to this newly created user.

Inside the IAM user settings;

- Access the "Security Credentials" tab.
- Scroll down and click "Create access key," selecting "CLI" as the access type.
- Confirm the action without specifying a value for the next option.

Retrieve the access key and secret access key from the previous step, and assign them to your environment variables as follows:

```
AWS_ACCESS_KEY_ID=your_access_key_here
AWS_SECRET_ACCESS_KEY=your_secret_key_here
AWS_DEFAULT_REGION=your_region_here
```

- Ensure you add these variables to your CLI session using the export command:

```
export AWS_ACCESS_KEY_ID=your_access_key_here
export AWS_SECRET_ACCESS_KEY=your_secret_key_here
export AWS_DEFAULT_REGION=your_region_here
```

#### Making Environment Variables Persistent in Gitpod

To make these environment variables persist in your Gitpod environment, use the gp env command:

```
gp env AWS_ACCESS_KEY_ID=your_access_key_here
gp env AWS_SECRET_ACCESS_KEY=your_secret_key_here
gp env AWS_DEFAULT_REGION=your_region_here
```

#### **Security Note: Do Not Leave Credentials in `.env.sample`**

Ensure you do not include your actual AWS credentials in your .env.sample file. Security check to keep sensitive information like AWS keys out of version-controlled files.

#### Verify AWS CLI Authentication

Now just double-check your AWS CLI authentication by running the command:

```
aws sts get-caller-identity
```

If everything is correctly configured, you should receive a JSON payload similar to this:

```json
{
  "UserId": "<value>",
  "Account": "<aws-id>",
  "Arn": "arn:aws:iam::<aws-id>:user/yourname-in-terraform-beginner-bootcamp"
}
```

Also add that at the end of the script so you can see it on gitpod launch

```bash

sudo ./aws/install
# I am Previous AWS CLI Install Instructions

aws sts get-caller-identity

cd $PROJECT_ROOT
# I am After AWS CLI Install Instructions

```

By following this, you'll ensure that your AWS CLI is properly authenticated!

## Refining AWS CLI Script

While re-executing the AWS CLI installation script, you might encounter a prompt requesting user input to confirm the installation if AWS CLI components already exist.

To ensure a smooth installation without user intervention, we need to modify the script accordingly. Here's a detailed guide on how to achieve this:

### 1. Handling Existing AWS CLI Components

The initial concern is addressing the presence of existing AWS CLI components.

To achieve this, we can take the following steps with a simple `ls` on the `workspace` dir.

- Check if the AWS CLI zip file exists and remove it if it does.
- Check if the AWS CLI directory exists and remove it along with the zip file if found.

To overcome this, we can add logic to remove any existing components before proceeding with the installation.

We got this from GPT, here is [the history](https://chat.openai.com/share/a49c1186-f867-421e-9d63-9b541e3f6677)

```bash
# Define the path to the AWS CLI zip file
AWS_ZIP_FILE='/workspace/awscliv2.zip'

# Check if the AWS CLI zip file exists and remove it if found
if [ -e "$AWS_ZIP_FILE" ]; then
    rm -f "$AWS_ZIP_FILE"
fi
```

When attempting to run the script, it remains unresponsive. We need to explore more innovative solutions to resolve this issue.

### 2. Assign Env Vars

Consider assigning it to an environment variable.

```
$AWS_ZIPPO='awscliv2.zip'
if [ -e "/workspace/$AWS_ZIPPO" ]; then
    rm -f "/workspace/$AWS_ZIPPO"
fi
```

Despite attempting another approach, the issue persists, and the script is still not functioning correctly.

### 3. GPT is Average

Let's investigate Stack Overflow using the 'dev null' approach:
https://stackoverflow.com/questions/31318068/how-to-write-a-shell-script-to-remove-a-file-if-it-already-exists

We performed a basic `ls` command to discover that the installation process created an 'aws' directory in addition to the zip file.

The straightforward solution is to delete both the directory and the zip file.

This can be accomplished after navigating to our workspace.

```sh
rm -f '/workspace/awscliv2.zip'
rm -rf '/workspace/aws'
```

It should function smoothly.<br>
This step may seem insignificant, but it can be quite beneficial for beginners to get going. <br>I used to see this as china. Look at me now. I'm rocking.

Thats it for this! See u soon.
