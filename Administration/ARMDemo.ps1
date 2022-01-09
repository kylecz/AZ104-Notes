
# Github.com/Azure/azure-quickstart-templates

$GitBasePath = 'C:\Users\Kyle\OneDrive - Microsoft\Role\FY22 - ATT\AZ-104\Notes\AZ104-Notes\Administration'

New-AzResourceGroup -Name "Kyle-RG-01" -Location "canadacentral"

New-AzResourceGroupDeployment -ResourceGroupName Kyle-RG-01 `
    -TemplateFile "$GitBasePath\\StorageAccount.json" `
    -TemplateParameterFile "$GitBasePath\\StorageAccount.parameters.json"

#Run same template again but override the type of the storage account
New-AzResourceGroupDeployment -ResourceGroupName Kyle-RG-01 `
-TemplateFile "$GitBasePath\\StorageAccount.json" `
-TemplateParameterFile "$GitBasePath\\StorageAccount.parameters.json" `
-StorageAccountType 'Standard_GRS'



















#Create a virtual network
#No parameter file. Terrible but not the focus here :-)
New-AzResourceGroupDeployment -ResourceGroupName RG2 `
    -TemplateFile "$GitBasePath\\VirtualNetwork1Subnet.json"

#Run the 2 subnet version
#Forcing complete mode (instead of default incremental). Watch the storage account!
New-AzResourceGroupDeployment -ResourceGroupName RG2 `
    -TemplateFile "$GitBasePath\\VirtualNetwork2Subnets.json" `

#Deploy a nested template. Note the variables and parameters come from the main template and not from the nested area
#Deploy simple template creating a storage account
New-AzResourceGroupDeployment -ResourceGroupName RG2 `
    -TemplateFile "$GitBasePath\StorageAccountNested.json"

#Deploy a linked template that is stored in blob (via a SAS since no public anonymous)
New-AzResourceGroupDeployment -ResourceGroupName RG2 `
    -TemplateFile "$GitBasePath\StorageAccountLinked.json" `
    -StorageAccountType 'Standard_LRS'

#Looking at a secret
New-AzResourceGroupDeployment -ResourceGroupName RG2 `
    -TemplateFile "$GitBasePath\\keyvaulttest.json" `
    -TemplateParameterFile "$GitBasePath\\keyvaulttest.parameters.json"

#Create a full VM
#In here we have dependson but use only when required
New-AzResourceGroupDeployment -ResourceGroupName RG2 `
    -TemplateFile "$GitBasePath\\SimpleWindowsVM.json" `
    -TemplateParameterFile "$GitBasePath\\SimpleWindowsVM.parameters.json"
