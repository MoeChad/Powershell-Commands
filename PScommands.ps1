
Get-ADComputer -Filter {(Enabled -eq $False)} 

get-service | where-object {$_.Name -like "*wl*"}

systeminfo | where-object {$_ -like "*Install Date*"}

PowerShell -Command "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak('Hello There');"

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\' | ForEach-Object {$_.GetValue('ProfileImagePath')}

Get-service -name audio* | format-list -property name, displayname,

Get-service  -name WinRM | Format-List -Property *

Get-Service | Where-Object {$_.Status -eq "Running"}
Get-Service | Where-Object {$_.Status -eq "Stopped"}
Get-Service | Where-Object {$_.Status -eq "Stopped"} | Select-Object -First 5
Get-Service | Where-Object {$_.Status -eq "Stopped"} | Select-Object -Last 5

foreach ($file in (Get-Content -path C:\Users\$username\Desktop\test.txt)) {Test-Connection -computername $file -count 1 -quiet} 

Get-Content -Path C:\users\$username\Desktop\test1.txt | Add-Content -path C:\users\$username\Desktop\test.txt 
Get-ADComputer $machine -Properties * | Select-Object LastlogonDate 

Get-ADUser -Identity $username -Properties * | Select-Object -ExpandProperty StreetAddress 

$mic = get-pnpdevice | where {$_.friendlyname -like "Microphone*"} (Get-WmiObject -Class Win32_OperatingSystem).Win32Shutdown(0)

Rename-Item C:\Users\$username -newname $username.old
get-item get-item -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\$sid

$app = get-wmiobject -class win32_product | where-object Name -like "*kerberos*"
$app.uninstall()

