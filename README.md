# Small Tools

一些小工具。

Some small tools.

## 01 JVM (Java Version Manager)

> 关键词：Java 版本切换

Windows 平台下用于切换 Java 版本的小脚本，前置要求如下：

1. 下载安装几个你喜欢的 JDK 版本至指定路径（默认为 `C:\DevelopmentKit\Java\jdk-x`），其中，x 为安装路径的自定义后缀，推荐使用 JDK 的版本号，如 JDK 17.0.8.101 的安装路径应为 `C:\DevelopmentKit\Java\jdk-17.0.8.101-hotspot`。你可以通过修改[脚本](01jvm/exe.ps1)中的基本路径 $BASIC_PATH 指定你喜欢的路径前缀。
2. 根据需要修改脚本中提供的版本选项（默认提供 JDK8、JDK17 两个选项），需修改“展示版本选项”与“确定安装路径”两处。
3. 以管理员权限运行脚本，选择新的版本后，重新打开 Shell 并测试命令 `java -version`。
4. Enjoy! 💐

## 02 ACL (Auto Campus Life)

> 关键词：校园网、台式机、远程控制、监控 IP 变化

Windows 平台下基于任务计划程序实现的开机自动登陆校园网，若校园网 IP 变更，还能自动向指定邮箱发送邮件。主要适用于校园环境下的台式机场景，且常有远程控制的需求。

## 注意

1. 仅支持 Windows 平台。

2. 如果脚本执行失败，可能需要安装 PowerShell 7。最便捷的安装方式是直接从 Microsoft Store 中安装，无需其他操作。其他安装方式和安装有关事项见 [官方提供的安装教程](https://learn.microsoft.com/zh-cn/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3) 。

3. 如果出现拒绝执行脚本之类的提示，请使用以下命令将计算机上的执行策略更改为 RemoteSigned：

   `Set-ExecutionPolicy RemoteSigned`

   有关 Set-ExecutionPolicy 命令的内容见 [此处](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3) 。

   有关该问题的原因等请直接百度。
