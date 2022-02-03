
$ServiceTags = Get-AzNetworkServiceTag -Location canadacentral
$ServiceTags.Values
($serviceTags.Values | Where-Object { $_.Name -eq "Storage.CanadaCentral" }).Properties.AddressPrefixes
($serviceTags.Values | Where-Object { $_.Name -eq "Storage.CanadaCentral" }).Properties.AddressPrefixes.count

New-AzResourceGroup -Name "Kyle-RG-05" -Location "canadacentral"
New-AzStorageAccount -ResourceGroupName "Kyle-RG-05" -AccountName "kylestorageaccount01" -Location canadacentral -SkuName Standard_GRS
nslookup kylestorageaccount03.blob.core.windows.net


# public DNS zone
nslookup -type=SOA kylecz.com