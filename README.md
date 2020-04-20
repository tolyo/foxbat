# foxbat

Order matchin engine

## Commands
* `make dep` - Installs dependencies to ./.rocks folder
* `make run` - Runs Tarantool instance locally inside the ./.tnt/init folder.
* `make test` - Runs tests from ./t folder

## Deploy
To deploy application the recommended directory structure is the following:
```
/
├── etc
│   └── foxbat
│       └── conf.lua
└── usr
    └── share
        └── foxbat
            ├── init.lua
            ├── app/
            └── .rocks/
```
You need to put a symlink `/etc/tarantool/instances.enabled/foxbat.lua -> /usr/share/foxbat/init.lua
` and you are ready to start your application by either `tarantoolctl start foxbat` or, if you're using systemd - `systemctl start tarantool@foxbat`