#!/bin/bash

path='' # change it with the path of your DNS resolvers file

if [ $# -eq 0 ]
	then
		echo "Usage: $0 root-domain(s)"
		exit
fi

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

for domain in "$@"
do
	subfinder -d $domain -silent -recursive -all -t 200 >>  domains.txt &
	assetfinder --subs-only $domain >> domains.txt &
	amass enum --passive -rf $path -d $domain >> domains.txt &
	gau -subs $domain >> gau.txt &
done
wait

echo -e "\n\e[0;32m[+]\e[0m Passive enumeration done"
cat gau.txt | cut -d / -f 3 >> domains.txt
sort -u domains.txt -o domains.txt

echo -e "\n\e[0;32m[+]\e[0m Probing for live domains..."
cat domains.txt | httprobe >> live.txt 
sort -u live.txt -o live.txt

live=$(wc -l live.txt| cut -d ' ' -f 1)
echo -e "\n\e[0;32m[!]\e[0m Done:\n\t\e[1;33m[*]\e[0m Total discovered (sub)domains: $(wc -l domains.txt|cut -d ' ' -f 1)\n\t\e[1;33m[*]\e[0m Total live (sub)domains: $live\n"

prompt=$(echo -e "\e[0;31m[!]\e[0m The scope is large and it might take sometime to do domain flyover, want to do light fingerprinting instead? (y/n/q): ")
if [ $live -gt 1 ]
	then
		while true; do
			read -p "$prompt" yn
	    	case $yn in
	        	[Yy]* ) echo -e "\n\e[0;32m[+]\e[0m Starting Fingerprinting... (results are stored under fingerprint.out)"; cat live.txt | httpx -status-code -title -content-length -follow-redirects -tech-detect | tee -a fingerprint.out; break;;
        		[Nn]* ) echo -e "\n\e[0;32m[+]\e[0m Running aquatone..."; cat live.txt | aquatone -silent; break;;
				[Qq]* ) exit;;
        		* ) echo "Please answer y or n";;
    		esac
		done
fi
