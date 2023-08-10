# cd 至实际路径，执行 exe.ps1
Set-Location ((Split-Path -Parent $PSScriptRoot) + "/01jvm")
.\exe.ps1
