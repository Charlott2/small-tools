# 定义发送邮件的函数
function Send-Email {
    param (
        [Parameter(Mandatory = $true)]$From,
        [Parameter(Mandatory = $true)]$To,
        [Parameter(Mandatory = $true)]$SMTPServer,
        [Parameter(Mandatory = $true)]$SMTPPort,
        [Parameter(Mandatory = $true)]$Password,
        [Parameter(Mandatory = $true)]$Body
    )
    $Subject = "Campus Network IP Address Change"
    $SMTPMessage = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body)
    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, $SMTPPort)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($From, $Password);
    $SMTPClient.Send($SMTPMessage)
    Write-Host "Successfully sent email to $To."
}

# 定义读取配置文件的函数
function Read-Config {
    param (
        [Parameter(Mandatory = $true)]$Path
    )
    $raw = Get-Content -Path $Path
    if ($raw.Length -ne 6) {
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

# 获取本机网络连接中，符合校园网正则表达式的 IP 地址
$ip = Get-NetIPAddress | Where-Object { $_.IPAddress -like $config['ip_pattern'] }
# 没有符合的 IP，说明不在校园网环境内，提示并退出
if ($null -eq $ip) {
    Write-Host 'You are ot in school network environment.'
    exit
}

# 读取旧的 IP 地址
if (Test-Path -Path 'current_ip.txt') {
    $old_ip = Get-Content -Path 'current_ip.txt'
}
else {
    $old_ip = ''
}

# 如果新旧 IP 地址不同，说明 IP 地址发生变化，发送邮件
if ($old_ip -ne $ip.IPAddress) {
    # 把新的 IP 地址写入文件
    $ip.IPAddress | Out-File -FilePath 'current_ip.txt'

    # 获取当前时间
    $now = Get-Date
    # 把时间和 IP 地址合并，输出到控制台
    $info = $now.ToString() + ' ' + $ip.IPAddress
    Write-Host "info:`n$info"

    # 发送邮件
    Send-Email $config['from'] $config['to'] $config['server'] $config['port'] $config['password'] $info
}
