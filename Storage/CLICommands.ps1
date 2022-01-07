
New-AzResourceGroup -Name "Kyle-RG-02" -Location "canadacentral"

New-AzStorageAccount -ResourceGroupName "Kyle-RG-02" -AccountName "kylestorageaccount01" -Location canadacentral -SkuName Standard_GRS

nslookup kylestorageaccount01.blob.core.windows.net
