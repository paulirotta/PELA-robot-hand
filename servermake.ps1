# PELA - 3D Printed LEGO-compatible parametric blocks
#
# See http://robothand.PELAblocks.org for more information
#
# Remote-triggered generation of a set of objects calibrated for your printer by changes to PELA-print-parameters.scad
#
# Since 'make.ps1' takes some time, you can link a 2nd PC using a network shared drive and let it do the work for you.
# It is a hack-style CI CAD server. Place the file 'start.txt' in the network drive to trigger a build. On the CI
# computer, trigger the build to lanuch this script with TheFolderSpy application. Output appears in the log.
# 
# Part of https://github.com/LEGO-Prototypes/PELA-robot-hand

Function FormatElapsedTime($ts) {
    $elapsedTime = ""

    if ( $ts.Minutes -gt 0 ) {
        $elapsedTime = [string]::Format( "{0:00}m {1:00}.{2:00}s", $ts.Minutes, $ts.Seconds, $ts.Milliseconds / 10 );
    }
    else {
        $elapsedTime = [string]::Format( "{0:00}.{1:00}s", $ts.Seconds, $ts.Milliseconds / 10 );
    }

    if ($ts.Hours -eq 0 -and $ts.Minutes -eq 0 -and $ts.Seconds -eq 0) {
        $elapsedTime = [string]::Format("{0:00}ms", $ts.Milliseconds);
    }

    if ($ts.Milliseconds -eq 0) {
        $elapsedTime = [string]::Format("{0}ms", $ts.TotalMilliseconds);
    }

    return $elapsedTime
}

$ErrorActionPreference = "SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript ci_log.txt -Force

Write-Output "Start PELA-robot-hand remote build"
Write-Output ""
Write-Output "Removing start.txt file"
Remove-Item RUNNING.txt -ErrorAction SilentlyContinue
Remove-Item FINISHED.txt -ErrorAction SilentlyContinue
Rename-Item start.txt RUNNING.txt
$start = Get-Date
Invoke-Expression './make.ps1 -png -stl'
$elapsed = FormatElapsedTime ((Get-Date) - $start)
Write-Output ""
Write-Output "PELA Robot Hand CI server  time elapsed: $elapsed"
Rename-Item RUNNING.txt FINISHED.txt
Stop-Transcript
