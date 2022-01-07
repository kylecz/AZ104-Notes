
#PowerShell Examples
install-module az -Scope AllUsers -Force
install-module az.resourcegraph -Scope AllUsers -Force
install-module microsoft.graph -Scope AllUsers -Force
install-module azuread -Scope AllUsers -Force

#Check version
Get-Module az -ListAvailable

Connect-AzAccount #login and will get refresh token persist between sessions

get-azcontext -ListAvailable
$contexts= get-azcontext -ListAvailable
$contexts[1] | rename-azcontext -TargetName "test"

Select-AzContext "Microsoft"

Get-AzContextAutosaveSetting

Get-Command -Module Az.Compute
Get-Command -Module Az.Compute -Verb New
Get-Command -Module Az.Compute -Noun AzVM

Get-AzResourceGroup

Get-AzVM
Get-AzVM -status | ft name, powerstate -AutoSize
Get-AzVM -status | where {$_.powerstate -ne "VM Running"}

#Look at secrets
(Get-AzKeyVaultSecret –VaultName 'az104testakv' `
    -Name TestSecret).SecretValueText

#Look at all extension images
Get-AzVmImagePublisher -Location "southcentralus" | Get-AzVMExtensionImageType | Get-AzVMExtensionImage | Select Type, Version

#View Windows Server images
$loc = 'SouthCentralUS'
#View the templates available
Get-AzVMImagePublisher -Location $loc
Get-AzVMImageOffer -Location $loc -PublisherName "MicrosoftWindowsServer"
Get-AzVMImageSku -Location $loc -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer"
Get-AzVMImage -Location $loc -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2019-Datacenter-Core"
#can use -latest when actually using

#View Ubuntu
#View the templates available
Get-AzVMImagePublisher -Location $loc
Get-AzVMImageOffer -Location $loc -PublisherName "Canonical"
Get-AzVMImageSku -Location $loc -PublisherName "Canonical" -Offer "UbuntuServer"
Get-AzVMImage -Location $loc -PublisherName "Canonical" -Offer "UbuntuServer" -Skus "19.04"
Get-AzVMImage -Location $loc -PublisherName "Canonical" -Offer "UbuntuServer" -Skus "19.04" -Version 19.04.201908140

#Create an RG
New-AzResourceGroup -Name "TestRG" -Location "southcentralus"

#Create easy VM
New-AzVM -Name johnvm -Credential (Get-Credential) -Verbose -WhatIf

New-AzVM -Name johnvm -Credential (Get-Credential) -Image UbuntuLTS -Verbose -WhatIf

#Deploy an ARM template
New-AzResourceGroupDeployment -ResourceGroupName RG-IaCSamp42 `
    -TemplateFile "StorageAccount.json" `
    -TemplateParameterFile "StorageAccount.parameters.json"


#CLI Use
az login

az account list

#To switch I would use (note this automatically uses the profile for the selected subscription including the credential)
az account set --s "subscription name"
#To see the current profile, I can use
az account show

#To view the available regions I would use the following:
az account list-locations

#Create an RG
az group create --location southcentralus --name testRG

#To view the VM sizes available in a region (note the 2 dashes before location)
az vm list-sizes --location eastus2
az vm list-sizes --location eastus2 --output table

az vm list -d --query "[?powerState=='VM running'].{Name:name, Region:location, ResourceGroup:resourceGroup, PowerState:powerState}" --output table

#To quickly create a VM with many default values
az vm create -n MyVm -g MyResourceGroup --image UbuntuLTS

#Deploy an ARM template (@ for parameter means local file)
az group deployment create --resource-group "RG5" --template-file "StorageAccount.json" --parameters "@StorageAccount.parameters.json"