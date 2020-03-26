#requires -Version 3.0

Write-Host -ForegroundColor cyan "Calling Invoke-AtomicRedTeam.psm1"
#Get public and private function definition files.
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse  -ErrorAction SilentlyContinue )

#. "C:\AtomicRedTeam\invoke-atomicredteam\Private\AtomicClassSchema.ps1"

#Dot source the files
Foreach ($import in @($Public + $Private)) {
    Try {
        . $import.fullname
        write-host $import
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}