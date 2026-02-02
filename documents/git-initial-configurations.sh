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
