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




