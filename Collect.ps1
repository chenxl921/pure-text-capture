# 强制让窗口支持 UTF8 中文显示
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$savePath = "$HOME\Desktop\Pure_Capture.txt"
$lastContent = ""

Clear-Host
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  数据采集工具已启动 [按 Ctrl+C 复制内容]" -ForegroundColor Yellow
Write-Host "==================================" -ForegroundColor Cyan

while($true) {
    try {
        $raw = Get-Clipboard -Raw
        $current = if ($raw) { $raw.Trim() } else { "" }
        if ($current -and ($current -ne $lastContent)) {
            $current + "`r`n`r`n" | Out-File -FilePath $savePath -Append -Encoding utf8
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] 捕获成功" -ForegroundColor Green
            $lastContent = $current
        }
    } catch {}
    Start-Sleep -Milliseconds 500
}