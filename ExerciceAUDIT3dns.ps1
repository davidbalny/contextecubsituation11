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

$scopeDHCP = Get-DnsServerResourceRecord -ZoneName cyres.lan 
$date=Get-Date
        $date | Out-File C:\ResultatScript\auditDNS.txt
        $scopeDHCP | Out-File C:\ResultatScript\auditDNStemp.txt
        $ligne = Get-Content -Path C:\ResultatScript\auditDNStemp.txt
        $scopeDHCP | Export-Csv C:\ResultatScript\auditDNS.csv -Encoding Unicode
        Add-Content -Path C:\ResultatScript\auditDNS.txt -Value $ligne
        

$MonFichier = Import-Csv C:\ResultatScript\auditDNS.csv -Delimiter ","

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