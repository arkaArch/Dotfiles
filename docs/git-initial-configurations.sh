# Set username & email:
git config --global user.name arka
git config --global user.email arkakar1313@gmail.com

# GitHub changed the default branch on new repositories from master to main. 
# Change the default branch for Git:
git config --global init.defaultBranch main

# Enable colorful output with git:
git config --global color.ui auto

# Set default branch reconciliation behavior to merging:
git config --global pull.rebase false

# Verify:
git config --get user.name
git config --get user.email



# Create an SSH key:
# GitHub uses SSH keys to allow you to upload to your repository without having to type 
# in your username and password every time with a SSH key:
# First generate a ssh key:
ssh-keygen -t ed25519 -C "arkakar1313@gmail.com"
# The key is same as my computer user password


# Link your SSH key with GitHub:
# Go to profile-picture(top-right) --> setting --> SSH and GPG keys(left side) --> New SSH key --> Add title as where it came from(usually hostname) --> copy the public key from .ssh folder --> Keep the key type Authentication Key --> Add ssh key.

# Now test your key by:
ssh -T git@github.com
# press yes, and then your key password...You see the msg as:
# Hi arkaArch! You've successfully authenticated, but GitHub does not provide shell access.





### Git commands and tests:

# Make a github repo Git-Test. Create a Readme there. 
# Copy ssh path and clone it with
git clone git@github.com:arkaArch/Git-Test.git
cd Git-Test
touch helloGit.txt
git status

# Notice helloGit.txt file is shown in red, which means that this file is not staged.
# Add helloGit.txt file to the staging area in Git.
git add helloGit.txt
git add . 
# To add all files in the current directory and all subsequent directories to the staging area.


# Now, type git status again. In the output, notice that your file is now shown in green, 
# which means that this file is now in the staging area.
git commit -m "Added helloGit"

# If you now check git status you'll see "Your branch is ahead of 'origin/main' by 1 commit."
# That means, you now have newer snapshots than what is on your remote repository. 

# To see activities:
git log

# Now push it in remote with:
git push origin main/ git push
