# mpvtube

script watch videos from YouTube using ['rofi'](https://github.com/davatorium/rofi) and ['mpv'](https://github.com/mpv-player/mpv).

```
mpvtube -h

usage:
  mpvtube [OPTIONS]

-> Available Options:
   --,  --custom-args <custom_args>   user arguments to player (mpv)
   -a,  --all                         select item on 'channels list' to play all videos
   -c,  --channel                     select item on 'channels list',   select channel,   select video (YT only)
   -d,  --download <url>              download video from url
   -e,  --edit <editor>               edit playlist with default $EDITOR (or with <editor>)
   -f,  --fav                         select item on favourites playlist to play
   -H,  --history                     select a video from history file (mpv plugin)
   -n,  --new <category> <name> <url> add new channel in playlist
   -p,  --play <url>                  play given url
   -s,  --search <query>              search query on YouTube
   -S,  --set <property> <value>      change runtime parameters (property:value)
   -u,  --update                      turn on update flag (work with --channel)
   -D,  --debug                       turn on debug flag
   -h,  --help                        show this help
   -v,  --version                     print version and exit

v0.5.3-rc535 - writen by @fbnmtz 2020

```

[back](../readme.md)
