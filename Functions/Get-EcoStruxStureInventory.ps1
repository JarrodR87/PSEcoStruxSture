function Get-EcoStruxStureInventory {
    <#
        .SYNOPSIS
            C
        .DESCRIPTION
            C
        .PARAMETER APIKey
            API Key needed to access EcoStruxSture API
        .EXAMPLE
            Get-EcoStruxStureInventory -APIKey <KEY>
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$APIKey
    ) 
    BEGIN { 
        $headers = @{Authorization = "Bearer $apikey" }
    } #BEGIN

    PROCESS {
           $Inventory = Invoke-WebRequest -Uri "https://api.ecostruxureit.com/rest/v1/organizations/6f51efe2-984a-43c0-8894-97c71b2b7141/inventory" -ContentType "application/json" -Headers $headers
    } #PROCESS

    END { 
        ($Inventory.content | ConvertFrom-Json).inventoryObjects
    } #END

} #FUNCTION