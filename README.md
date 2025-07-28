# Zentester Tweaks
Making a fork of ippsec's parrot build. Check out his youtube channel for all the awesome explainer videos.

Also slight difference in that this was tested on Parrot OS v6.4 Security Edition. I know ippsec's build relied upon Parrot HTB Edition.

# Summary of Changes
* Install `uv` for Python package/environment/tool management
* Install `python-tools` via `uv` (instead of `pipx`)
# To-Dos
- [ ] Check ``ansible-galaxy` `docker` version and upgrade via playbook. 
# Install Collections
```bash
# Needed for general tool install when installing ansible via apt
ansible-galaxy collection install community.docker --upgrade
```
----
~~** Make sure to pip install ansible, apt has an older copy **~~

# Instructions
* ~~Start with Parrot HTB Edition~~
    * Tested on Parrot Security Edition (v6.4)
* ~~Install Ansible (python3 -m pip install ansible)~~
    * Ran into dependency errors trying to install ansible via `pip`. Instead I installed via `apt` and ran the upgrade command for `docker`.
* Clone and enter the repo (git clone)
* ansible-galaxy install -r requirements.yml
* Make sure we have a sudo token (sudo whoami)
* ansible-playbook main.yml

# Off-Video Changes
* Mate-Terminal Colors, I show how to configure it here (https://www.youtube.com/watch?v=2y68gluYTcc). I just did the steps in that video on my old VM to backup the color scheme, then copied it to this repo.
* Evil-Winrm/Certipy/SharpCollection/CME/Impacket, will make a video for these soon
* Updated BurpSuite Activation. Later versions of ansible would hang if a shell script started a process that didn't die. Put a timeout on the java process
 