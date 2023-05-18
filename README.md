<h1> Bash script for picking mpv youtube videos in dmenu </h1>
 
 You can call it from bash:

```shell
./pickFormatYoutube.sh "https://www.youtube.com/watch?v=3kFlpPaz2qs"
```
if you don't pick/select neither the video nor audio format, it will just launch 

```
mpv %url
```
I use it for newsboat like this:

```shell
#.newsboat/config
...
macro m set browser ".newsboat/scripts/pickFormatYoutube.sh  %u &"
...
```
You might want to add "--no-terminal" to mpv in the script and/or change dmenu fontsize, color

<h2> Showcase </h2>

https://youtu.be/ZviU8ftLsWM
