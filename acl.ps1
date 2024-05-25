# ACL, Atuo Campus Life
# Author: Charlott2
# Update: 2024/03/09
# GitHub: https://github.com/Charlott2/small-tools

# 这是代理脚本，下方执行的是真正的工作脚本
$TOOLS_PATH = $PSScriptRoot

Set-Location ($TOOLS_PATH + "\bin\acl\login-campus\")
pwsh.exe exe.ps1

Set-Location ($TOOLS_PATH + "\bin\acl\email-ip\")
pwsh.exe exe.ps1

Set-Location ($TOOLS_PATH)
