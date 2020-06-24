PowerShell
Get-ADComputer -Filter {(Enabled -eq $False)} 

•	get-service | where-object {$_.Name -like "*wl*"}
•	systeminfo | where-object {$_ -like "*Install Date*"} 
•	PowerShell -Command "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer
•	).Speak('Hello There');"
•	-Internet explorer manipulation
•	$ieObject = New-Object -ComObject 'InternetExplorer.Application'
•	$ieObject.Visible = $true
•	$ieObject.Navigate('http://itinv.dominionnet.com/itinv/asset_search_create.asp?txtURLTo=install_edit.asp&txtURLToAdd=install_create.asp&txtURLToAddCheck=create_check.asp')
•	Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\' | ForEach-Object {$_.GetValue('ProfileImagePath') }
•	Get-service -name audio* | format-list -property name, displayname, etc…
•	Get-service  -name WinRM | Format-List -Property * (helps get properties of interest)
•	Get-Service | Where-Object {$_.Status -eq "Running"}
•	Get-Service | Where-Object {$_.Status -eq "Stopped"}
•	Get-Service | Where-Object {$_.Status -eq "Stopped"} | Select-Object -First 5
•	Get-Service | Where-Object {$_.Status -eq "Stopped"} | Select-Object -Last 5
•	foreach ($file in (Get-Content -path C:\Users\moe0005\Desktop\test.txt)) {Test-Connection -computername $file -count 1 -quiet} 
•	$test1 | Out-File -filepath C:\users\moe0005\Desktop\test1.txt 
•	  Get-Content -Path C:\users\moe0005\Desktop\test1.txt | Add-Content -path C:\users\moe0005\Desktop\test.txt 
•	Get-ADComputer L5CG7212FK3 -Properties * | Select-Object LastlogonDate 
•	Get-ADUser -Identity vu00002 -Properties * | Select-Object -ExpandProperty StreetAddress 
•	  Get-ADUser -Filter {StreetAddress -like '*L5CG7212FK3*'} | Out-File  C:\Powershell\lastlogontest.txt 
•	Get-ADUser -Filter {StreetAddress -like '*L5CG7212FK3*'}  
$mic = get-pnpdevice | where {$_.friendlyname -like "Microphone*"} (Get-WmiObject -Class Win32_OperatingSystem).Win32Shutdown(0)
Rename-Item C:\Users\$username -newname $username.old
get-item get-item -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\$sid

$app = get-wmiobject -class win32_product | where-object Name -like "*kerberos*"
$app.uninstall()

