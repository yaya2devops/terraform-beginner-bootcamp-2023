# A Terraformer `tf` Alias

We'll walk you through creating an alias for Terraform, making it more convenient to use. 

E.g. Instead of `terraform init`, you can write just `tf init`.

- [Manual Alias Setup](#section-1-manual-alias-setup)
- [Alias in A Bash Script](#section-2-automating-alias-setup-with-a-bash-script)
- [Automate the Alias in Gitpod](#section-3-using-the-alias-in-gitpod)

We'll cover how to manually set up the alias and create a bash script to automate the process.

### Section 1: Manual Alias Setup

**Step 1: Accessing Your Bash Profile**
To create an alias for Terraform manually, you need to edit your Bash profile.

1. Open your terminal and run the following command to access your Bash profile:
```sh
nano ~/.bash_profile
```
2. This command will open your Bash profile in the Nano text editor.

**Step 2: Adding the Terraform Alias**
In the Nano text editor, navigate to the end of the file.

3. Add the following line to create an alias for Terraform:
```sh
alias tf="terraform"
```
4. Save your changes by pressing `Ctrl + O`, then press `Enter`.

**Step 3: Updating Your Bash Profile**
After adding the alias, you need to update your Bash profile. Run this command:
```sh
source ~/.bash_profile
```
Now, you have successfully set up the Terraform alias manually.

### Section 2: Automating Alias Setup with a Bash Script

**Step 1: Creating a Bash Script**
To automate the alias setup, you can create a bash script. Here's how:

1. Create a new file for your script using the terminal or a text editor. We'll call it `setup_tf_alias.sh`.

2. Open the script file for editing:
```sh
nano setup_tf_alias.sh
```
3. Inside the script file, add the following shebang to init the script:
```sh
#!/usr/bin/env bash
```

4. Check if the alias already exists in the .bash_profile

```sh
grep -q 'alias tf="terraform"' ~/.bash_profile
```
5. Add the if statement and append the the allias with the following code

```sh
if [ $? -ne 0 ]; then
    # If the alias does not exist, append it
    echo 'alias tf="terraform"' >> ~/.bash_profile
    echo "Alias added successfully."
```
> $? is a special variable in bash that holds the exit status of the last command executed

6. Add the Else to Inform the user if the alias already exists
```sh
else
    echo "Alias already exists in .bash_profile."
fi
```
7. Source the .bash_profile to make the alias available immediately
```sh
source ~/.bash_profile
```

For the sake of readability, the script does not perform line breaks.

I thought to update it with the following to make it so.

![PoC no line jump](assets/0.9.0/read-clearly.png)

```
echo -e "\nalias tf=\"terraform\"" >> ~/.bash_profile
```

Instead of what it previously was;
```
echo 'alias tf="terraform"' >> ~/.bash_profile
```

8. Save your changes by pressing `Ctrl + O`, then press `Enter`.

**Step 2: Making the Script Executable**
You need to make the script executable. Run the following command:

```sh
chmod u+x setup_tf_alias.sh
```

**Step 3: Executing the Script**
Now, you can execute the script to add the alias to your `.bash_profile`. Run the following command:

```sh
./setup_tf_alias.sh
```
The script will automatically add the Terraform alias to your Bash profile and update it.

### Section 3: Using the Alias in Gitpod

**Step 1 : Integrating with Gitpod**
If you're using Gitpod, you can integrate the alias in both AWS and Terraform blocks to ensure it's available in both terminals.

1. In your Gitpod configuration file (`.gitpod.yml`), add the following lines to both the AWS;

```yaml
  - name: aws-cli
    env:
      AWS_CLI_AUTO_PROMPT: on-partial
    before: |
      source ./bin/tf_alias
```

2. And Terraform blocks;
```yaml
  - name: terraform
    before: |
      source ./bin/tf_alias
```

This wont generate double alias line. Tested.

3. Save the `.gitpod.yml` file.

Now, every time you start a Gitpod workspace; 
- the alias will be automatically set up in both AWS and Terraform environments.
- You can now use `tf` instead of `terraform` in your commands

4. Restart your workspace and observe.

![You are A Terraformer and Transformer!](assets/0.9.0/terraformer.png)

This is `0.9.0` making your Terraform workflow more efficient and user-friendly.