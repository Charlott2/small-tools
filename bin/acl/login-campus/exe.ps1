# 定义读取配置文件的函数
function Read-Config {
    param (
        [Parameter(Mandatory = $true)]$Path
    )
    $raw = Get-Content -Path $Path
    if ($raw.Length -ne 10) {
        Write-Host 'Config file syntax error.'
        exit
    }
    $config = @{}
    for ($i = 0; $i -lt $raw.Length; $i++) {
        $raw_parts = $raw[$i].Trim() -split '=', 2
        $config[$raw_parts[0]] = $raw_parts[1].Trim()
    }
    return $config
}

# 读取配置文件
$config = Read-Config 'config.txt'

# 请求头部信息
$headers = @{
    'Accept'          = '*/*'
    'Accept-Encoding' = 'gzip'
    'Accept-Language' = 'zh-CN,zh;q=0.9'
    'User-Agent'      = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML like Gecko) Chrome/107.0.0.0 Safari/537.36'
    'Cache-Control'   = 'no-cache'
    'Connection'      = 'keep-alive'
    'Cookie'          = $config['cookie']
    'Host'            = $config['host']
    'Origin'          = $config['origin']
    'Pragma'          = 'no-cache'
    'Referer'         = $config['referer']
}

# 请求体信息
$body = @{
    'userId'          = $config['user_id']
    'password'        = $config['password']
    'service'         = $config['service']
    'queryString'     = $config['query_string']
    'operatorPwd'     = ''
    'operatorUserId'  = ''
    'validcode'       = ''
    'passwordEncrypt' = $config['password_encrypt']
}

# 发送请求
$response = Invoke-WebRequest -Uri $config['url'] -Method 'POST' -Headers $headers -Body $body

# 如果日志条数超过 10 条，删除最旧的一条
if ((Get-ChildItem -Path 'log' | Measure-Object).Count -ge 10) {
    Get-ChildItem -Path 'log' | Select-Object -First 1 | Remove-Item
}

# 获取当前时间
$now = Get-Date -Format 'yyyyMMddHHmmss'
# 输出结果
Out-File -FilePath ('log\log-' + $now + '.json') -InputObject $response.Content -Encoding utf8
