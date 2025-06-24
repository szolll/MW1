# RUN MW1

# Dont run commands from people you don't know or trust!
Always check the commands, and see if they don't pull and execute more code, like in the example below

# This wil start a program on you machine from powershell.
 
```powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/WM.ps1') | Out-File $env:TEMP\MouseWiggler.ps1; . $env:TEMP\MouseWiggler.ps1; WiggleMouse"```
