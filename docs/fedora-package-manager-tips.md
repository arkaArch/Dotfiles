### Remove a repo from fedora:
1. List the added keys: `rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n'`
2. Remove the key by: `sudo rpm --erase --allmatches gpg-pubkey-xxxxxxxx-xxxxxxxx`
3. Remove the repo: `sudo rm -r /etc/yum.repos.d/repositary-name.repo`
