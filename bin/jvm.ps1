# 真正执行脚本
$grandpaPath = Split-Path -Parent $PSScriptRoot
& ($grandpaPath + "\01jvm\exe.ps1")
