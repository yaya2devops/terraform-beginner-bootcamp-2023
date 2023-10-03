# Create A `2.0.0` Ruby Server
In version `2.0.0` of our project, the primary focus is on integrating the Terratown mock server into our repository. 

There are many ways for embedding the mock server:

**A way can be;**
|🤔|We can include it as a submodule|
|---:|:---|
|🐛|Challenging to manage when issues arise|

**Another way may be;**
|🤔|Git checkout and refrain from committing |
|---:|:---|
|🐛|limiting when it comes to making on-the-fly changes|

We are going with **the first.**

### Bringing Terratown Mock Server into Our Repository

1. git clone the `terratowns_mock_server` repository to our project.
```sh
git clone https://github.com/ExamProCo/terratowns_mock_server.git
```
2. cd to `terratowns_mock_server` and verify the `.git` existence.

![Dotgit is hidden here](assets/2.0.0/thegit-folder.png)

3. Remove the `.git` directory from the cloned repository.
```
rm -rf .git
```
4. Verify the contents is gone using `ls -la`.
5. Go a level back and verify your very critical .git folder for the entire project.
```
cd .. && ls -la
```

![Root dotgit is Safe Plz](assets/2.0.0/root-git-safe.png)

Good. Take care..

###  Adjust Gitpod YAML Configuration
The Gitpod in that cloned project won't work because Gitpod operates only on the root level.
1. Move the Gitpod configuration from the cloned repository to the root level of our project.
```yaml
  - name: sinatra
    init: | 
      bundle install
      bundle exec ruby server.rb 
```
Include it in the `terraform` section.

2. Add `cd $PROJECT_ROOT` before your terraform, `aws-cli` and `http-server` section.
3. Terminate the previous Gitpod workspace because It is usless.
### Adjust the Repository Structure
1. Change the `bin` folder to `terratowns`.
2. Move scripts to our `bin` directory.
3. Perform necessary chmod operations on these files.
4. delete the older bin directory.

> Great and cool!

