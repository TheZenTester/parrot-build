# Zentester Tweaks
Making a fork of ippsec's parrot build. Check out his youtube channel for all the awesome explainer videos.

Also slight difference in that this was tested on Parrot OS v6.4 Security Edition. I know ippsec's build relied upon Parrot HTB Edition.

# Summary of Changes
* Install `uv` for Python package/environment/tool management
* Install `python-tools` via `uv` (instead of `pipx`)
* Install `sliver` v1.5.43 using 
# To-Dos
- [ ] Check ``ansible-galaxy` `docker` version and upgrade via playbook. 
- [ ] make `.l50.sliver` changes within playbook
# Install Collections
```bash
# Needed for general tool install when installing ansible via apt
ansible-galaxy collection install community.docker --upgrade
# Needed to install sliver
ansible-galaxy collection install l50.arsenal
ansible-galaxy collection install cowdogmoo.workstation
```
https://galaxy.ansible.com/ui/repo/published/l50/arsenal/
https://galaxy.ansible.com/ui/repo/published/cowdogmoo/workstation/
# Changing l50.sliver
Used the `l50.arsenal ansible` community role (https://galaxy.ansible.com/ui/repo/published/l50/arsenal/content/role/sliver/).  Had to make a few changes. Didn't have the time to clone/make changes within the repo itself.  Consider that a to do for later...

Made changes to the `~/.ansible/collections/ansible_collections/l50/arsenal/roles/sliver/tasks/setup.yml` file.  I specifically was trying to get it to setup Sliver `v1.5.43`.  It was successful after making the following changes below. Also be sure to see the `sliver-setup.yml` file for specific variables needed for proper execution.
## Specifying Version
Pulling the `v1.5.43` tag instead of the `master`.
```yml
- name: Clone Sliver repo
  ansible.builtin.git:
    repo: 'https://github.com/bishopfox/sliver.git'
    dest: "{{ sliver_install_path }}"
    version: v1.5.43
    force: true
    update: true
  become: true
```
## Changing Operator Config
Turns out `v1.5.43` Doesn't need the `--permissions all` flag set. Removed that line.

```yml
- name: Generate operator config
  ansible.builtin.shell:
    cmd: |
      {{ sliver_install_path }}/sliver-server operator --name {{ sliver_username }} \
      --lhost localhost \
      --save {{ sliver_user_home }}/.sliver-client/configs
  become: true
  become_user: "{{ sliver_username }}"
  args:
    executable: /bin/bash
  changed_when: "'configs saved' in result.stdout"
  register: result
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
 