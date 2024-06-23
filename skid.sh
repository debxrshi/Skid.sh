#!/bin/bash

# For the skids by a skid(?) lol

echo -e '
         __   _     __       __  
   _____/ /__(_)___/ / _____/ /_ 
  / ___/ //_/ / __  / / ___/ __ \
 (__  ) ,< / / /_/ / (__  ) / / /
/____/_/|_/_/\__,_(_)____/_/ /_/ 
                                
                          
                          - @debxrshi
'

# usage

if [ -z "$1" ]; then
	echo -e "u\e[33m[-]\e[0m usage: skid.sh target.com"
	exit 1
fi
target=$1
echo -e "...Executing tools...\n"

echo -e "\e[32m[+]\e[0m Looking for configs..."

if [ -f skidconfig ]; then
	echo -e "\e[32m[+]\e[0m Copying config \n"

	#TODO: CONFIG PARSING
	chaos_key=AAAA
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

echo "$target" >>subs

cat subs_* | sort | uniq >>subs

echo -e "\n\e[32m[+]\e[0m Probing subdomains with httpx\n\n"

httpx -l subs -fr -random-agent -sc -title -td -server -retries 3 -fc 404 -lc -t 500

#TODO: Setup PARAM MINING, LFI, XSS, SQLi

paramspider -l subs -o params_paramsp

cat subs | gau --threads 8 | tee >(grep "=" >params_gau) | grep -v "=" >urls_gau

waymore -i "$target" -mode U -oU urls_waymore

tee >(grep "=" >params_waymore) <urls_waymore | grep -v "=" >urls_waymore

uro -i urls* -o urls

uro -i params* -o params

xsstrike -f params

dalfox file params

# sqlmap

# ghauri

# katana

#secretfinder

# lfi testss
