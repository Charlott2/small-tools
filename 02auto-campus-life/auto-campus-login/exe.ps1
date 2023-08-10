# 常量
# 在此处替换抓包得到的登陆报文URL
$URL = "http://202.202.145.132/eportal/InterFace.do?method=login"
# 抓包得到的 headers 内容
$HEADERS = @{
    "Accept"          = "*/*"
    "Accept-Language" = "zh-CN,zh;q=0.9"
    "User-Agent"      = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36"
    "Cache-Control"   = "no-cache"
    # 填写抓包得到的值
    "Content-Length"  = "940"
    # 填写抓包得到的 cookie
    "Cookie"          = "EPORTAL_COOKIE_PASSWORD=; servicesJsonStr=12123020433%40%25%25username%40%25%25%E4%B8%AD%E5%9B%BD%E7%94%B5%E4%BF%A1%40%E6%A0%A1%E5%9B%AD%E5%86%85%E7%BD%91%40%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8; EPORTAL_COOKIE_OPERATORPWD=; EPORTAL_COOKIE_DOMAIN=; EPORTAL_COOKIE_USERNAME=12123020433; EPORTAL_COOKIE_SERVER=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8; EPORTAL_COOKIE_SERVER_NAME=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8; EPORTAL_COOKIE_SAVEPASSWORD=true; JSESSIONID=168879B8433357FEBC5F2FD6C9C5F87D"
    # 填写抓包得到的 host
    "Host"            = "202.202.145.132"
    # 填写抓包得到的 origin
    "Origin"          = "http=//202.202.145.132"
    "Pragma"          = "no-cache"
    #填写抓包得到的 referer
    "Referer"         = "http=//202.202.145.132/eportal/index.jsp?wlanuserip=f3639c6fccb1e7be61065a9627f56884&wlanacname=678091c499ce14d5f17e57f207341c3e&ssid=&nasip=aef6b29f10a395e5281558a383e32a56&snmpagentip=&mac=50979ceabad4baa5ee0ac4db5c81e75c&t=wireless-v2&url=d0752b48a62469db6e2c38ca77babc6e6ab4838182251048&apmac=&nasid=678091c499ce14d5f17e57f207341c3e&vid=7e3b3c169bb08265&port=e8b129e098269ba3&nasportid=9b1904c7c6d339b9fa9fb66740cc3ff72d8190d8ad24ca361f633990affc7ab5"
}
# 抓包得到的 data 内容
$BODY = @{
    # 填写抓包得到的 userId
    'userId'          = '12123020433'
    # 填写抓包得到的 password
    'password'        = '8769fba81be8fa966e516be3f76ccb56b0d9a08abbec613e1c3322fa5e8496ea0fed3bb5d18498e9e9eb6112674ef3bd9504cb8902791be7ae843e0ea6805f298e90951c27e93391c59266a3dd2d8862681a1756ddd7cd09dcde6f09972148bb014ef0a1aa3562e58699cc43462811cb4a6e717e72d0382c27889efd6ef13c88'
    # 填写抓包得到的 service
    'service'         = '%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8'
    'queryString'     = 'wlanuserip%3Df3639c6fccb1e7be61065a9627f56884%26wlanacname%3D678091c499ce14d5f17e57f207341c3e%26ssid%3D%26nasip%3Daef6b29f10a395e5281558a383e32a56%26snmpagentip%3D%26mac%3D50979ceabad4baa5ee0ac4db5c81e75c%26t%3Dwireless-v2%26url%3Dd0752b48a62469db6e2c38ca77babc6e6ab4838182251048%26apmac%3D%26nasid%3D678091c499ce14d5f17e57f207341c3e%26vid%3D7e3b3c169bb08265%26port%3De8b129e098269ba3%26nasportid%3D9b1904c7c6d339b9fa9fb66740cc3ff72d8190d8ad24ca361f633990affc7ab5'
    'operatorPwd'     = ''
    'operatorUserId'  = ''
    'validcode'       = ''
    # 填写抓包得到的 passwordEncrypt
    'passwordEncrypt' = 'true'
}

# 主程序
# 默认情况下，KeepAlive 为 True。
$response = Invoke-WebRequest -Uri $URL -Method POST -Headers $HEADERS -Body $BODY -ContentType "application/x-www-form-urlencoded; charset=UTF-8" -TransferEncoding "gzip, deflate"

Write-Host $response

# TODO: 未完成
