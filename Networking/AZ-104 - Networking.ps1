
$ServiceTags = Get-AzNetworkServiceTag -Location canadacentral
$ServiceTags.Values
($serviceTags.Values | Where-Object { $_.Name -eq "Storage.CanadaCentral" }).Properties.AddressPrefixes
($serviceTags.Values | Where-Object { $_.Name -eq "Storage.CanadaCentral" }).Properties.AddressPrefixes.count

New-AzResourceGroup -Name "Kyle-RG-2" -Location "canadacentral"
New-AzStorageAccount -ResourceGroupName "Kyle-RG-2" -AccountName "kylestorageaccount1" -Location canadacentral -SkuName Standard_GRS
nslookup kylestorageaccount1.blob.core.windows.net


# public DNS zone
nslookup -type=SOA kylecz.com