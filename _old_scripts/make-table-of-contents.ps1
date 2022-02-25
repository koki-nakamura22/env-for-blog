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

# Edit table of contents.
$enc = [System.Text.Encoding]::UTF8
foreach ($f in $Args) {
    $fileName = (Get-ChildItem $f).Name
    $sourceFileName = Join-Path $absoluteWorkPath "${fileName}.tmp"
    $outputFileName = Join-Path $absoluteWorkPath $fileName
    Rename-Item $outputFileName -newName $sourceFileName
    $editFlg = $true
    $outputFile = New-Object System.IO.StreamWriter($outputFileName, $false, $enc)
    $reader = New-Object IO.StreamReader($sourceFileName, $enc)
    try {
        while ( ($line = $reader.ReadLine()) -ne $null){
            if ($line -eq "**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*") {
                $editFlg = $true
            }
            if ($line -eq "<!-- END doctoc generated TOC please keep comment here to allow auto update -->") {
                $editFlg = $false
            }
            if ($editFlg) {
                if ($line.Contains("<br>")) {
                    continue
                }
                $newTableOfContentLine = $line -replace "(^.*- )(.*$)", '$1<font color="#1111cc">$2</font>'
                $outputFile.WriteLine($newTableOfContentLine)
            } else {
                $outputFile.WriteLine($line);
            }
        }
    }
    finally {
        $reader.Close();
        $outputFile.Close()
    }
}

# Copy target files to posts directory.
foreach ($f in $Args) {
    $fileName = (Get-ChildItem $f).Name
    Copy-Item (Join-Path $absoluteWorkPath $fileName) $absolutePostsPath
}

# Remove unnecessary files.
Get-ChildItem $absoluteWorkPath *.* -Recurse | Remove-Item

Write-Host "The table of contents has been created!" -ForegroundColor "Cyan"
