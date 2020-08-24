function Get-EcoStruxStureInventory {
    <#
        .SYNOPSIS
            Queries API for Inventory Objects
        .DESCRIPTION
            Queries EcoStruxSture API with provided Organization and API Key to gather Inventory Objects
        .PARAMETER APIKey
            API Key needed to access EcoStruxSture API
        .EXAMPLE
            Get-EcoStruxStureInventory -APIKey <KEY> -Organization <ORGANIZATION>
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$APIKey,
        [Parameter(Mandatory = $true)]$Organization
    ) 
    BEGIN { 
        $headers = @{Authorization = "Bearer $apikey" }
    } #BEGIN

    PROCESS {
           $Inventory = Invoke-WebRequest -Uri "https://api.ecostruxureit.com/rest/v1/organizations/$Organization/inventory" -ContentType "application/json" -Headers $headers
    } #PROCESS

    END { 
        ($Inventory.content | ConvertFrom-Json).inventoryObjects
    } #END

} #FUNCTION