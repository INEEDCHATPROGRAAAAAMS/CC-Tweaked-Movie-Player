@echo off
setlocal enabledelayedexpansion

:: Prompt for input video file
set /p input=Enter video filename (with extension): 
for %%F in ("%input%") do set base=%%~nF

:: Create output folder
mkdir "%base%"

:: Set chunk duration (2 minutes = 120 seconds)
set "duration=120"

:: Get total video duration in seconds
for /f "tokens=* delims=" %%a in ('ffprobe -v error -show_entries format^=duration -of default^=noprint_wrappers^=1:nokey^=1 "%input%"') do (
    set /a total=%%a
)

echo Total video duration: %total% seconds

:: Chunk loop
set index=0
:loop
set /a start=%index% * %duration%
if %start% GEQ %total% goto end

:: Name the intermediate chunk file
set "chunkname=%base%!index!.mp4"

:: Extract 2-minute chunk (no re-encoding)
ffmpeg -ss %start% -i "%input%" -t %duration% -vf "fps=10" -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 128k -y "%chunkname%"

:: Convert to 32vid with scaling + DFPWM audio
sanjuuni\sanjuuni.exe ^
  --input "%chunkname%" ^
  --output "%base%\%base%!index!.32vid" ^
  --32vid ^
  --width=32 ^
  --height=32 ^
  --dfpwm ^
  --compression=ans

:: Clean up intermediate file
del "%chunkname%"

set /a index+=1
goto loop

:end
echo.
echo ✅ All chunks converted to 32vid with DFPWM audio!
pause

