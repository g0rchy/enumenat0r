# Enumenat0r
Just another subdomain enumeration script :3

It's just a wrapper around some subdomain enumeration and fingerprinting tools, with some concurrency to save some time, not the best but it gets the job done.
# Used Tools:
  - [Assetfinder](https://github.com/tomnomnom/assetfinder)
  - [Httprobe](https://github.com/tomnomnom/httprobe)
  - [Amass](https://github.com/OWASP/Amass)
  - [SubFinder](https://github.com/projectdiscovery/subfinder)
  - [Aquatone](https://github.com/michenriksen/aquatone)
  - [httpx](https://github.com/projectdiscovery/httpx)
  - [gau](https://github.com/lc/gau)
# Notes:
  You have to change the path variable with the path of your own DNS resolvers list to amass working.
  
  Also make sure to tweak the number of threads of the tools based on your machine/need.
