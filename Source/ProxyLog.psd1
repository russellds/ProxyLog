@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'ProxyLog.psm1'

    # Version number of this module.
    ModuleVersion = '0.0.0'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID = '405f8d9e-ca7d-4058-83f0-f4d893ca365b'

    # Author of this module
    Author = 'Russell Slater'

    # Company or vendor of this module
    #CompanyName = ''

    # Copyright statement for this module
    Copyright = 'Copyright 2022 Russell Slater'

    # Description of the functionality provided by this module
    Description = ' A module to use Write-* cmdlets to write log files'

    # Minimum version of the PowerShell engine required by this module
    # PowerShellVersion = ''

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @()

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @('Write', 'Log', 'Logging', 'Proxy')

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/russellds/ProxyLog/blob/main/LICENSE'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/russellds/ProxyLog/blob/main/LICENSE'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            ReleaseNotes = ''

            # Prerelease string of this module
            Prerelease = 'preview'

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            # RequireLicenseAcceptance = $false

            # External dependent modules of this module
            # ExternalModuleDependencies = @()

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}
