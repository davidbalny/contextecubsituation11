﻿#===============================================================================
#Name: ExerciceAUDIT3ad.ps1
#Auteur: BALNY David
#Date: 22/02/2020
#
#Version 1.0
#Description: Audit des comptes utilisateurs AD
#
#===============================================================================

Write-Host "Le fichier auditAD.txt est en création..."

$ADuser = Get-ADUser -Filter *
$ADuser | Export-Csv C:\git_cub\contextecubsituation11\auditAD.csv -Encoding Unicode
$ADuser | Out-File C:\git_cub\contextecubsituation11\auditAD.txt

