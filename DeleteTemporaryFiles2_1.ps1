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
$question1 = Read-Host "Szeretnéd törölni az Offline Web Pages mappa tartalmát? (y/n) Would you like to delete the files in Offline Web Pages Folder? (y/n)"
if ($question1 -match "y") {
    $path1 = "C:\Windows\Offline Web Pages"
    if (Test-Path $path1) {
        rm "$path1\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Az Offline Web Pages mappa tartalma sikeresen törlődött. The files in the Offline Web Pages folder were successfully removed." -ForegroundColor Green
    }
} else {
    Write-Host "Megszakítottad az Offline Web Pages mappa tartalmának törlését. You cancelled removing the files in the Offline Web Pages folder." -ForegroundColor Yellow
}
$question2 = Read-Host "Szeretnéd törölni a Windows LOG fájlokat? (y/n) Would you like to delete the Windows LOG files? (y/n)"
if ($question2 -match "y") {
    $path2 = "C:\Windows\LogFiles"
    if (Test-Path $path2) {
        rm "$path2\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "A Windows LOG fájlok sikeresen törlésre kerültek. Windows LOG files were successfully removed." -ForegroundColor Green
    }
} else {
    Write-Host "Megszakítottad a Windows LOG fájlok törlését. You cancelled removing Windows LOG files." -ForegroundColor Yellow
}

$question3 = Read-Host "Szeretnéd kikapcsolni a SysMain (vagy SuperFetch) szolgáltatást hogy a Prefetch mappába ne generálódjon több fájl? (HDD-n nem javasolt) [Y/N] Would you like to turn off SysMain (or SuperFetch) to don't generate more files to the Prefetch folder? (Not recomended in HDDs.) [Y/N]"
if ($question3 -match "y") {
    $services = @(
    "SysMain"           # SysMain (Superfetch)
)

foreach ($service in $services) {
    $serviceObj = Get-Service -Name $service -ErrorAction SilentlyContinue
    
    if ($serviceObj) {
        try {
            if ($serviceObj.Status -ne 'Stopped') {
                Stop-Service -Name $service -Force -Confirm:$false -ErrorAction SilentlyContinue
            }
            Set-Service -Name $service -StartupType Disabled
        }
    }
}
        Write-Host "A SysMain (SuperFetch) szolgáltatás sikeresen letiltva, és leállítva. The service SysMain (SuperFetch) is successfully disabled and stopped" -ForegroundColor Green
    }
} else {
    $services = @(
    "SysMain"           # SysMain (Superfetch)
)

foreach ($service in $services) {
    $serviceObj = Get-Service -Name $service -ErrorAction SilentlyContinue
    
    if ($serviceObj) {
        try {
            if ($serviceObj.Status -ne 'Running') {
                Start-Service -Name $service -Force -Confirm:$false -ErrorAction SilentlyContinue
            }
            Set-Service -Name $service -StartupType Automatic
        }
    }
}
    Write-Host "Megszakítottad a Sysmain (SuperFetch) kikapcsolását. You cancelled turning off SysMain (SuperFetch)." -ForegroundColor Yellow
}

cd "$env:USERPROFILE\Documents"
rmdir TestFolder
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
Set-ExecutionPolicy RemoteSigned -Force -Scope LocalMachine
pause
