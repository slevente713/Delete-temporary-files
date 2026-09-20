Write-Host "Welcome in Delete-Temporary-Files (No Windows Update Temp Deletion version)!" -ForegroundColor Blue

$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "[WARNING]: You ran this script, without elevated priviliges. Some features may not work." -ForegroundColor Red
$continueAnyway = Read-Host "Would you like to restart the script as administrator? [Y/n]"
    if ($continueAnyway -match "n") {
        Write-Host "Removing the user's temporary files..." -ForegroundColor Cyan
            rm "C:\Users\Default\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
            rm "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed the user's temporary files." -ForegroundColor Green

        Write-Host "Clearing Recycle bin..." -ForegroundColor Cyan
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully cleared Recycle bin." -ForegroundColor Green

        Write-Host "Clearing DNS Cache..." -ForegroundColor Cyan
            ipconfig /flushdns
        Write-Host "Successfully cleared DNS Cache." -ForegroundColor Green

        Write-Host "Removing Windows Error Reporting files..." -ForegroundColor Cyan
            rm "$env:USERPROFILE\AppData\Local\CrashDumps\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed Windows Error Reporting files." -ForegroundColor Green
        pause

    }
    else {
        Start-Process powershell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
        exit
    }
}



$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if ($isAdmin) {

        Write-Host "Removing the user's temporary files..." -ForegroundColor Cyan
            rm "C:\Users\Default\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
            rm "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed the user's temporary files." -ForegroundColor Green

        Write-Host "Removing the operating system's temporary files..." -ForegroundColor Cyan
            rm "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
            rm "C:\Windows\SystemTemp\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed the operating system's temporary files." -ForegroundColor Green

        Write-Host "Removing Prefetch files..." -ForegroundColor Cyan
            rm "$env:SystemRoot\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed Prefetch files." -ForegroundColor Green

        Write-Host "Clearing Recycle bin..." -ForegroundColor Cyan
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully cleared Recycle bin." -ForegroundColor Green

        Write-Host "Clearing DNS Cache..." -ForegroundColor Cyan
            ipconfig /flushdns
        Write-Host "Successfully cleared DNS Cache." -ForegroundColor Green

        Write-Host "Removing Windows Error Reporting files..." -ForegroundColor Cyan
            rm "C:\Windows\Minidump\*" -Recurse -Force -ErrorAction SilentlyContinue
            rm "$env:LOCALAPPDATA\CrashDumps\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed Windows Error Reporting files." -ForegroundColor Green

        Write-Host "Removing ActiveX temporary files, and Java Applet temporary files..." -ForegroundColor Cyan
            rm "C:\Windows\Downloaded Program Files\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed ActiveX temporary files, and Java Applet temporary files." -ForegroundColor Green

        $question1 = Read-Host "Would you like to delete the files in Offline Web Pages Folder? [y/N]"
            if ($question1 -match "y") {
                rm "C:\Windows\Offline Web Pages\*" -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "Successfully removed the files in the Offline Web Pages folder." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled removing the files in the Offline Web Pages folder." -ForegroundColor Yellow
            }

        $question2 = Read-Host "Would you like to delete the Windows LOG files? [y/N]"
            if ($question2 -match "y") {
                rm "C:\PerfLogs\*" -Recurse -Force -ErrorAction SilentlyContinue
                $pathWinLog = "C:\Windows\Logs"
                Get-ChildItem -Path $pathWinLog -Recurse -File | ForEach-Object {
                    Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
                }
                if (Test-Path "C:\inetpub\logs\LogFiles") {
                Get-ChildItem -Path "C:\inetpub\logs\LogFiles" -Recurse -File -ErrorAction SilentlyContinue |
                    Remove-Item -Force -ErrorAction SilentlyContinue
                }
                rm "C:\Windows\comsetup.log" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\DirectX.log" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\DPINST.LOG" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\DtcInstall.log" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\iis.log" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\PFRO.log" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\setupact.log" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\setuperr.log" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\WindowsUpdate.log" -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\Panther\*" -Recurse -Force -ErrorAction SilentlyContinue
                rm "C:\Windows\System32\LogFiles\*" -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "Successfully removed Windows LOG files." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled removing Windows LOG files." -ForegroundColor Yellow
            }

        $question3 = Read-Host "Would you like to delete your previous Windows install's junk files (Windows.old)? [y/N]"
            if ($question3 -match "y") {
                rm "C:\Windows.old" -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "Successfully removed your previous Windows install's junk files (Windows.old)." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled removing your previous Windows install's junk files (Windows.old)." -ForegroundColor Yellow
            }

        $question4 = Read-Host "Would you like to turn off hibernation? [y/N]"
            if ($question4 -match "y") {
                powercfg.exe -h off
                Write-Host "Successfully turned off hibernation." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled turning hibernation off." -ForegroundColor Yellow
            }
        $question5 = Read-Host "Would you like to remove NVIDIA cache files, and NVIDIA temporary files? [WARNING]: ONLY ANSWER Y/y TO THIS QUESTION, IF YOU HAVE AN NVIDIA GPU! (Some games may load a little bit slower.) (It will only delete files, that older than 15 days.) [y/N]" 
            if ($question6 -match "y") {
                if (Test-Path "C:\ProgramData\NVIDIA Corporation\NV_Cache") {
                    Get-ChildItem -Path "C:\ProgramData\NVIDIA Corporation\NV_Cache" -Recurse -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-15) } | Remove-Item -Force -ErrorAction SilentlyContinue
                }
                if (Test-Path "C:\ProgramData\NVIDIA Corporation\Downloader") {
                    Get-ChildItem -Path "C:\ProgramData\NVIDIA Corporation\Downloader" -Recurse -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-15) } | Remove-Item -Force -ErrorAction SilentlyContinue
                }
                if (Test-Path "C:\ProgramData\NVIDIA Corporation\NVBackend") {
                    Get-ChildItem -Path "C:\ProgramData\NVIDIA Corporation\NVBackend" -Recurse -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-15) } | Remove-Item -Force -ErrorAction SilentlyContinue
                }
                if (Test-Path "C:\ProgramData\NVIDIA Corporation\Logs") {
                    Get-ChildItem -Path "C:\ProgramData\NVIDIA Corporation\Logs" -Recurse -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-15) } | Remove-Item -Force -ErrorAction SilentlyContinue
                }
                Write-Host "Successfully removed NVIDIA cache files, and NVIDIA temporary files."
            }
        pause
    }