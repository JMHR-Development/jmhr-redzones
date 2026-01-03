# JMHR Redzones

*(If you're looking for install guide check INSTALL.MD)*

-- What is this script? -- 
This is a 100% free and open source redzone script for PVP servers.
1. Kill Rewards - Cash and or items
2. Automatic teleports and revives no more /help
3. Discord and logging services built in
4. Configurable zones, enable specific options for specific zones. 

The inventories below are supported by default, you shouldn't have to change anything. Unfortunately I haven't been able to test all of these scripts so if they do not work please edit the code so they do then submit a pull request to help the rest of the community.

-- Supported Inventories --
ox_inventory, qb-inventory, codem-inventory

The ambulance scripts below are supported by default, you shouldn't have to change anything. Unfortunately I haven't been able to test all of these scripts so if they do not work please edit the code so they do then submit a pull request to help the rest of the community.

-- Supported Ambulance Jobs --
qb-ambulancejob, qbx_medical, esx_ambulancejob, ars_ambulancejob, wasabi_ambulance, brutal_ambulancejob, p_ambublancejob

-- But my ... isn't supported? --

Well, you can add it in. All of the code is open source so just do the following.
1. Set server_config.customInventory to true or server_config.customAmbulance to true (which ever you need)
2. Open bridge/custom_framework.lua
3. Add the code needed to make it work

-- Server Sided Varibles --
All secrets are in server_config.lua
Theoretically, cheaters could change the shared config.lua HOWEVER only the key of the index of the table is passed from client to server not the entire table, the server then looks up the key and loads it's own data from it's config which cannot be changed by cheaters. :)
`zone = Config.Zones[zoneKey] -- zone properties are reloaded server side`

Reward event could theoretically be triggered but both players would have to be in zone and it can't be exploited to give 10000000 cash only the amount that is on server side. It also has logs so if somebody was exploiting it you would be able to check and then check your server's death logs to see if the client who is triggering actually died.

*If you notice any security vulnerabilities please contact me or submit a pull request*

To reset the stats database please run `resetredzonestats` in server console.

-- Support --
If you need support join the Discord below, support is a privilige not a right so do not expect quick responses. If there are any issues please try to fix yourself first :)

https://discord.gg/D2YwMYYtYh

❤ https://ko-fi.com/jmhruk ❤
```
       _ __  __ _    _ _____        _    _ _  __
      | |  \/  | |  | |  __ \      | |  | | |/ /
      | | \  / | |__| | |__) |     | |  | | ' / 
  _   | | |\/| |  __  |  _  /      | |  | |  <  
 | |__| | |  | | |  | | | \ \   _  | |__| | . \ 
  \____/|_|  |_|_|  |_|_|  \_\ (_)  \____/|_|\_\
```
