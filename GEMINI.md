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

# AI Assistant Guide

This guide provides context for AI assistants to understand and interact with this project.

## Project Overview

This project contains PowerShell scripts designed to prevent a computer from becoming idle by simulating mouse movement. This is useful for preventing screen savers or sleep mode from activating during long-running tasks.

## File Descriptions

*   **`WM.ps1`**: The main script. It displays a menu to the user with several options, including moving the mouse, clicking, scrolling, and starting the "wiggle" mode. The key function is `Wiggle-Mouse`, which periodically moves the mouse.
*   **`WMauto.ps1`**: A variant of `WM.ps1` that automatically starts the "wiggle" mode without showing a menu. This is intended for users who want to run the script non-interactively.
*   **`WMauto.ps1.bak`**: A backup of the `WMauto.ps1` script.
*   **`README.md`**: The main documentation for human users, explaining how to run the scripts.
*   **`GEMINI.md`**: This file. It provides context for AI assistants.
*   **`LICENSE`**: The project's license file.

## Common Tasks

*   **Modifying Wiggle Logic:** The user may ask to change the behavior of the `Wiggle-Mouse` function in both `WM.ps1` and `WMauto.ps1`. This function is the core of the project. The current implementation checks if the mouse has been idle for 5 seconds before moving it one pixel.
*   **Committing and Pushing Changes:** The user may ask to commit and push changes to the git repository.
*   **Backup and Restore:** The user may ask to create or restore backups of the scripts.
