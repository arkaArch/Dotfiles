### Remove a repo from fedora:
1. List the added keys: `rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n'`
2. Remove the key by: `sudo rpm --erase --allmatches gpg-pubkey-xxxxxxxx-xxxxxxxx`
3. Remove the repo: `sudo rm -r /etc/yum.repos.d/repositary-name.repo`



### Upgrade fedora to next version:
1. Upgrade the packages and reboot: `sudo dnf upgrade --refresh`
2. Download the updated packages: `sudo dnf system-upgrade download --releasever=43`
3. Performs the upgrade offline during the next boot: `sudo dnf5 offline reboot`
4. Remove retired packages:
    i. Install: `sudo dnf install remove-retired-packages`
    ii. Run: `remove-retired-packages`
5. If you wish: `sudo dnf autoremove`
