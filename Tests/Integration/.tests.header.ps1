# Integration test header
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$script:moduleName = 'PowerStig.Convert'
$script:modulePath = "$($script:moduleRoot)\$($script:moduleName).psm1"

if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'PowerStig.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'PowerStig.Tests\TestHelper.psm1'))) )
{
    & git @('clone', 'https://github.com/Microsoft/PowerStig.Tests', (Join-Path -Path $script:moduleRoot -ChildPath 'PowerStig.Tests'))
}

Import-Module -Name (Join-Path -Path $script:moduleRoot -ChildPath (
                     Join-Path -Path 'PowerStig.Tests' -ChildPath 'TestHelper.psm1')
                     ) -Force

Import-Module $modulePath -Force
