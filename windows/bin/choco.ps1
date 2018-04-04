Param(
  [Parameter(Mandatory=$true)][string]$version
)

$chocoInstall = 'bin\choco\tools\chocolateyInstall.ps1'
$path = "build\installers\headset-$version-setup.exe"

$sha256 = (CertUtil -hashfile "$path" SHA256)[1].Replace(' ', '')

$choco = Get-Content $chocoInstall
$choco[8] = "  checksum       = '$sha256'"
$choco | Out-File -filepath "$chocoInstall" -Encoding UTF8

choco pack 'bin\choco\headset.nuspec' -outputdirectory 'build'