# 真正执行脚本
$grandpaPath = Split-Path -Parent $PSScriptRoot
& ($grandpaPath + "\02acl\auto-campus-login\exe.ps1")
& ($grandpaPath + "\02acl\\email-ip\exe.ps1")

