# Java Version Manager
# auth: SeagullOddy
# desc: Windos 上简易的 Java 版本切换工具
# date: 2023-08-10

# 判断有无管理员权限，如果没有，提示并退出
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "请以管理员身份运行此脚本"
    exit
}

# 调用 java -version 命令，显示当前 java 版本
Write-Host @"
--------------------------------------------------
当前 Java 版本：
"@
java -version
Write-Host @"
--------------------------------------------------
输入要使用的 Java 版本对应的选项:
选项	含义
8		切换环境为 JDK 8
17		切换环境为 JDK 17
20		切换环境为 JDK 20
--		取消
--------------------------------------------------
"@

# 展示选项，用户选择
$opt = Read-Host "选项"
switch ($opt) {
    "8" {
        # 修改系统环境变量
        [System.Environment]::SetEnvironmentVariable("JAVA_HOME", "%JAVA_HOME_8%", "Machine")
        Write-Host "已切换为 JDK 8"
    }
    "17" {
        [System.Environment]::SetEnvironmentVariable("JAVA_HOME", "%JAVA_HOME_17%", "Machine")
        Write-Host "已切换为 JDK 17"
    }
    "20" {
        [System.Environment]::SetEnvironmentVariable("JAVA_HOME", "%JAVA_HOME_20%", "Machine")
        Write-Host "已切换为 JDK 20"
    }
    default {
        Write-Host "已取消"
    }
}
