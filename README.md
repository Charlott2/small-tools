# small-tools

一些小工具。

Some small tools.

## 01 jvm (Java Version Manager)

> 关键词：Java 版本切换

Windows 平台下用于切换 Java 版本的小脚本，前置要求如下：

1. 下载安装 jdk 并配置好对应版本的 **系统** 环境变量，如：jdk17 对应变量名为 JAVA_HOME_17，具体环境变量配置百度可查，不再赘述。
2. 根据需要修改 `01jvm/exe.ps1` 中的选项
3. 以管理员权限运行，重新打开 Shell/软件
4. 完毕！

## TODO: 02 acl (Auto Campus Life)

> 关键词：校园网、台式机、远程控制、监控 IP 变化

Windows 平台下基于任务计划程序实现的开机自动登陆校园网，若校园网 IP 变更，还能自动向指定邮箱发送邮件。主要适用于校园环境下的台式机场景，且常有远程控制的需求。

## 注意

1. 仅支持 Windows 平台。

2. 如果脚本执行失败，可能需要安装 PowerShell 7。最便捷的安装方式是直接从 Microsoft Store 中安装，无需其他操作。其他安装方式和安装有关事项见 [官方提供的安装教程](https://learn.microsoft.com/zh-cn/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3) 。

3. 如果出现拒绝执行脚本之类的提示，请使用以下命令将计算机上的执行策略更改为 RemoteSigned：

   `Set-ExecutionPolicy RemoteSigned`

   有关 Set-ExecutionPolicy 命令的内容见 [此处](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3) 。

   有关该问题的原因等请直接百度。
