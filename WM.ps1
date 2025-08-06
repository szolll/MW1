
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Mouse {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);
    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, int dwExtraInfo);
    public const int MOUSEEVENTF_LEFTDOWN = 0x0002;
    public const int MOUSEEVENTF_LEFTUP = 0x0004;
    public const int MOUSEEVENTF_RIGHTDOWN = 0x0008;
    public const int MOUSEEVENTF_RIGHTUP = 0x0010;
    public const int MOUSEEVENTF_WHEEL = 0x0800;
}
"@
Add-Type -AssemblyName System.Windows.Forms

function Show-Menu {
    Write-Host "Mouse Control Menu:"
    Write-Host "1. Move to position"
    Write-Host "2. Left click"
    Write-Host "3. Right click"
    Write-Host "4. Scroll"
    Write-Host "5. Draw square"
    Write-Host "6. Wiggle mode (prevents screen lock, press Ctrl+C to stop)"
    Write-Host "7. Exit"
    $choice = Read-Host "Select an option (1-7)"
    return $choice
}

function Move-Mouse {
    $x = Read-Host "Enter X coordinate"
    $y = Read-Host "Enter Y coordinate"
    [void][Mouse]::SetCursorPos($x, $y)
}

function Left-Click {
    [Mouse]::mouse_event([Mouse]::MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
    [Mouse]::mouse_event([Mouse]::MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
}

function Right-Click {
    [Mouse]::mouse_event([Mouse]::MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0)
    [Mouse]::mouse_event([Mouse]::MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0)
}

function Scroll-Mouse {
    $amount = Read-Host "Enter scroll amount (positive up, negative down)"
    [Mouse]::mouse_event([Mouse]::MOUSEEVENTF_WHEEL, 0, 0, [uint32]$amount, 0)
}

function Draw-Square {
    $x = Read-Host "Enter starting X coordinate"
    $y = Read-Host "Enter starting Y coordinate"
    $size = Read-Host "Enter square size (pixels)"
    $points = @(
        ($x, $y),
        ($x + $size, $y),
        ($x + $size, $y + $size),
        ($x, $y + $size)
    )
    foreach ($point in $points) {
        [void][Mouse]::SetCursorPos($point[0], $point[1])
        Start-Sleep -Milliseconds 100
        Left-Click
    }
}

function Wiggle-Mouse {
    $duration = Read-Host "Enter wiggle duration (seconds, 0 for indefinite)"
    try {
        $duration = [int]$duration
        if ($duration -lt 0) { throw "Duration must be non-negative" }
        $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
        $endTime = if ($duration -eq 0) { [DateTime]::MaxValue } else { (Get-Date).AddSeconds($duration) }
        Write-Host "Wiggling mouse to prevent screen lock (Ctrl+C to stop)..."
        try {
            while ((Get-Date) -lt $endTime) {
                $preMovePos = [System.Windows.Forms.Cursor]::Position
                Start-Sleep -Seconds 5 # Wait for 5 seconds

                $postMovePos = [System.Windows.Forms.Cursor]::Position

                # If the mouse hasn't moved in 5 seconds, wiggle it
                if ($preMovePos.X -eq $postMovePos.X -and $preMovePos.Y -eq $postMovePos.Y) {
                    $newX = if ($postMovePos.X + 1 -ge $screen.Width) { $postMovePos.X - 1 } else { $postMovePos.X + 1 }
                    [void][Mouse]::SetCursorPos($newX, $postMovePos.Y)
                    [System.Windows.Forms.SendKeys]::SendWait("{F15}")
                }
                # If the user moved the mouse, do nothing. The loop will restart
                # and check again in 5 seconds from the new position.
            }
            Write-Host "Wiggle complete."
        } catch [System.Management.Automation.PSInvalidOperationException] {
            Write-Host "Wiggle stopped by user."
        }
    } catch {
        Write-Host "Error: Invalid duration. Please enter a non-negative number."
    }
}

while ($true) {
    $choice = Show-Menu
    switch ($choice) {
        "1" { Move-Mouse }
        "2" { Left-Click }
        "3" { Right-Click }
        "4" { Scroll-Mouse }
        "5" { Draw-Square }
        "6" { Wiggle-Mouse }
        "7" { exit }
        default { Write-Host "Invalid option" }
    }
}
