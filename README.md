# Bug Bounty Automation Setup

```
   _____ __   _     __       __
  / ___// /__(_)___/ / _____/ /_
  \__ \/ //_/ / __  / / ___/ __ \
 ___/ / ,< / / /_/ / (__  ) / / /
/____/_/|_/_/\__,_(_)____/_/ /_/

                    -- @debxrshi

```

## Flow

subdomain enumeration -> url crawling -> param mining -> js analysis -> lfi/xss/sqli automation

### Tool setup

You can either build with docker:

```sh
docker build -t skid:skid .
```

Or,

run `install.sh` to install tools locally. Script is configured for an Ubuntu VPS with Golang installed.

### Usage

1. Create a file `skidconfig`
1. Add your API keys in the file. `skid.sh` is configured to parse them and place them in the correct locations for the tools that require API keys.
1. Run the script -> `./skid.sh target.com`
1. ???
1. Profit

### Footnote

If this tool helped you, feel free to hit me up and tell me your story :) [@cvewhen](https://x.com/cvewhen) on Twitter, [@xnu53x](discord.gg) on Discord.
