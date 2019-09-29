# Make posts' backup each language.
# Make each language directories.
$backup = "_postsBackup"
$ja = "ja"
$en = "en"

if (!(Test-Path $backup)) {
    New-Item $backup -ItemType Directory
}
$absoluteBackupDir = Convert-Path ".\${backup}"
$absolutejJaDir = Join-Path $absoluteBackupDir $ja
$absolutejEnDir = Join-Path $absoluteBackupDir $en
if (!(Test-Path $absolutejJaDir)) {
    New-Item $absolutejJaDir -ItemType Directory
}
if (!(Test-Path $absolutejEnDir)) {
    New-Item $absolutejEnDir -ItemType Directory
}

# Go to posts directory.
Set-Location .\content\posts

# Copy posts to each language directories.
$fileList = Get-ChildItem -File -Name
foreach ($file in $fileList) {
    if ($file.contains(".${ja}.")) {
        Copy-Item $file $absolutejJaDir
    }
    else {
        Copy-Item $file $absolutejEnDir
    }
}

# Add changes to git in posts directory.
git add .

# Go to posts backup directory.
Set-Location ".\..\..\${backup}"

# Add changes to git in backup directory.
git add .

# Create a commit message.
$dateTime = Get-Date -format "yyyy-MM-dd HH:mm:ss K"
$commitMsg = "Posts organized: ${dateTime}"

# Commit.
git commit -m $commitMsg

# Push posts and build repos.
git push origin master

# Come back to the project root.
Set-Location .\..

Write-Host "The posts has been organized!" -ForegroundColor "Cyan"
