if [[ $EUID -ne 0 ]]; then
	echo "This script requires root privileges to install packages. Please run with as root."
	exit 1
fi

apt update -y && apt install -y nmap vim python3 python3-pip unzip curl screen

go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest && go install -v github.com/OJ/gobuster/v3@latest && go install github.com/lc/gau/v2/cmd/gau@latest && go install github.com/hahwul/dalfox/v2@latest && go install github.com/ffuf/ffuf/v2@latest

pdtm -i subfinder,dnsx,httpx,katana,chaos-client

wget -P ${HOME}/.local/bin https://github.com/holly-hacker/git-dumper/releases/download/v0.1.0/git-dumper-linux && chmod +x ${HOME}/.local/bin/git-dumper-linux

git clone https://github.com/devanshbatham/paramspider ~/.local/bin/paramspider && cd ~/.local/bin/paramspider && pip install . --break-system-packages

git clone https://github.com/m4ll0k/SecretFinder.git ~/.local/bin/gitsecretfinder && cd ~/.local/bin/gitsecretfinder && pip install -r requirements.txt --break-system-packages && cp SecretFinder.py ../secretfinder && chmod +x ~/.local/bin/secretfinder

wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip && unzip SecList.zip && rm -f SecList.zip && mv SecLists-master /seclists

curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash -s /usr/local/bin

pip install waymore dirsearch arjun xsstrike uro --break-system-packages

echo "/root/.local/bin:/root/go/bin:/usr/local/bin:$PATH" >>~/.bashrc

source ~/.bashrc
