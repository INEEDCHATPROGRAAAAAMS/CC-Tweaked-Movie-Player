This is a Movie player meant to run in CC:Tweaked

it works a little oddly because I'm lazy, but each video is broken into ~2 min chunks, specifically because CC:Tweaked can't pull more than 10MB over http at a time. These are actually played from the program on the floppy disk.
and the 'movie' program on the computer is essentially just running the command on the disk and displaying it on the monitor.

Requirements:

8x4 advanced monitor
floppy drive
advanced computer
speaker

Installation:
1. Run "pastebin run KtGzAUch" with an empty floppy inserted and the monitor and speaker connected.
2. the 'movie' command will now attempt to load the video on a connected floppy and play it on the monitor

How to make your own movies:
DISCLAIMER: I AM REQUIRED TO TELL YOU THAT I DO NOT SUPPORT PIRACY OF ANY KIND, AND YOU SHOULD UPHOLD THE LAW WITH THIS TOOL
1. Download Sanjuuni from https://github.com/MCJack123/sanjuuni/releases
2. Extract the Sanjuuni folder into a folder on your desktop (ie, deskop/movie/sanjuuni)
3. Install FFMPEG from https://www.ffmpeg.org/
4. in the 'movie' folder, place the 'converter' .bat script, and any MP4 files you want to convert to 32vid chunks
5. run the script and tell follow it's directions
6. Congrats, you now have the chunks. Now you have to put them somewhere they can be retreived by the player. I reccomend a github repository like this one.
7. Format your github repository so your video chunks are in named folders (ie, main/mha/mha0.32vid)
8. Edit the player on the floppy disk to point to the correct base filename (everything before (number).32vid)
9. save the player
10. Congrats, you now have your own movie on that floppy! You can copy it to other floppies, play it, or modify it!
