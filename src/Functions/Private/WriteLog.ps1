function WriteLog {
    param(
        [Parameter(Mandatory)]
        [string] $Message,

        [Parameter(Mandatory)]
        [string] $Component,

        [Parameter(Mandatory)]
        [ValidateSet(1, 2, 3)]
        [int] $Level,

        [AllowNull]
        [string] $File
    )

    $dateTime = Get-Date

    $time = "$( $dateTime.ToString('HH:mm:ss') ).$( $dateTime.Millisecond )+000"

    $entry = '<![LOG[{0}]LOG]!><time="{1}" date="{2}" component="{3}" context="" type="{4}" thread="" file="{4}">'

    $entyFormat = $Message, $time, $dateTime.ToString('MM-dd-yyyy'), $Component, $File

    if (-not $WriteLogFilePath) {
        $WriteLogFilePath = Join-Path -Path $env:TEMP -ChildPath "Powershell/$( $dateTime.ToString('yyyy-MM-dd') ).log"

        if (-not (Test-Path -Path ($WriteLogFilePath | Split-Path -Parent))) {
            New-Item -Path ($WriteLogFilePath | Split-Path -Parent) -ItemType Directory
        }
    }

    $entry -f $entyFormat |
        Out-File -FilePath $WriteLogFilePath -Append
}
