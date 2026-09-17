# Delete-temporary-files
This is a Powershell script that deletes temporary files, and LOG files from Windows.

## How to use? 
### With PowerShell 7
Start PowerShell 7 **as administrator**, and type this, to change the Execution Policy to Bypass for the Current Session:
```sh
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```
Then, navigate to that directory, where you downloaded my script. E.g of you downloaded it to your Downloads folder, then type this:
```sh
cd $env:"USERPROFILE"\Downloads
```
Then, answer the questions, and you're done.

### With Windows PowerShell
#### Option 1
Make sure, that your Execution Policy is set to **Bypass**, or **Unrestricted**. Then, right-click on the script, that you downloaded, and select ***Run with PowerShell***. If you have administrator priviliges, then answer *y* to that question, that asks you for administrator priviliges. Then answer the questions, and you're done.

#### Option 2
Start Windows PowerShell **as administrator**, and type this, to change the Execution Policy to Bypass for the Current Session:
```sh
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```
Then, navigate to that directory, where you downloaded my script. E.g of you downloaded it to your Downloads folder, then type this:
```sh
cd $env:"USERPROFILE"\Downloads
```
Then, answer the questions, and you're done.

## What does this script deletes?
- The Current User's temporary files. ($env:"USERPROFILE"\AppData\Local\Temp)
- The DefaultUser's temporary files. (C:\Users\Default\AppData\Local\Temp)
- The Operating system's global temporary files. (C:\Windows\Temp) (C:\Windows\SystemTemp)
- Prefetch (SysMain/SuperFetch) files. (C:\Windowws\Prefetch)
- Recycle bin (C:\$Recycle.bin)
- DNS Cache (ipconfig /flushdns)
- Windows Update junk files (C:\Windows\SoftwareDistribution\Download) [```NoWinUpdateTempDeletion_DeleteTemporaryFiles5_0.ps1``` doesn't remove this]
- Delivery Optimization cache (C:\Windows\DeliveryOptimization\Cache)
- Windows Error Reporting files (C:\Windows\Minidump) ($env:"USERPROFILE"\AppData\Local\CrashDumps)
- Old, not used components from WinSxS (DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase)
- ActiveX temporary files, and Java Applet temporary files (C:\Windows\Downloaded Program Files)
- [Optional] Offile Web Pages (C:\Windows\Offline Web Pages)
- [Optional] LOG files (C:\PerfLogs) (C:\Windows\Logs) (C:\inetpub\logs\LogFiles) (C:\Windows\comsetup.log) (C:\Windows\DirectX.log) (C:\Windows\DPINST.LOG) (C:\Windows\DtcInstall.log) (C:\Windows\iis.log) (C:\Windows\PFRO.log") (C:\Windows\setupact.log) (C:\Windows\setuperr.log) (C:\Windows\WindowsUpdate.log) (C:\Windows\Panther) (C:\Windows\System32\LogFiles)
- Your old Windows installation's junk files (C:\Windows.old)
- Hibernation (powercfg.exe -h off)
