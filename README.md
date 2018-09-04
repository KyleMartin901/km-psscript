# Description

This is a test project to test the (`'count' must be non-negative`) PSScriptAnalyzer error.

## Simulate the error

This error was tested using the following setup

| Tool  | Version |
| ----- | ------- |
| PowerShell | 6.0.4 |
| PSScriptAnalyzer | 1.17.1 |

## Replicate the error

### PowerShell Console

If you run the following command

```PowerShell
Invoke-ScriptAnalyzer -Path Test-Func.ps1 -Settings psscriptanalyzersettings.psd1
```

It will give the following error

```PowerShell
Invoke-ScriptAnalyzer : 'count' must be non-negative.
Parameter name: count
At line:1 char:1
+ Invoke-ScriptAnalyzer -Path Test-Func.ps1 -Settings psscriptanalyzers ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ CategoryInfo          : InvalidOperation: (/Users/kyle/Dev...t/Test-Func.ps1:String) [Invoke-ScriptAnalyzer], ArgumentOutOfRangeException
+ FullyQualifiedErrorId : RULE_ERROR,Microsoft.Windows.PowerShell.ScriptAnalyzer.Commands.InvokeScriptAnalyzerCommand
```

### Docker

A docker container can be built to be used to run the command and replicated the error

1. Build container
    ```bash
    docker build -t kylemartin901/km-psscript .
    ```
2. Run the container with the Invoke-Script command
    ```bash
    docker run -it --rm kylemartin901/km-psscript pwsh -c 'Invoke-ScriptAnalyzer -Path Test-Func.ps1 -Settings psscriptanalyzersettings.psd1'
    ```
3. Output
    ```bash
    Invoke-ScriptAnalyzer : 'count' must be non-negative.
    Parameter name: count
    At line:1 char:1
    + Invoke-ScriptAnalyzer -Path Test-Func.ps1 -Settings psscriptanalyzers ...
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (/temp/scripts/Test-Func.ps1:String)[Invoke-ScriptAnalyzer], ArgumentOutOfRangeException
    + FullyQualifiedErrorId : RULE_ERROR,Microsoft.Windows.PowerShell.ScriptAnalyzer.Commands.InvokeScriptAnalyzerCommand
    ```
