# gmansv
Server for manage gmod addons using git

# Usage
```sh
gman [lib name] [script name] [args]
```

 - configurating
```sh
gman config set-repositories-path [/full/path/to/repositories]	#this not move previous repositories path (it creates new, clone contents and remove previous), also updates hooks [config/repositories-hooks]
gman config set-gmod-path [/full/path/to/gmod]	#set gmod path for repositories
gman config set-group [new repositories group]	#set group for repositories
gman config set-user [new repositories user]	#set user for repositories
```

 - repository(addon) managment
```sh
gman repository create [repository(addon) name]	#create repository(addon)
gman repository deploy [Yy1/Nn0]	#enable/disable repository(addon) auto deploy, be careful cause this not match Nn0 :^)
gman repository set-deploy-branch [witch branch need to be deployed]	#set deploy branch
gman repository set-gmod-path [/full/path/to/gmod]	#set unique gmod(deploy) path
gman repository set-group [new repositories group]	#set repository(addon) group
gman repository set-user [new repositories user]	#set repository(addon) user
```