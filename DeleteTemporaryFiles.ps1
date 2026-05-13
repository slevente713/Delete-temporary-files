Set-ExecutionPolicy Unrestricted -Force
cd "$env:USERPROFILE\Documents"
mkdir TestFolder
cd TestFolder
Write-Host "Appdata\Local\Temp tartalmának törlése... Removing files in Appdata\Local\Temp..." -ForegroundColor Cyan
rm "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Appdata\Local\Temp tartalma sikeresen törölve. Files in Appdata\Local\Temp were successfully removed." -ForegroundColor Green
Write-Host "Windows\Temp tartalmának törlése... Removing files in Windows\Temp..." -ForegroundColor Cyan
rm "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Windows\Temp tartalma sikeresen törölve. Files in Windows\Temp were successfully removed." -ForegroundColor Green
Write-Host "Prefetch fájlok törlése... Removing Prefetch files..." -ForegroundColor Cyan
rm "$env:SystemRoot\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Prefetch fájlok sikeresen törölve. Prefetch files were successfully removed." -ForegroundColor Green
$answer = Read-Host "Szeretnéd törölni az Offline Web Pages mappa tartalmát? (y/n) Do you want to delete the Offline Web Pages folder's files? (y/n)"
if ($answer -match "y") {
    $path = "C:\Windows\Offline Web Pages"
    if (Test-Path $path) {
        rm "$path\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Az Offline Web Pages mappa tartalma sikeresen törlődött. The files in the Offline Web Pages folder were successfully removed." -ForegroundColor Green
    }
} else {
    Write-Host "Megszakítottad az Offline Web Pages mappa tartalmának törlését. You cancelled removing Offline Web Pages folder's files." -ForegroundColor Yellow
}
Set-ExecutionPolicy RemoteSigned -Force
pause