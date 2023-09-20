# Effective Use of Environment Variables
We will explore various practical use cases for environment variables, providing clear and concise instructions to enhance your understanding.

I commit using an emoji `:building_construction:`	from here;

https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md

### Listing Environment Variables
To easily list all environment variables in your current environment, use the following command:

```
env
```

If you need to filter and display environment variables containing a specific keyword, employ the grep command as follows:
```
env | grep KEYWORD
```

The `grep` command is a powerful tool for data filtering.


## Managing Workspace in Gitpod
Gitpod workspaces begin at the `/workspace/here` directory. To avoid accidentally pushing unnecessary files to your repository, follow these steps in your bash script:

1. Navigate to the workspace at the beginning of your script:
```
cd /workspace
```

2. After the installation is complete, return to your actual workspace repository:
```
cd /workspace/terraform-beginner-bootcamp
```

This approach ensures that your installation occurs in the correct location, with the CLI readily available.


### Understanding Gitpod-Provided Environment Variables

Gitpod automatically assigns environment variables to your workspace. To access them, execute the `env` command and look for variables like `THEIA_WORKSPACE_ROOT`, which will have values like `/workspace/terraform-beginner-bootcamp-2023`. 

You can use these variables in your scripts as shown below:
```
cd $THEIA_WORKSPACE_ROOT
```

Remember

- To assign an environment variable in bash, use the syntax `VARIABLE_NAME='value'`.
- To print the content of a specific environment variable, employ the `echo $env` format.



### Assigning Environment Variables in Bash
You can manually assign environment variables within your bash script. Follow these steps:

1. At the top of your script, define the variable:
```
PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'
```

2. Use the variable as needed in your script:
```
cd $PROJECT_ROOT
```
Alternatively, you can assign the variable when executing the script:

```sh
PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023' ./bin/install_terraform_cli
```

Or export it within your environment:


```sh
export PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'
```

To persist this environment variable in Gitpod, utilize the gp env command:

```sh
gp env PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'
```
To remove the environment variable, use the unset command:

```sh
unset PROJECT_ROOT
```



## Create Dotenv

For better organization, it's recommended to centralize all environment variables in a dotenv file.


1. Create file in the ``/bin/` and name it `.env.sample`.
2. Add your desired environment variables to it.
```
# Hello I am called .env

# Define your project root
PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'
```

By following this approach, you can maintain a cleaner and more organized environment variable configuration in your project.

> You have to remove the .sample to make it work.


# Streamlining Terraform CLI Setup


We began our journey by identifying the Linux distribution we were using, specifically Ubuntu, and determined this by inspecting the system file.

[Check your OS Version](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)


We did it [just here](assets/os-distru.png).

Further, the cli failed due to the following.<br>
The point of concern was this line of code:
```sh
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

To enhance it, we modified it as follows:
```sh
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
```


Next, we consulted the official Terraform documentation to acquire the correct installation instructions: 

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


We meticulously followed these instructions one by one, resulting in successful installation.


[See this asset](assets/refactor-tf.png) to observe the comparison.

Subsequently, we transformed these steps into a Bash script, located at  `./bin/here`


### Automate the Script

In the context of Gitpod, we simplified the setup step within the workflow from:

```yaml
    init: |
      sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
      curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
      sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
      sudo apt-get update && sudo apt-get install terraform
```

To just;

```yaml
    init: |
     source ./bin/install_terraform_cli
```

Furthermore, we established a solution to address the scenario where initializing occurs only when starting a new workspace:

| Scenario                          | Initialization  |
|-----------------------------------|------------------|
| When starting a new workspace     | `init`           |
| Launching an existing workspace   | No `init`        |

**Solution;**

Use either the `before` or `command` directive as shown below:


```yaml
    before: |
     source ./bin/install_terraform_cli
```

#### Linux Permissions

Take the file, make it executable and associate it with the current user.

```sh
chmod u+x ./bin/install_terraform_cli
```

Or follownig this number:

```sh
chmod 744 ./bin/install_terraform_cli
```


Bash scripts start with shebang, learn more;
https://en.wikipedia.org/wiki/Chmod


Execute scripts;

Use the `./` shorthand notiation to execute the bash script.

eg. `./bin/install_terraform_cli` its included above.

> Refer to  [.gitpod.yml](.gitpod.yml)


### Considerations

Create an issue [#3](https://github.com/yaya2devops/terraform-beginner-bootcamp-2023/issues/3) that will have the number three cause;

- Our initial issue, identified as #1, was established.
- We initiated a Pull Request (PR) to implement the assigned task from that issue, which is now #2.
- Subsequently, we introduced a new issue, referenced as [#3](https://github.com/yaya2devops/terraform-beginner-bootcamp-2023/issues/3), with distinct objectives.




