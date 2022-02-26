$moduleName = 'ProxyLog'

if (Test-Path -Path "./Modules/$( $moduleName )") {
    $modulePath = Resolve-Path -Path "./Modules/$( $moduleName )"
} else {
    $modulePath = Resolve-Path -Path "$PSScriptRoot/../output/$( $moduleName )"
}

Import-Module $modulePath.Path -Force

Describe "Import-Module $( $moduleName )" {
    Context 'Module Exports' {
        It 'Should export at least one function' {
            @(Get-Command -Module $moduleName).Count | Should -BeGreaterThan 0
        }
    }
}
