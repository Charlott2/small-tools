# 常量
$IP_LIKE = '10.103.*'

# 函数
function Send-Email {
    param (
        $From = "waoap@stu.cqut.edu.cn",
        $To = "shabbyacc@qq.com",
        $Subject = "IP Address Changed",
        [Parameter(Mandatory = $true)]$Body,
        $SMTPServer = "smtp.exmail.qq.com",
        $SMTPPort = "587",
        $Pass = '6OBwWkmhi3DnFDznUnjy'
    )
    $SMTPMessage = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body)
    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, $SMTPPort)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($From, $Pass);
    $SMTPClient.Send($SMTPMessage)
    Write-Host "Successfully sent email to $To."
}

# 主程序
# 获取当前时间
$now = Get-Date

# 获取以 10.103 开头的IP地址
$ip = Get-NetIPAddress | Where-Object { $_.IPAddress -like $IP_LIKE }
# 如果 ip 为空，说明不在校园网环境内，提示并退出
if ($null -eq $ip) {
    Write-Host 'Not in school network environment.'
    exit
}

# 读取旧的IP地址
$old_ip = Get-Content -Path 'current_ip.txt'

# 如果旧的IP地址和新的IP地址不一样，说明IP地址发生了变化，发送邮件
if ($old_ip -ne $ip.IPAddress) {
    # 把新的IP地址写入文件
    $ip.IPAddress | Out-File -FilePath 'current_ip.txt'

    # 把时间和IP地址合并成一个字符串，输出到控制台
    $info = $now.ToString() + ' ' + $ip.IPAddress
    Write-Host "info:`n$info"

    # 发送邮件
    Send-Email -Body $info
}
