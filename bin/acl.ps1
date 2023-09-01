# 真正执行脚本
$grandpaPath = Split-Path -Parent $PSScriptRoot

Set-Location ($grandpaPath + "\02acl\auto-campus-login\")
py.exe exe.py

Set-Location ($grandpaPath + "\02acl\email-ip\")
pwsh.exe exe.ps1
