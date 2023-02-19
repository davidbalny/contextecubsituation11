#===============================================================================
#Name: ExerciceAUDIT3services.ps1
#Auteur: BALNY David
#Date: 22/02/2020
#
#Version 1.0
#Description: Audit des services démarrés
#
#===============================================================================

Write-Host "Le fichier auditServices.txt est en création..."


$services = Get-Service | Where-Object {$_.name -like "Dhcp" } 
        $date=Get-Date
        $date | Out-File C:\ResultatScript\auditServices.txt
        $services | Out-File C:\ResultatScript\auditServicestemp.txt
        $ligne = Get-Content -Path C:\ResultatScript\auditServicestemp.txt
        Add-Content -Path C:\ResultatScript\auditServices.txt -Value $ligne
$services = Get-Service | Where-Object {$_.name -like "DNS"}
        $services | Out-File C:\ResultatScript\auditServicestemp.txt
        $ligne = Get-Content -Path C:\ResultatScript\auditServicestemp.txt
        Add-Content -Path C:\ResultatScript\auditServices.txt -Value $ligne
$services = Get-Service | Where-Object {$_.name -like "NTDS"}
        $services | Out-File C:\ResultatScript\auditServicestemp.txt
        $ligne = Get-Content -Path C:\ResultatScript\auditServicestemp.txt
        Add-Content -Path C:\ResultatScript\auditServices.txt -Value $ligne

