#===============================================================================
#Name: ExerciceAUDIT1dhcp.ps1
#Auteur: BALNY David
#Date: 22/02/2020
#
#Version 1.0
#Description: Audit des plages dhcp actives et inactives
#
#===============================================================================

Write-Host "Le fichier auditDHCP.txt est en création..."

$scopeDHCP = Get-DhcpServerv4Scope 
$date=Get-Date
        $date | Out-File C:\ResultatScript\auditDHCP.txt
        $scopeDHCP | Out-File C:\ResultatScript\auditDHCPtemp.txt
        $ligne = Get-Content -Path C:\ResultatScript\auditDHCPtemp.txt
        $scopeDHCP | Export-Csv C:\ResultatScript\auditDHCP.csv -Encoding Unicode
        Add-Content -Path C:\ResultatScript\auditDHCP.txt -Value $ligne
        

$MonFichier = Import-Csv C:\ResultatScript\auditDHCP.csv -Delimiter ","

foreach ($Ligne in $MonFichier)
{
    if ($Ligne.State -like "Active")
    {
    Write-Host $ligne.Name $Ligne.State 
    }
    else
    {
    Write-Host -foregroundcolor red $ligne.Name $Ligne.State
    }
}