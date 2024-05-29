function Write-Log {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Message,

        [Parameter(Mandatory=$true)]
        [string]$Category,

        [string]$Type = "INFO"
    )

    # Get the current timestamp
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Define the color for different message types
    switch ($Type.ToUpper()) {
        "INFO" {
            $color = "Cyan"
        }
        "WARNING" {
            $color = "Yellow"
        }
        "ERROR" {
            $color = "Red"
        }
        "SUCCESS" {
          $color = "Green"
        }
        default {
            $color = "White"
        }
    }

    # Format the log message
    $formattedMessage = "[{0}] [{1}] [{2}] {3}" -f $timestamp, $Type.ToUpper(), $Category, $Message

    # Write the message with color
    Write-Host $formattedMessage -ForegroundColor $color
}

function Run-Silent {
    param (
        [string]$Command
    )
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -Command $Command" -WindowStyle Hidden -Wait
}

