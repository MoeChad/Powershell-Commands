
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

Get-WmiObject win32_pnpsigneddriver | where {$_.DeviceName -like "Nvidia Quadro P600" }

(Get-Command Get-VM).Parameters['Parameter'].ParameterType.FullName

(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseId

(Get-ADComputer $ComputerName -Properties IPv4Address).IPv4Address

Get-WmiObject win32_process -Filter 'name = "outlook.exe"' | Get-Member
Get-WmiObject win32_process -Filter 'name = "chrome.exe"' | ForEach-Object { $_.SetPriority(32)}
wmic process where name="mspaint.exe" CALL setpriority 32768

$numbers = get-content C:\users\moe0005\Desktop\numbers.txt

$Results = foreach ($number in $numbers) {
    if ($number -eq 6) {
        [PSCustomObject]@{
            Group1      = $number
            FD          = 'Y'
            }
        }
    else {
        [PSCustomObject]@{
            Group1      = $number
            FD          = 'N'

            }
        }
    }


$Results | Export-Csv -Path C:\Powershell\numbers.csv

get-childitem HKLM:\software\policies\microsoft\windows\deviceinstall -recurse | where-object { $_ -like "*DenyUnspecified*" }


#how to run function remotely with PsExec

Create PS-Drive
Copy Item to C:\
then PS-exec
move to directory where ps1 file is
dot source it in  . .\file.ps1
then run function with parmaters

(get-aduser eID -Properties).memberof

$results = get-aduser -Filter { Manager -eq "CN=username,OU=Users,OU=Common,DC=mbu,DC=ad,DC=ADname,DC=com" } 
$results | Select-Object -ExpandProperty UserPrincipalName


#Loop used to pull Active Directory data for a list of users ($users)
$results = foreach ($user in $userlist) {
    $Company          = Get-aduser $user -Properties * | Select-Object -ExpandProperty Company
    $Department       = Get-aduser $user -Properties * | Select-Object -ExpandProperty Department
    $OfficeLocation   = Get-ADUser $user -Properties * | Select-Object -ExpandProperty physicalDeliveryOfficeName
    $CoC              = Get-ADUser $user -Properties * | Select-Object -ExpandProperty PostalCode
    $co               = Get-aduser $user -Properties * | Select-Object -ExpandProperty co
    $FirstName        = Get-aduser $user -Properties * | Select-Object -ExpandProperty GivenName
    $LastName         = Get-aduser $user -Properties * | Select-Object -ExpandProperty SurName

    
#custom object that's exported into CSV
    [PSCustomObject]@{
        eID           = $user
        FirstName     = $FirstName
        LastName      = $LastName
        Company       = $Company
        Department    = $Department
        OfficeLoc     = $OfficeLocation
        CoC           = $CoC
        co            = $co
        }
    }


$results = foreach ($user in $users) {
    #Pulls all emails from ProxyAddresses attribute that have the '@domain.com' string
    $emailaddress = Get-aduser $user -Properties * | Select-Object -ExpandProperty proxyaddresses | select-string -Pattern '@domain.com'
    [PSCustomObject]@{
        eID      = $user
        #formats string and removes unwanted text
        Email    = $emailaddress -join "`n" -replace 'smtp:' 
        }
    }
