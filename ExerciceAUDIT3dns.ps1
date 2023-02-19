#===============================================================================
#Name: ExerciceAUDIT1dns.ps1
#Auteur: BALNY David
#Date: 22/02/2020
#
#Version 1.0
#Description: Audit des enregistrements directs DNS de type A
#
#===============================================================================

Write-Host "Le fichier auditDNS.txt est en création..."

$scopeDHCP = Get-DnsServerResourceRecord -ZoneName local.hongkong.cub.sioplc.fr 
$date=Get-Date
        $date | Out-File C:\git_cub\contextecubsituation11\auditDNS.txt
        $scopeDHCP | Out-File C:\git_cub\contextecubsituation11\auditDNStemp.txt
        $ligne = Get-Content -Path C:\git_cub\contextecubsituation11\auditDNStemp.txt
        $scopeDHCP | Export-Csv C:\git_cub\contextecubsituation11\auditDNS.csv -Encoding Unicode
        Add-Content -Path C:\git_cub\contextecubsituation11\auditDNS.txt -Value $ligne
        

$MonFichier = Import-Csv C:\git_cub\contextecubsituation11\auditDNS.csv -Delimiter ","

foreach ($Ligne in $MonFichier)
{
    if ($Ligne.RecordType -like "A")
    {
   # Write-Host $ligne.HostName $Ligne.RecordType  $ligne.TimeToLive 
    nslookup $ligne.HostName 
    }
    else
    {
    
    }
}