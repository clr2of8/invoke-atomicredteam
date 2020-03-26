#requires -Version 3.0

#Get public and private function definition files.
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -Exclude 'New-Atomic.ps1' -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -Exclude 'AtomicClassSchema.ps1' -ErrorAction SilentlyContinue )

# . "C:\AtomicRedTeam\invoke-atomicredteam\Public\New-Atomic.ps1"

#Dot source the files
Foreach ($import in @($Public + $Private)) {
    Try {
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}