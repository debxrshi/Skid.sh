#!/bin/bash

# For the skids by a skid(?) lol

echo "
 @@@@@@   @@@  @@@  @@@  @@@@@@@         @@@@@@   @@@  @@@ 
@@@@@@@   @@@  @@@  @@@  @@@@@@@@       @@@@@@@   @@@  @@@ 
!@@       @@!  !@@  @@!  @@!  @@@       !@@       @@!  @@@ 
!@!       !@!  @!!  !@!  !@!  @!@       !@!       !@!  @!@ 
!!@@!!    @!@@!@!   !!@  @!@  !@!       !!@@!!    @!@!@!@! 
 !!@!!!   !!@!!!    !!!  !@!  !!!        !!@!!!   !!!@!!!! 
     !:!  !!: :!!   !!:  !!:  !!!            !:!  !!:  !!! 
    !:!   :!:  !:!  :!:  :!:  !:!  :!:      !:!   :!:  !:! 
:::: ::    ::  :::   ::   :::: ::  :::  :::: ::   ::   ::: 
:: : :     :   :::  :    :: :  :   :::  :: : :     :   : : 

                                      
                                         -- @debxrshi
"

# usage

if [ -z "$1" ]; then
	echo "usage: skid.sh target.com"
	exit 1
fi
target=$1
echo -e "...Executing tools...\n"

echo -e "\e[32m[+]\e[0m Looking for configs..."

if [ -f skidconfig ]; then
	echo -e "\e[32m[+]\e[0m Copying config \n"

	#TODO: Implement config parsing and setup
	chaos_key=apikey
else
	echo -e "\e[33m[-]\e[0m Config not found! Continuing without config\n"
fi

mkdir $target

cd $target

echo -e "\e[32m[+]\e[0m Probing target with httpx"

host_probe=$(httpx -u "$target" -fr -sc -title -td -server -retries 3 -fc 404 -lc -t 500)

if [ -z "$host_probe" ]; then
	echo -e "\n Host seems down. Did you type the right address?"
	exit 1
fi

echo -e "\n\e[32m[+]\e[0m Hunting subdomains with chaos \n\n"

chaos-client -d "$target" -key $chaos_key -o subs_chaos

echo -e "\n\e[32m[+]\e[0m Hunting subdomains with subfinder \n\n"

subfinder -d "$target" -all -recursive -o subs_subf -active

cat subs_* | sort | uniq >>subs

echo -e "\n\e[32m[+]\e[0m Probing subdomains with httpx\n\n"

httpx -l subs -fr -random-agent -sc -title -td -server -retries 3 -fc 404 -lc -t 500

#TODO: Setup more tools

paramspider -l subs

cat subs | gau -o url_gau

waymore

uro -i urls* -o urls_uro

uro -i results/*.txt -o urls_paramsp_uro

# ghauri

# wpscan

# gau

# waymore

# paramspider

# aquatone

# wayback

# sqlmap

# katana

# lfi testss

# uro

# xsstrike

# dalfox file "${target}_final_urls"
