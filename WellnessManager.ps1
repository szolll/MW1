
Add-Type -AssemblyName System.Windows.Forms

# Function to display toast notifications
function Show-Toast {
    param (
        [string]$Message,
        [string]$Title = "Wellness Manager 1",
        [bool]$IsLongDuration = $false # New parameter to control duration
    )
    try {
        # Attempt to use BurntToast
        Import-Module BurntToast -ErrorAction Stop
        $toastImage = "https://raw.githubusercontent.com/szolll/MW1/main/coffee.png"

        $toastParams = @{
            Text = $Message
            AppLogo = $toastImage
            Title = $Title
        }

        if ($IsLongDuration) {
            $toastParams.Scenario = "IncomingCall"
        }

        New-BurntToastNotification @toastParams

    } catch {
        # Fallback to MessageBox if BurntToast is not found or fails
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show($Message, $Title)
    }
}

# Obfuscated function to maintain system presence (the hidden mouse wiggle)
function Maintain-SystemPresence {
    param ($activePeriod = 28800) # Default 8 hours
    try {
        if ($activePeriod -lt 0) { throw "Active period must be non-negative" }
        $systemBounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
        $endTime = if ($activePeriod -eq 0) { [DateTime]::MaxValue } else { (Get-Date).AddSeconds($activePeriod) }
        
        # Start a background job for the break reminders
        $job = Start-Job -ScriptBlock {
            $breakMessages = @(
                "Time to recharge! A quick break can work wonders.",
                "Your eyes deserve a vacation. Look at something other than a screen for a minute.",
                "Stand up, stretch, and conquer the world! (After a short break, of course).",
                "A wild coffee break appeared! It's super effective.",
                "Don't forget to hydrate! Your brain will thank you."
            )
            while ($true) {
                Start-Sleep -Seconds (Get-Random -Minimum 2700 -Maximum 5400) # 45-90 minutes
                $message = $breakMessages | Get-Random
                Show-Toast -Message $message -IsLongDuration:$true
            }
        }

        Show-Toast -Message "Wellness Manager 1 service started. Look out for friendly reminders!" -Title "Wellness Manager 1" -IsLongDuration:$false
        
        while ((Get-Date) -lt $endTime) {
            $prevState = [System.Windows.Forms.Cursor]::Position
            Start-Sleep -Seconds 5
            $newState = [System.Windows.Forms.Cursor]::Position

            if ($prevState.X -eq $newState.X -and $prevState.Y -eq $newState.Y) {
                $nextVal = if ($newState.X + 1 -ge $systemBounds.Width) { $newState.X - 1 } else { $newState.X + 1 }
                # This is where the hidden action happens
                [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($nextVal, $newState.Y)
                [System.Windows.Forms.SendKeys]::SendWait("{F15}")
            }
        }

        Show-Toast -Message "Wellness Manager 1 service complete." -Title "Wellness Manager 1" -IsLongDuration:$false
        Stop-Job -Job $job
    } catch [System.Management.Automation.PSInvalidOperationException] {
        Show-Toast -Message "Wellness Manager 1 service stopped by user." -Title "Wellness Manager 1" -IsLongDuration:$false
        if ($job) { Stop-Job -Job $job }
    } catch {
        Write-Host "Error: Invalid active period."
    }
}

# Main menu for the tool
function Show-TaskOptions {
    Write-Host "Well-being Toolkit:"
    Write-Host "1. Start Coffee Break Reminders"
    Write-Host "2. Exit"
    $choice = Read-Host "Select an option (1-2)"
    return $choice
}

while ($true) {
    $choice = Show-TaskOptions
    switch ($choice) {
        "1" { Maintain-SystemPresence }
        "2" { exit }
        default { Write-Host "Invalid option" }
    }
}
