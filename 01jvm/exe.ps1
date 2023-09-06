# Java Version Manager
# auth: SeagullOddy
# desc: Windos 上粗糙的 Java “版本切换”工具，需要管理员权限。
#       注意：请根据实际情况修改脚本中的基础路径 $BASIC_PATH，
#       或将 JDK 安装在指定的路径（C:\DevelopmentKit\Java\jdk-x）下，
#       其中，x 为 JDK 版本，如 JDK 20 对应 jdk-20。
# date: 2023-09-06

# 判断有无管理员权限，如果没有，提示并退出
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "请以管理员身份运行此脚本"
    exit
}

# !!!可修改!!! JDK 安装的基础路径，具体取决于你的 JDK 安装路径
$BASIC_PATH = "C:\DevelopmentKit\Java\jdk-"

# 调用 java -version 命令，显示当前 java 版本并展示选项
Write-Host @"
--------------------------------------------------
当前 Java 版本：
"@
java -version
#  !!!可修改!!! 根据需要在下方展示更多的版本选项
Write-Host @"
--------------------------------------------------
输入要使用的 Java 版本对应的选项:
选项	    含义
8		    切换环境为 JDK 8 LTS
17		    切换环境为 JDK 17 LTS
其他	    取消
--------------------------------------------------
"@

#  !!!可修改!!! 根据用户选择，确定 JDK 安装路径
$opt = Read-Host "选项"
if ($opt -eq "8") {
    $path = $BASIC_PATH + "8.0.382.5-hotspot"
}
# 样例：
# elseif ($opt -eq "11") {
#     $path = $BASIC_PATH + "xxx-hostpot"
# }
elseif ($opt -eq "17") {
    $path = $BASIC_PATH + "17.0.8.101-hotspot"
}
else {
    Write-Host "已取消"
}

# 修改系统环境变量
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", $path, "Machine")
Write-Host "已切换为 JDK $opt"
