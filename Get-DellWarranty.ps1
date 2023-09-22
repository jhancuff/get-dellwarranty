param (
    [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [string]$ServiceTag,

    [string]$ApiKey = "YourAPIKeyHere",

    [string]$ServiceTagFile
)

process {
    # Function to get warranty info
    function Get-WarrantyInfo {
        param (
            [string]$tag,
            [string]$key
        )
        $apiUrl = "https://api.dell.com/support/assetinfo/v4/getassetwarranty/$tag?apikey=$key"
        $response = Invoke-RestMethod -Uri $apiUrl -Method Get
        $warrantyDetails = $response.AssetWarrantyResponse.AssetEntitlementData | Select-Object -Property "ServiceLevelDescription", "StartDate", "EndDate"
        $warrantyDetails | Format-Table -AutoSize
    }

    # If ServiceTag is piped or passed as an argument
    if ($ServiceTag) {
        Get-WarrantyInfo -tag $ServiceTag -key $ApiKey
    }
    # If ServiceTagFile is provided
    elseif ($ServiceTagFile) {
        $serviceTags = Get-Content $ServiceTagFile
        foreach ($tag in $serviceTags) {
            Write-Host "Getting warranty info for service tag: $tag"
            Get-WarrantyInfo -tag $tag -key $ApiKey
        }
    }
}
