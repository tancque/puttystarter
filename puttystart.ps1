# powershell script that changes for- and backgroundcolour
# for every new session
# default forground colour0
# default background colour2
# 

# get random rgb values
$foreground1 = Get-Random -Maximum 254
$foreground2 = Get-Random -Maximum 254
$foreground3 = Get-Random -Maximum 254


# set foreground colour
Set-ItemProperty -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions\Default%20Settings\" -Name "Colour0" -Value "$foreground1, $foreground2, $foreground3"

#define background colour
#usually a contrast of +128 coloursteps will be good enough
if ($foreground1+128 -gt 254) {$background1=$foreground1-128} else {$background1=$foreground1+128}
if ($foreground2+128 -gt 254) {$background2=$foreground1-128} else {$background2=$foreground2+128}
if ($foreground3+128 -gt 254) {$background3=$foreground1-128} else {$background3=$foreground3+128}

# set background colour
Set-ItemProperty -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions\Default%20Settings\" -Name "Colour2" -Value "$background1, $background2, $background3"

# start putty

& "C:\Program Files\PuTTY\putty.exe" 
