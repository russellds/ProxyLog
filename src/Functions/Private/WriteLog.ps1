function WriteLog {
    param(
        [Parameter(Mandatory)]
        [string] $Message,

        [Parameter(Mandatory)]
        [object] $Invocation,

        [Parameter(Mandatory)]
        [ValidateSet(1, 2, 3)]
        [int] $Level
    )

    $dateTime = Get-Date

    $entry = '<![LOG[{0}]LOG]!><time="{1}" date="{2}" component="{3}" context="" type="{4}" thread="" file="{5}">'

    if ($Invocation.ScriptName) {
        $component = "$( $Invocation.ScriptName | Split-Path -Leaf):$( $Invocation.ScriptLineNumber )"
        $file = $Invocation.ScriptName
    } else {
        $component = "$( $Invocation.MyCommand ):$( $Invocation.ScriptLineNumber )"
    }

    $entyFormat = $Message, $dateTime.ToString('HH:mm:ss.ffffff'), $dateTime.ToString('MM-dd-yyyy'), $component, $Level, $file

    if (-not $WriteLogFilePath) {
        $WriteLogFilePath = Join-Path -Path $env:TEMP -ChildPath "Powershell/$( $dateTime.ToString('yyyy-MM-dd') ).log"

        if (-not (Test-Path -Path ($WriteLogFilePath | Split-Path -Parent))) {
            New-Item -Path ($WriteLogFilePath | Split-Path -Parent) -ItemType Directory
        }
    }

    $entry -f $entyFormat |
        Out-File -FilePath $WriteLogFilePath -Append
}
