alias add2creds='echo $1 >> creds.txt'
alias edb='searchsploit $1'
alias edbc='searchsploit --cve $1'
alias edbm='searchsploit -m $1'
alias edbx='searchsploit -x $1'
alias gitfolder='function _gitfolder() { sudo mkdir -p /opt/$1 && sudo chown zentester:zentester /opt/$1 && cd /opt; }; _gitfolder'
alias gl="git log --all --graph --pretty=tformat:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --date=short"
alias gll="git log --all --stat --pretty=tformat:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gln="git --no-pager log --all --stat --pretty=tformat:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative -n 10"
alias gs='git status'
alias ip='ip --color=auto'
alias nsels='grep -o "[^\/]*$" $1 | tr "\n" "," | sed "s/,$//"'
alias nselu='find /usr/share/nmap/scripts -name $1'
alias pwkar='sudo /home/kali/.local/bin/autorecon $1 --single-target --nmap-append "\-n"'
alias pyup='python3 -m http.server'
alias urldecode=$'python -c "import sys, urllib as ul; \\\n\t    print ul.unquote_plus(sys.argv[1])"'
alias urlencode=$'python -c "import sys, urllib as ul; \\\n\t    print ul.quote_plus(sys.argv[1])"'
alias webup='ifconfig tun0 | head -n 3 && sudo python -m SimpleHTTPServer 80'
alias which-command=whence
alias xc='xclip -selection clipboard'
alias xclip='xclip -selection clipboard'
alias xclipic='xclip -selection clipboard -t image/png -i "/home/zentester/Documents/PentestingNotes/CTFs/HHC2023/resources/Pasted image `echo $1`.png"'