# Make language information.
$ja = "ja"
$en = "en"

# Go to posts directory.
Set-Location .\content\posts

# Make each language directories.
if (!(Test-Path $ja)) {
    New-Item $ja -ItemType Directory
}
if (!(Test-Path $en)) {
    New-Item $en -ItemType Directory
}

# Copy posts to each language directories.
$fileList = Get-ChildItem -File -Name
foreach ($file in $fileList) {
    if ($file.contains(".${ja}.")) {
        Copy-Item $file $ja
    }
    else {
        Copy-Item $file $en
    }
}

# Add changes to git.
git add .

# Create a commit message.
$dateTime = Get-Date -format "yyyy-MM-dd HH:mm:ss K"
$commitMsg = "Posts organized: ${dateTime}"

# Commit.
git commit -m $commitMsg

# Push posts and build repos.
git push origin master

# Come back to the project root.
Set-Location .\..\..

Write-Output -InputObject "The posts has been organized!"
