#===============================================================================
#Name: ExerciceAUDIT.ps1
#Auteur: BALNY David
#Date: 22/02/2020
#
#Version 1.0
#Description: Interface graphique pour API d'audit des services DHCP, DNS et AD
#
#===============================================================================


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# Création de l'objet pour la forme globale de l'interface
$Form = New-Object System.Windows.Forms.Form
$Form.ClientSize = '500,500'
$Form.Text = "Mon UI en PS ep. II"
$Form.FormBorderStyle = 'Fixed3D'
$Form.MaximizeBox = $false

# Création de l'objet pour le menu global de l'interface
$Menu = New-Object System.Windows.Forms.MenuStrip
$Menu.Location = New-Object System.Drawing.Point(0,0)

# Création des objets pour l'ensemble des sous-menus
$MenuFile = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuFile.Text = "&Fichier"
$MenuAudit = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuAudit.Text = "&Menu audit"

$MenuAuditTousLesServices = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuAuditTousLesServices.Text = "&Services DHCP DNS et AD"
$MenuAuditTousLesServices.ToolTipText = "Vérification de l'activité des services"
$MenuAudit.DropDownItems.Add($MenuAuditTousLesServices)

$MenuAuditDHCP = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuAuditDHCP.Text = "&Plages DHCP actives et inactives"
$MenuAuditDHCP.ToolTipText = "Vérification de l'activité des plages DHCP"
$MenuAudit.DropDownItems.Add($MenuAuditDHCP)

$MenuAuditDNS = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuAuditDNS.Text = "&Enregistrements directs DNS sur la zone Cyres.lan"
$MenuAuditDNS.ToolTipText = "Vérification des enregistrements directs sur la zone Cyres.lan"
$MenuAudit.DropDownItems.Add($MenuAuditDNS)

$MenuAuditAD = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuAuditAD.Text = "&Liste des utilisateurs de l'AD"
$MenuAuditAD.ToolTipText = "Vérification des utilisateurs de l'AD"
$MenuAudit.DropDownItems.Add($MenuAuditAD)

$MenuAbout = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuAbout.Text = "&A propos"
$MenuFileQuit = New-Object System.Windows.Forms.ToolStripMenuItem
$MenuFileQuit.Text = "&Quitter"
$MenuFileQuit.ToolTipText = "Infobulle d'aide"
$MenuFile.DropDownItems.Add($MenuFileQuit)

$Menu.Items.AddRange(@($MenuFile,$MenuAudit,$MenuAbout))

$Form.controls.Add($Menu)

# Création des objets "Label" pour l'ensemble des sous-menus
$LabelLogServices = New-Object System.Windows.Forms.Label
$LabelLogServices.Location = New-Object System.Drawing.Point(40,70)
$LabelLogServices.AutoSize = $true

$LabelDHCP = New-Object System.Windows.Forms.Label
$LabelDHCP.Location = New-Object System.Drawing.Point(300,70)
$LabelDHCP.AutoSize = $true

$LabelLogDNS = New-Object System.Windows.Forms.Label
$LabelLogDNS.Location = New-Object System.Drawing.Point(40,300)
$LabelLogDNS.AutoSize = $true

$LabelLogAD = New-Object System.Windows.Forms.Label
$LabelLogAD.Location = New-Object System.Drawing.Point(300,300)
$LabelLogAD.AutoSize = $true

# Création des objets "Bouton" pour l'ensemble des sous-menus
$BoutonGetServices = New-Object System.Windows.Forms.Button
$BoutonGetServices.Location = New-Object System.Drawing.Point(40,150)
$BoutonGetServices.Width = 125
$BoutonGetServices.Text = "Cliquez moi !"

$BoutonGetDHCP = New-Object System.Windows.Forms.Button
$BoutonGetDHCP.Location = New-Object System.Drawing.Point(280,150)
$BoutonGetDHCP.Width = 125
$BoutonGetDHCP.Text = "Cliquez moi !"

$BoutonGetDNS = New-Object System.Windows.Forms.Button
$BoutonGetDNS.Location = New-Object System.Drawing.Point(40,380)
$BoutonGetDNS.Width = 125
$BoutonGetDNS.Text = "Cliquez moi !"

$BoutonGetAD = New-Object System.Windows.Forms.Button
$BoutonGetAD.Location = New-Object System.Drawing.Point(280,380)
$BoutonGetAD.Width = 125
$BoutonGetAD.Text = "Cliquez moi !"

$Form.controls.AddRange(@($LabelLogServices,$LabelDHCP,$LabelLogDNS,$LabelLogAD))
$Form.controls.AddRange(@($BoutonGetDHCP,$BoutonGetServices,$BoutonGetDNS,$BoutonGetAD))

# Création des objets "Box" pour l'ensemble des sous-menus
$GroupBoxServices = New-Object System.Windows.Forms.GroupBox
$GroupBoxServices.Location = New-Object System.Drawing.Point(20,50)
$GroupBoxServices.Width = 180
$GroupBoxServices.Height = 220
$GroupBoxServices.Text = "Audit Services"

$GroupBoxDHCP = New-Object System.Windows.Forms.GroupBox
$GroupBoxDHCP.Location = New-Object System.Drawing.Point(250,50)
$GroupBoxDHCP.Width = 180
$GroupBoxDHCP.Height = 220
$GroupBoxDHCP.Text = "Audit DHCP"

$GroupBoxDNS = New-Object System.Windows.Forms.GroupBox
$GroupBoxDNS.Location = New-Object System.Drawing.Point(20,280)
$GroupBoxDNS.Width = 180
$GroupBoxDNS.Height = 220
$GroupBoxDNS.Text = "Audit DNS"

$GroupBoxAD = New-Object System.Windows.Forms.GroupBox
$GroupBoxAD.Location = New-Object System.Drawing.Point(250,280)
$GroupBoxAD.Width = 180
$GroupBoxAD.Height = 220
$GroupBoxAD.Text = "Audit AD"

$BoutonGaucheTooltip = New-Object System.Windows.Forms.ToolTip
$BoutonDroitTooltip = New-Object System.Windows.Forms.ToolTip

$BoutonGaucheTooltip.SetTooltip($BoutonGetServices,"Ce bouton permettait d'afficher le nom de l'utilisateur.")
$BoutonDroitTooltip.SetTooltip($BoutonGetDHCP,"Ce bouton permettait d'afficher le nom de la machine.")

$Form.controls.AddRange(@($GroupBoxServices,$GroupBoxDHCP,$GroupBoxDNS,$GroupBoxAD))

# Création des actions sur les "Boutons" et les "Menus" 
$BoutonGetServices.Add_Click({
C:\Scripts_Powershell\ExerciceAUDIT1services.ps1
})

$BoutonGetDHCP.Add_Click({
C:\Scripts_Powershell\ExerciceAUDIT2dhcp.ps1
})

$BoutonGetDNS.Add_Click({
C:\Scripts_Powershell\ExerciceAUDIT3dns.ps1
})

$BoutonGetAD.Add_Click({
C:\Scripts_Powershell\ExerciceAUDIT4ad.ps1
})

$MenuFileQuit.Add_Click({
$Form.Close()
})

$MenuAuditTousLesServices.Add_Click({
C:\Scripts_Powershell\ExerciceAUDIT1services.ps1
})

$MenuAuditDHCP.Add_Click({
C:\Scripts_Powershell\ExerciceAUDIT2dhcp.ps1
})

$MenuAuditDNS.Add_Click({
C:\Scripts_Powershell\ExerciceAUDIT3dns.ps1
})

$MenuAuditAD.Add_Click({
C:\Scripts_Powershell\ExerciceAUDIT4ad.ps1
})

$Form.ShowDialog()