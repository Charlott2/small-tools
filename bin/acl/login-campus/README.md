# Login Campus 登录校园网

配置文件 `config.txt` 由十行组成，格式如下：

```text
url                 校园网登录请求地址
cookie              网页 Cookie
host                抓包得到的 host
origin              抓包得到的 origin
referer             抓包得到的 referer
user_id             你的校园网账户
password            抓包得到的加密后的密码（如果有加密）
service             服务商，如：中国移动
query_string        抓包得到的 query_string
password_encrypt    密码如果有加密则为 true
```

如：

```text
url=http://111.111.111.111/eportal/InterFace.do?method=login
cookie=XXX=;
host=111.111.111.111
origin=http://111.111.111.111
referer=http://111.111.111.111/eportal/index.jsp?xxx=123
user_id=123123123
password=ahuwfhuafiab
service=中国移动
query_string=xxx
password_encrypt=true
```
