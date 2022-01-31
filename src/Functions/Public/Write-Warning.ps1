function Write-Warning {
    [CmdletBinding(HelpUri = 'https://go.microsoft.com/fwlink/?LinkID=2097044', RemotingCapability = 'None')]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [Alias('Msg')]
        [AllowEmptyString()]
        [string]
        ${Message})

    begin {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
                $PSBoundParameters['OutBuffer'] = 1
            }

            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Utility\Write-Warning', [System.Management.Automation.CommandTypes]::Cmdlet)
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
                Message = $Message
                Level = 2
            }

            if ($MyInvocation.ScriptName) {
                $paramWriteLog.Component = "$( $MyInvocation.ScriptName | Split-Path -Leaf):$( $MyInvocation.ScriptLineNumber)"
            } else {
                $paramWriteLog.Component = "$( $MyInvocation.MyCommand ):$( $MyInvocation.ScriptLineNumber )"
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
<#

.ForwardHelpTargetName Microsoft.PowerShell.Utility\Write-Warning
.ForwardHelpCategory Cmdlet

#>
