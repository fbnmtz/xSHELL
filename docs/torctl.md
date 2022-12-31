# torctl

Simple scritp to setup a tor-server via docker and route all traffic of your system to it.

```
torctl --help                                                                        

usage:
  torctl [-s] [-t] [-S] [-r] [-h] [-v]

-> Available Options:
   -s,  --start         start Tor Server and redirect traffic throug it
   -t,  --stop          stop Tor Server and restore firewall rules
   -S,  --status        show current status
   -r,  --restart       restart Tor Server
   -h,  --help          show this help
   -v,  --version       print version and exit

v0.0.2-rc91 - writen by @fbnmtz 2022

```

[voltar](../readme.md)
