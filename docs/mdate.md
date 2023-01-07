# mdate

this is a wrapper to date command creating some shortcuts to get date in many formats


```
usage: 
  mdate [OPTIONS] 
                        
-> Date Options:        
   -d,  --day             current day (number)
   -m,  --month           current month (number)
   -y,  --year            current year (number)
   -Y,  --year2           current year (two digits)
   -D,  --date            current date (full)
                        
-> Time Options:        
   -H,  --hour            current hour (number)
   -M,  --minutes         current minutes (number)
   -s,  --seconds         current seconds (number)
   -t,  --time            current time (H M S)
                        
-> General Options:     
   -u,  --us              full date in US format
   -b,  --br              full date in BR format
   -r,  --header          date/time for header
   -R,  --header-en       date/time for header (us format)
   -w,  --weekday         current weekday (name)
   -W,  --weekday-en      current weekday (name) (us format)
   -f,  --for-filename    full date formated for filename
                        
-> Information Options: 
   -h,  --help            show this help
   -v,  --version         print version and exit
                        
v0.3.3-rc227 - writen by @fbnmtz 2020

```