function Write-Information {
    [CmdletBinding(HelpUri = 'https://go.microsoft.com/fwlink/?LinkId=2097040', RemotingCapability = 'None')]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [Alias('Msg', 'Message')]
        [AllowNull()]
        [System.Object]
        ${MessageData},

        [Parameter(Position = 1)]
        [string[]]
        ${Tags})

    begin {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
                $PSBoundParameters['OutBuffer'] = 1
            }

            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Utility\Write-Information', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = { & $wrappedCmd @PSBoundParameters }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process {
        try {
            $steppablePipeline.Process($_)

            $paramWriteLog = @{
                Message = $MessageData
                Level = 1
            }

            if ($myInvocation.ScriptName) {
                $paramWriteLog.Component = "$( $MyInvocation.ScriptName | Split-Path -Leaf):$( $MyInvocation.ScriptLineNumber) "
            } else {
                $paramWriteLog.Component = $myInvocation.MyCommand
            }

            WriteLog @paramWriteLog
        } catch {
            throw
        }
    }

    end {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
}
