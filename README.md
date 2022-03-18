# Simple 
I don't want to publish detection results as I'm not convinced it is not helping the bad guys more and in any case if you bought a shiny an expensive product you should take it for a spin. With all this around it should be fairly easy.

## Scenario
- You are installing an npm package that has a dependency that got backdoored
- In a malicious `preinstall` script it downloads and runs a script 
- That drops a bunch of backdoors
- Adversary is obvious oldschool reverse shell and opensource tools like Metasploit (and Mythic)

## Why?
Having realistic test cases for testing security tools is hard to come by
- You don't want to waste time creating a complicated, realistic scenario but if you get detected it is unclear if this is because what you did was obvious or it would get detected in less obvious situations too (legit parent, staged loading etc)
- If things don't you will get push back from providers - "Hey this is just your lab stuff in reality we would have detected it"
- Created a bunch of different versions of reverse shells so you can check how robust the detection is 

## Does NOT include anything new. Does not:
- include exploits / use any vulnerability
- have novel bypasses
- include anything post exploitation

## Troubleshooting
- Metasploit handlers will die every once in a while so only use

## Setup
- You will need a test machine(s) where you will be dropping the backdoors (local) and C2 that it will be able to access (remote)
local: you will need `curl`, `sed` and of course `npm`. Some of the getto reverse shells will fail because of shell syntax/capability/package difference but it should not break script execution
remote: you will need Metapsloit 

Super simple, but the internet will know your C2 IP:
1, fork the repo and set the C2 IP in the config file
2, clone your fork on the C2 and run `setup_and_run_remote.sh`
3, clone your fork on all your test machines and run `setup_and_run_local.sh`
Alternatively you can just clone this one and remember to set all configs without making typos

## Frequently Answered Answers
- This is just a lab scenario:
- Nobody uses these tools in reality, we do detect malware/miner etc better: 
- A reverse shell by itself is not malicious: I recommend you try all the post scripts in metasploit but don't start with the exploits. You can also manually do some obvious authorized_keys or cron persistance.

## Things you could do to go deeper
- adding Mythic is really worth it and you can work with a proper C2
- for macOS there is some pretty cool JXA stuff out there that works
- in some cases EDRs do detect command patterns maybe you want to have other options than wget -> sh and wget -> chmod -> run 
- payloads are served from the same IP but I tried to make it easy for you to change that (does not make a difference though)
