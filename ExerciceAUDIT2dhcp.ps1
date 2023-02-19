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
        $date | Out-File C:\git_cub\contextecubsituation11\auditDHCP.txt
        $scopeDHCP | Out-File C:\git_cub\contextecubsituation11\auditDHCPtemp.txt
        $ligne = Get-Content -Path C:\git_cub\contextecubsituation11\auditDHCPtemp.txt
        $scopeDHCP | Export-Csv C:\git_cub\contextecubsituation11\auditDHCP.csv -Encoding Unicode
        Add-Content -Path C:\git_cub\contextecubsituation11\auditDHCP.txt -Value $ligne
        

$MonFichier = Import-Csv C:\git_cub\contextecubsituation11\auditDHCP.csv -Delimiter ","

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