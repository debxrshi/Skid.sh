# XSS and Bug Bounty Automation Setup

### Idea:

subfinder, amass, assetfinder, httpx, waymore, wayback -> final_urls.txt -> gau, paramspider, katana, arjun, uro -> params.txt -> dalfox, kxss, xsstrike, sqlmap, ghauri -> aquatone.

### Build with `docker`:

```sh
docker build -t skid:skid .
```

### Usage:

1. Create a file `skidconfig`
1. Add your API keys in the file. `skid.sh` is configured to parse them and place them in the correct locations for the tools that require API keys.
1. Run the script -> `./skid.sh target.com`
1. ???
1. Profit
