# Running a Powershell command that runs a powershell file from a remote source like git 

DO NOT ever run commands or scripts from people you don't know or trust! Always check the commands, and see if they don't pull files in like, and execute remote code, like we do here ...

## This wil start a remote ps1 file on you machine from git.
 
````powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/WMauto.ps1') | Out-File $env:TEMP\MW.ps1; . $env:TEMP\MW.ps1; MW"````

Or try :

```powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/WM.ps1') | Out-File $env:TEMP\MouseWiggler.ps1; . $env:TEMP\MouseWiggler.ps1; WiggleMouse"```
