Param (
    [String] $searchPath = ".",
    [string] $filter,
    [Int] $timeoutInterval = 100
)

# Sync Powershell's current directory and .NET's
[IO.Directory]::SetCurrentDirectory((Get-Location).Path)

# Make watcher object
$watcher = New-Object IO.FileSystemWatcher
$watcher.Path = [IO.Path]::GetFullPath($searchPath)
$watcher.IncludeSubdirectories = $true
if ($filter) { $watcher.Filter = $filter }

while ($true) {
    $result = $watcher.WaitForChanged([System.IO.WatcherChangeTypes]::All, $timeoutInterval)
    if (-not $result.TimedOut) {
        #$result
        if ([IO.Path]::GetExtension($result.OldName) -match '\.xls.?') {
            $filename = $result.OldName
        } else {
            $filename = $result.Name
        }
        write (Join-Path $watcher.Path $filename)
    }
}
