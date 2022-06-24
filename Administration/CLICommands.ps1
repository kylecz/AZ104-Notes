
## Azure PowerShell module

#https://www.powershellgallery.com/packages/Az
Get-InstalledModule -Name Az
Connect-AzAccount
install-module az -Scope AllUsers -Force
install-module az.resourcegraph -Scope AllUsers -Force
install-module microsoft.graph -Scope AllUsers -Force
install-module azuread -Scope AllUsers -Force

Get-Module az -ListAvailable

Connect-AzAccount

Get-AzContext -ListAvailable
$contexts= get-azcontext -ListAvailable
$contexts[1] | rename-azcontext -TargetName "test"

Get-Command -Module Az.Compute
Get-Command -Module Az.Compute -Verb New
Get-Command -Module Az.Compute -Noun AzVM

Get-AzResourceGroup | ft
Get-Command -Module Az.Resources -Noun AzResourceGroup
New-AzResourceGroup -Name "JoseRG" -Location "canadacentral"

Get-AzVM
Get-AzVM -status | ft name, powerstate -AutoSize
Get-AzVM -status | where {$_.powerstate -ne "VM Running"}

New-AzVM -Name kylevm -Credential (Get-Credential) -Verbose -WhatIf
New-AzVM -Name kylevm -Credential (Get-Credential) -Image UbuntuLTS -Verbose -WhatIf








## Azure CLI

az login

az account list

az account set --s "Microsoft"
az account show

az account list-locations

az group create --location southcentralus --name testRG

az vm list-sizes --location eastus2
az vm list-sizes --location eastus2 --output table

az vm list -d --query "[?powerState=='VM running'].{Name:name, Region:location, ResourceGroup:resourceGroup, PowerState:powerState}" --output table

az vm create -n MyVm -g MyResourceGroup --image UbuntuLTS
