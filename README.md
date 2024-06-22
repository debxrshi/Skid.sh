# XSS and Bug Bounty Automation Setup

### Idea:

subfinder, amass, assetfinder, httpx, waymore, wayback -> final_urls.txt -> gau, paramspider, katana, arjun, uro -> params.txt -> dalfox, kxss, xsstrike, sqlmap, ghauri -> aquatone.

### Build with `docker`:

```sh
docker build -t skid:skid .
```

### Usage:

1. Create a directory `Hunter`
1. Create a subdirectory `config`
1. Put all the config files for the tools `subfinder, https, etc` inside that folder.
1. `docker run -itv ~/Hunter:/hunter/ skid:skid bash`
1. Run the script or HAYW. `./skid.sh target.com`
1. ???
1. Profit
