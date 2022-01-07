
$ServiceTags = Get-AzNetworkServiceTag -Location canadacentral
$ServiceTags.Values
($serviceTags.Values | Where-Object { $_.Name -eq "Storage.CanadaCentral" }).Properties.AddressPrefixes
($serviceTags.Values | Where-Object { $_.Name -eq "Storage.CanadaCentral" }).Properties.AddressPrefixes.count