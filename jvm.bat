@echo off
@echo ------------------------------------------------
@echo 当前 Java 版本为:
call java -version
@echo ------------------------------------------------
@echo 输入要使用的 Java 版本对应的选项:
@echo 选项	含义
@echo 8		切换环境为 JDK 8
@echo 17		切换环境为 JDK 17
@echo 20		切换环境为 JDK 20
@echo --		取消
@echo ------------------------------------------------
set /P choose=请输入版本:
IF "%choose%" EQU "8" (
    REM 修改JAVA_HOME环境变量为%JAVA_HOME_8%,
    sudo setx "JAVA_HOME" "%%JAVA_HOME_8%%/bin" /m
    echo 已经修改 "JAVA_HOME" 为 %%JAVA_HOME_8%%/bin
) ELSE IF "%choose%" EQU "17" (
    sudo setx "JAVA_HOME" "%%JAVA_HOME_17%%/bin" /m
    echo 已经修改 "JAVA_HOME" 为 %%JAVA_HOME_17%%/bin
REM setx "Path" "%cd%;%path%" /m
) ELSE IF "%choose%" EQU "20" (
    sudo setx "JAVA_HOME" "%%JAVA_HOME_20%%/bin" /m
    echo 已经修改 "JAVA_HOME" 为 %%JAVA_HOME_20%%/bin
) ELSE (
    echo 已取消
)
