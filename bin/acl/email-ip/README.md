# Email Ip 若校园网 IP 变更，自动向指定邮箱发送邮件

配置文件 `config.txt` 由六行组成，格式如下：

```text
ip_pattern    校园网 ip 的正则表达式
from          发送邮件邮箱地址
to            接收邮件邮箱地址
server        发送者邮箱所属服务器
port          服务器端口
password      发送者邮箱密码
```

如：

```text
ip_pattern=10.103.*
from=Mike@pku.edu.cn
to=Mike@outlook.com
server=smtp.exmail.qq.com
port=587
password=1234567890
```
