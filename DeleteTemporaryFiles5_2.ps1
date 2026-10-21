Write-Host "Welcome in Delete-Temporary-Files!" -ForegroundColor Blue
Write-Host ""

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
        Start-Process powershell -Verb RunAs -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`""
        exit
    }
}



$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if ($isAdmin) {

        Write-Host "Removing the user's temporary files..." -ForegroundColor Cyan
        	rm "C:\Users\Default\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        	rm "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
		rm "C:\Users\DefaultAppPool\AppData\Local\Temp" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed the user's temporary files." -ForegroundColor Green

        Write-Host "Removing the operating system's temporary files..." -ForegroundColor Cyan
        	rm "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        	rm "C:\Windows\SystemTemp\*" -Recurse -Force -ErrorAction SilentlyContinue
		rm "C:\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
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
	
	Write-Host "Removing IIS temporary files..." -ForegroundColor Cyan
		rm "C:\inetpub\temp\appPools\*" -Recurse -Force -ErrorAction SilentlyContinue
	Write-Host "Successfully removed IIS temporary files."

        Write-Host "Removing Delivery Optimization files..." -ForegroundColor Cyan
        	rm "C:\Windows\DeliveryOptimization\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed Delivery Optimization files." -ForegroundColor Green

        Write-Host "Removing Windows Error Reporting files..." -ForegroundColor Cyan
        	rm "C:\Windows\Minidump\*" -Recurse -Force -ErrorAction SilentlyContinue
        	rm "$env:LOCALAPPDATA\CrashDumps\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed Windows Error Reporting files." -ForegroundColor Green

        Write-Host "Removing ActiveX temporary files, and Java Applet temporary files..." -ForegroundColor Cyan
        	rm "C:\Windows\Downloaded Program Files\*" -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Successfully removed ActiveX temporary files, and Java Applet temporary files." -ForegroundColor Green

        $question1 = Read-Host "Would you like to delete Windows Update temporary files (Not recommended if an update is downloading or installing.) [y/N]"
            if ($question1 -match "y") {
                Write-Host "Removing Windows Update temporary files..." -ForegroundColor Cyan
                rm "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "Successfully removed Windows Update temporary files." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled removing the Windows Update Temporary Files." -ForegroundColor Yellow
            }

        $question2 = Read-Host "Would you like to delete the files in Offline Web Pages Folder? [y/N]"
            if ($question2 -match "y") {
                Write-Host "Removing all files in the Offline Web Pages folder..." -ForegroundColor Cyan
                	rm "C:\Windows\Offline Web Pages\*" -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "Successfully removed the files in the Offline Web Pages folder." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled removing the files in the Offline Web Pages folder." -ForegroundColor Yellow
            }

        $question3 = Read-Host "Would you like to delete the Windows LOG files? [y/N]"
            if ($question3 -match "y") {
                
		Write-Host "Removing Performance Logs..." -ForegroundColor Cyan
                	rm "C:\PerfLogs\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed Performance Logs" -ForegroundColor Green
		
		Write-Host "Removing IIS logs..." -ForegroundColor Cyan
			rm C:\inetpub\logs\* -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed IIS logs." -ForegroundColor Green

		Write-Host "Removing Windows System LOGs..." -ForegroundColor Cyan
                	$pathWinLog = "C:\Windows\Logs"
                	Get-ChildItem -Path $pathWinLog -Recurse -File | ForEach-Object {
                		Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
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
			rm "C:\DumpStack.log" -Force -ErrorAction SilentlyContinue
			rm "C:\wacom\*" -Recurse -Force -ErrorAction SilentlyContinue
			rm "C:\Windows\System32\Sysprep\Panther\*.log" -Recurse -Force -ErrorAction SilentlyContinue
			rm "C:\Windows\System32\HPCDLOG.LOG" -Force -ErrorAction SilentlyContinue
			rm "C:\Windows\System32\NetSetupMig.log" -Force -ErrorAction SilentlyContinue
			rm "C:\Windows\Panther\UnattendGC\*.log" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed Windows LOG files." -ForegroundColor Green
            	
		Write-Host "Removing Chocolatey LOG files... (The script will skip this, if you don't have Chocolatey installed.)" -ForegroundColor Cyan
			rm "C:\ProgramData\chocolatey\logs\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed Chocolatey LOG files." -ForegroundColor Green
		
		Write-Host "Removing Claude LOG files (The script will skip this, if you don't have Claude Desktop installed on your PC.)" -ForegroundColor Cyan
			rm "C:\ProgramData\Claude\Logs\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed Claude LOG files." -ForegroundColor Green

		Write-Host "Removing HP LOG files... (The script will skip this, if your PC isn't from HP.)" -ForegroundColor Cyan
			rm "C:\ProgramData\Bromium\*" -Recurse -Force -ErrorAction SilentlyContinue
			rm "C:\ProgramData\Hewlett-Packard\HP Support Framework\Resources\Temp\Debug.log" -Force -ErrorAction SilentlyContinue

			$pathHPstreamLOG = "C:\ProgramData\Hewlett-Packard\StreamLog"
			Get-ChildItem -Path $pathHPstreamLOG\* -ErrorAction SilentlyContinue | ForEach-Object {
                    		Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
			}
# a random comment
			$pathHPstreamLOG2 = "C:\ProgramData\HP\StreamLog"
			Get-ChildItem -Path $pathHPstreamLOG2\* -ErrorAction SilentlyContinue | ForEach-Object {
				Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
			}
			rm "C:\ProgramData\HP\ExternalApps\Diagnostics\Logs\*" -Recurse -Force -ErrorAction SilentlyContinue
			rm "C:\ProgramData\HP\ExternalApps\TelemetryDataCollector\*" -Recurse -Force -ErrorAction SilentlyContinue
			rm "C:\ProgramData\HP\smartatr.log" -Force -ErrorAction SilentlyContinue
			rm "C:\Program Files (x86)\HP\HP ICS\log\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed HP LOG files." -ForegroundColor Green

	    	Write-Host "Removing Intel Graphics Software LOGs... (If you don't have this software, the script will skip this.)" -ForegroundColor Cyan
			rm "C:\ProgramData\Intel\GCC\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed Intel Graphics Software LOGs." -ForegroundColor Green
		
		Write-Host "Removing Microsoft Edge LOG files..." -ForegroundColor Cyan
			rm "C:\ProgramData\Microsoft\EdgeUpdate\Log\*.log" -Recurse -Force -ErrorAction SilentlyContinue
			rm "C:\Program Files (x86)\Microsoft\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed Microsoft Edge LOG files." -ForegroundColor Green
		
		Write-Host "Removing Mozilla Maintence service LOGs... (If you don't have this software, the script will skip this.)" -ForegroundColor Cyan
			rm "C:\Program Files (x86)\Mozilla Maintenance Service\logs\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed Mozilla Maintence service LOGs." -ForegroundColor Green
			
		Write-Host "Removing Razer Chorma LOG files... (If you don't have Razer Chroma installed on your PC, it will skip this.)" -ForegroundColor Green
			rm "C:\Program Files (x86)\Razer Chroma SDK\logs\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Successfully removed Razer Chorma LOG files." -ForegroundColor Green

		Write-Host "Successfully removed LOG files." -ForegroundColor Green
	    }
            else {
                Write-Host "You cancelled removing LOG files." -ForegroundColor Yellow
            }

        $question4 = Read-Host "Would you like to delete your previous Windows install's junk files (Windows.old)? [y/N]"
            if ($question4 -match "y") {
		Write-Host "Removing Windows.old..." -ForegroundColor Cyan
                	rm "C:\Windows.old" -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "Successfully removed your previous Windows install's junk files (Windows.old)." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled removing your previous Windows install's junk files (Windows.old)." -ForegroundColor Yellow
            }

        $question5 = Read-Host "Would you like to turn off hibernation? [y/N]"
            if ($question5 -match "y") {
		Write-Host "Turning off hibernation..." -ForegroundColor Cyan
                	powercfg.exe -h off
                Write-Host "Successfully turned off hibernation." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled turning hibernation off." -ForegroundColor Yellow
            }
        $question6 = Read-Host "Would you like to remove, all, old, not used Windows Update components, from WinSxS? (USE AT YOUR OWN RISK!) [y/N]"
            if ($question6 -match "y") {
		Write-Host "Starting Cleanup..." -ForegroundColor Cyan
                	dism /Online /Cleanup-Image /StartComponentCleanup /ResetBase
                Write-Host "Successfully removed all, old, not used Windows Update components, from WinSxS." -ForegroundColor Green
            }
            else {
                Write-Host "You cancelled removing all, old, not used Windows components, from WinSxS." -ForegroundColor Yellow
            }
        $question7 = Read-Host "Would you like to remove NVIDIA cache files, and NVIDIA temporary files? [WARNING]: ONLY ANSWER Y/y TO THIS QUESTION, IF YOU HAVE AN NVIDIA GPU! (Some games may load a little bit slower.) (It will only delete files, that older than 15 days.) [y/N]" 
            if ($question7 -match "y") {
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
