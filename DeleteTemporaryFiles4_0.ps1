Write-Host "A felhasználó ideiglenes fájljainak törlése... Removing the user's temporary files..." -ForegroundColor Cyan
rm "C:\Users\Default\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
rm "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "A felhasználó ideiglenes fájljai sikeresen törölve. The user's temporary files were successfully removed." -ForegroundColor Green
Write-Host "Az operációs rendszer ideiglenes fájljainak törlése... Removing the operating system's temporary files..." -ForegroundColor Cyan
rm "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
rm "C:\Windows\SystemTemp\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Az operációs rendszer ideiglenes fájljai sikeresen törölve. The operating system's temporary files were successfully removed." -ForegroundColor Green
Write-Host "Prefetch fájlok törlése... Removing Prefetch files..." -ForegroundColor Cyan
rm "$env:SystemRoot\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Prefetch fájlok sikeresen törölve. Prefetch files were successfully removed." -ForegroundColor Green
Write-Host "Windows Update maradványok törlése... Removing Windows Update junk files..." -ForegroundColor Cyan
rm "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Windows Update maradványok sikeresen törölve. Windows Update junk were successfully removed." -ForegroundColor Green
Write-Host "A Kézbesítés Optimalizálási fájlok törlése... Removing Delivery optimization files..." -ForegroundColor Cyan
rm "C:\Windows\DeliveryOptimization\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "A Kézbesítés Optimalizálási fájlok sikeresen törlésre került. Delivery optimization files were successfully removed." -ForegroundColor Green
Write-Host "Windows Error Reporting gyorsítotár törlése... Removing Windows Error Reporting cache..." -ForegroundColor Cyan
rm "C:\Windows\Minidump\*" -Recurse -Force -ErrorAction SilentlyContinue
rm "$env:LOCALAPPDATA\CrashDumps\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Windows Error Reporting gyorsítotár sikeresen törlésre került. Windows Error Reporting cache were successfully removed." -ForegroundColor Green
$question1 = Read-Host "Szeretnéd törölni az Offline Web Pages mappa tartalmát? [Y/N] Would you like to delete the files in Offline Web Pages Folder? [Y/N]"
if ($question1 -match "y") {
    $path1 = "C:\Windows\Offline Web Pages"
    if (Test-Path $path1) {
        rm "$path1\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Az Offline Web Pages mappa tartalma sikeresen törlődött. The files in the Offline Web Pages folder were successfully removed." -ForegroundColor Green
    }
} else {
    Write-Host "Megszakítottad az Offline Web Pages mappa tartalmának törlését. You cancelled removing the files in the Offline Web Pages folder." -ForegroundColor Yellow
}
$question2 = Read-Host "Szeretnéd törölni a Windows LOG fájlokat? [Y/N] Would you like to delete the Windows LOG files? [Y/N]"
if ($question2 -match "y") {
    $path2 = "C:\Windows\LogFiles"
    if (Test-Path $path2) {
        rm "$path2\*" -Recurse -Force -ErrorAction SilentlyContinue
    $path02 = "C:\PerfLogs"
    if (Test-Path $path02) {
        rm "$path02\*" -Recurse -Force -ErrorAction SilentlyContinue
    $path002 = "C:\Windows\Logs"
    Get-ChildItem -Path $path002 -Recurse -File | ForEach-Object {
    Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
}}
    Write-Host "A Windows LOG fájlok sikeresen törlésre kerültek. Windows LOG files were successfully removed." -ForegroundColor Green
    }
} else {
    Write-Host "Megszakítottad a Windows LOG fájlok törlését. You cancelled removing Windows LOG files." -ForegroundColor Yellow
}

$question3 = Read-Host "Szeretnéd törölni az előző Windows telepítésed maradványait (Windows.old)? [Y/N] Would you like to delete your previous Windows install's junk files (Windows.old)? [Y/N]"
if ($question3 -match "y") {
    $path3 = "C:\Windows.old"
    if (Test-Path $path3) {
        rm "$path3\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Az előző Windows telepítésed maradványai (Windows.old) sikeresen törlésre kerültek. Your previous Windows install's junk files (Windows.old) were successfully removed." -ForegroundColor Green
    }
} else {
    Write-Host "Megszakítottad az előző Windows telepítésed maradványainak (Windows.old) törlését. You cancelled removing your previous Windows install's junk files (Windows.old)." -ForegroundColor Yellow
}

Write-Host "Lomtár tartalmának törlése... Clearing Recycle bin..." -ForegroundColor Cyan
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
Write-Host "A Lomtár tartalma sikeresen törlésre került. Recycle bin were successfully cleared." -ForegroundColor Green
pause