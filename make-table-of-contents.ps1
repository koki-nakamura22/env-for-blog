$absoluteCurrentPath = Convert-Path "."
$absolutePostsPath = Convert-Path ".\content\posts"
$workPath = "_forMakeTableOfContents"

# Make work directory.
if (!(Test-Path $workPath)) {
    New-Item $workPath -ItemType Directory
}
$absoluteWorkPath = Convert-Path ".\${workPath}"

# Copy target files to work directory.
Get-ChildItem $absoluteWorkPath *.* -Recurse | Remove-Item
foreach ($f in $Args) {
    Copy-Item $f $absoluteWorkPath
}

# Make table of contents.
Set-Location $absoluteWorkPath
doctoc .
Set-Location $absoluteCurrentPath

# Copy target files to posts directory.
foreach ($f in $Args) {
    $fileName = (Get-ChildItem $f).Name
    Copy-Item (Join-Path $absoluteWorkPath $fileName) $absolutePostsPath
}

# Remove unnecessary files.
Get-ChildItem $absoluteWorkPath *.* -Recurse | Remove-Item

Write-Host "The table of contents has been created!" -ForegroundColor "Cyan"
