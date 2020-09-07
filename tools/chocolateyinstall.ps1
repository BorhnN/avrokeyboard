
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.omicronlab.com/download/setup_avrokeyboard_5.6.0.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'Avro Keyboard*'
  checksum       = 'E617B987F1E23DEDD1514FAD7B5CA81E464727418B86366F0D4808E19FD47B48'
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}
Stop-Process -Force -Name "Avro Keyboard" -ErrorAction SilentlyContinue
Install-ChocolateyPackage @packageArgs