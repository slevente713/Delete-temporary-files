Set-ExecutionPolicy Bypass -Force -Scope LocalMachine
cd "$env:USERPROFILE\Documents"
mkdir TestFolder
cd TestFolder
Write-Host "Appdata\Local\Temp tartalmának törlése... Removing files in Appdata\Local\Temp..." -ForegroundColor Cyan
rm "C:\Users\Default\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
rm "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Appdata\Local\Temp tartalma sikeresen törölve. Files in Appdata\Local\Temp were successfully removed." -ForegroundColor Green
Write-Host "Windows\Temp tartalmának törlése... Removing files in Windows\Temp..." -ForegroundColor Cyan
rm "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Windows\Temp tartalma sikeresen törölve. Files in Windows\Temp were successfully removed." -ForegroundColor Green
Write-Host "Prefetch fájlok törlése... Removing Prefetch files..." -ForegroundColor Cyan
rm "$env:SystemRoot\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Prefetch fájlok sikeresen törölve. Prefetch files were successfully removed." -ForegroundColor Green
Write-Host "Windows Update maradványok törlése... Removing Windows Update junk files..." -ForegroundColor Cyan
rm "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Windows Update maradványok sikeresen törölve. Windows Update junk were successfully removed." -ForegroundColor Green
Write-Host "Delivery optimization gyorsítótár törlése... Removing Delivery optimization cache..." -ForegroundColor Cyan
rm "C:\Windows\DeliveryOptimization\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "A Delivery optimization gyorsítótár sikeresen törlésre került. Delivery optimization cache were successfully removed." -ForegroundColor Green
Write-Host "Windows Error Reporting gyorsítotár törlése... Removing Windows Error Reporting cache..." -ForegroundColor Cyan
rm "C:\Windows\Minidump\*" -Recurse -Force -ErrorAction SilentlyContinue
rm "$env:LOCALAPPDATA\CrashDumps\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Windows Error Reporting gyorsítotár sikeresen törlésre került. Windows Error Reporting cache were successfully removed." -ForegroundColor Green
$answer = Read-Host "Szeretnéd törölni az Offline Web Pages mappa tartalmát? (y/n) Would you like to delete the files in Offline Web Pages Folder? (y/n)"
if ($answer -match "y") {
    $path = "C:\Windows\Offline Web Pages"
    if (Test-Path $path) {
        rm "$path\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Az Offline Web Pages mappa tartalma sikeresen törlődött. The files in the Offline Web Pages folder were successfully removed." -ForegroundColor Green
    }
} else {
    Write-Host "Megszakítottad az Offline Web Pages mappa tartalmának törlését. You cancelled removing the files in the Offline Web Pages folder." -ForegroundColor Yellow
}
$answer2 = Read-Host "Szeretnéd törölni a Windows LOG fájlokat? (y/n) Would you like to delete the Windows LOG files? (y/n)"
if ($answer2 -match "y") {
    $path2 = "C:\Windows\LogFiles"
    if (Test-Path $path2) {
        rm "$path2\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "A Windows LOG fájlok sikeresen törlésre kerültek. Windows LOG files were successfully removed." -ForegroundColor Green
    }
} else {
    Write-Host "Megszakítottad a Windows LOG fájlok törlését. You cancelled removing Windows LOG files." -ForegroundColor Yellow
}
cd "$env:USERPROFILE\Documents"
rmdir TestFolder
Set-ExecutionPolicy RemoteSigned -Force -Scope LocalMachine
pause