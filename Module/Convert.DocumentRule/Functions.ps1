# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
#region Functions
<#
    .SYNOPSIS
        Accepts the raw stig string data and converts it to a Documentation object.
#>
function ConvertTo-DocumentRule
{
    [CmdletBinding()]
    [OutputType([DocumentRule])]
    Param
    (
        [parameter(Mandatory = $true)]
        [xml.xmlelement]
        $StigRule
    )

    Write-Verbose "[$($MyInvocation.MyCommand.Name)]"

    $documentRule = [DocumentRule]::New( $StigRule )

    $documentRule.SetStigRuleResource()

    return $documentRule
}
#endregion
