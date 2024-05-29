. ./lib/utils.ps1

$userHome = [System.Environment]::GetFolderPath("UserProfile")

# Check if the script is running as an Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Log "This script requires Administrator privileges to run." -Category "Script" -Type "Error"
    exit
}

Write-Log "Preparing environment..." -Category "Script" -Type "Info"

# Enable Developer Settings
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
Write-Log "Developer settings enabled." -Category "Windows" -Type "Debug"

# Install Winget
try {
    $wingetVersion = winget --version
    Write-Log "Winget is already installed. Version: $wingetVersion" -Category "Winget" -Type "Debug"
}
catch {
  Write-Log "Winget is not installed. Installing..." -Category "Winget" -Type "Warning"
  Run-Silent "Add-AppxPackage -Path https://aka.ms/appinstallerbundle"
  try {
    $wingetVersion = winget --version
    Write-Log "Winget installed. Version: $wingetVersion" -Category "Winget" -Type "Success"
  }
  catch {
    Write-Log "Winget installation failed." -Category "Winget" -Type "Error"
    exit
  }
}

# Install Scoop
try {
    Run-Silent "scoop --version"
    Write-Log "Scoop is already installed." -Category "Scoop" -Type "Debug"
}
catch {
  Write-Log "Scoop is not installed. Installing..." -Category "Scoop" -Type "Warning"
  Run-Silent "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
  try {
    Run-Silent "scoop --version"
    Write-Log "Scoop installed." -Category "Scoop" -Type "Success"
  }
  catch {
    Write-Log "Scoop installation failed." -Category "Scoop" -Type "Error"
    exit
  }
}

## Install Chocolatey
try {
    $chocoVersion = choco --version
    Write-Log "Chocolatey is already installed. Version: $chocoVersion" -Category "Chocolatey" -Type "Debug"
}
catch {
  Write-Log "Chocolatey is not installed. Installing..." -Category "Chocolatey" -Type "Warning"
  Run-Silent "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
  try {
    $chocoVersion = choco --version
    Write-Log "Chocolatey installed. Version: $chocoVersion" -Category "Chocolatey" -Type "Success"
  }
  catch {
    Write-Log "Chocolatey installation failed." -Category "Chocolatey" -Type "Error"
    exit
  }
}

Write-Log "Environment prepared. Creating symlinks..." -Category "Script" -Type "Info"

New-Item -ItemType SymbolicLink -Path "$PROFILE" -Value '../configs/powershell/profile.ps1' -Force

Write-Log "Symlinks created. Installing applications..." -Category "Script" -Type "Info"

$installedWingetPackages = winget list
$wingetPackagesToInstall = @(
  "Git.Git",
  "DEVCOM.Lua",
  "StrawberryPerl.StrawberryPerl",

  "wez.wezterm",
  "Neovim.Neovim",
  "Starship.Starship",

  "SlackTechnologies.Slack",
  "Discord.Discord",
  "OpenWhisperSystems.Signal",
  "Microsoft.Teams"

  "Python.Python.3.9"
  "Python.Python.3.10"
  "Python.Python.3.11"
  "Python.Python.3.12",

  "AgileBits.1Password",
  "Docker.DockerDesktop",
  "Obsidian.Obsidian",
  "Ollama.Ollama",
  "Oracle.VirtualBox",
  "GitHub.cli",
  "GoLang.Go",
  "HTTPie.HTTPie",
  "TheBrowserCompany.Arc",
  "Brave.Brave",
  "ajeetdsouza.zoxide",
  "Logitech.GHUB",
  "MiKTeX.MiKTeX",
  "Graphviz.Graphviz",
  "RaspberryPiFoundation.RaspberryPiImager",
  "Valve.Steam"
)

# Install Winget Packages
foreach ($pkg in $wingetPackagesToInstall) {
  if ($installedWingetPackages -match $pkg) {
    Write-Log "Package $pkg is already installed." -Category "Winget:$pkg" -Type "Debug"
    continue
  }

  Write-Log "$pkg is not installed. Installing..." -Category "Winget:$pkg" -Type "Warning"
  Run-Silent "winget install $pkg"
  if ($LASTEXITCODE -eq 0) {
    Write-Log "$pkg installed." -Category "Winget:$pkg" -Type "Success"
  }
  else {
    Write-Log "$pkg installation failed." -Category "Winget:$pkg" -Type "Error"
  }
}
