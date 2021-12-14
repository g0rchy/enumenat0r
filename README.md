# enumenat0r
Just another subdomain enumeration script :3

It's just a wrapper around some subdomain enumeration and fingerprinting tools, with some concurrency to save some time, not the best but it gets the job done.

All the tools' output are stored in these files:
  - `domains.txt` contains all enumerated subdomains.
  - `live.txt` contains all live subdomains.
  - `gau.txt` contains the output of gau.
# Used Tools/Repos:
  - [Assetfinder](https://github.com/tomnomnom/assetfinder)
  - [Httprobe](https://github.com/tomnomnom/httprobe)
  - [Amass](https://github.com/OWASP/Amass)
  - [SubFinder](https://github.com/projectdiscovery/subfinder)
  - [Aquatone](https://github.com/michenriksen/aquatone)
  - [httpx](https://github.com/projectdiscovery/httpx)
  - [gau](https://github.com/lc/gau)
  - [resolvers](https://github.com/janmasarik/resolvers)
# Notes:
  You have to change the path variable with the path of your own DNS resolvers list to get amass working.
 
  Also make sure to tweak the number of threads of the tools based on your machine/needs
