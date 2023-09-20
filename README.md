# Effective Use of Environment Variables

We will explore various practical use cases for environment variables, providing clear and concise instructions to enhance your understanding.

I commit using an emoji `:building_construction:` from here;

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
