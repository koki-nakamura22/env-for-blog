# Build the project.
hugo

# Go to public directory.
Set-Location .\public

# Add changes to git.
git add .

# Create a commit message.
$dateTime = Get-Date -format "yyyy-MM-dd HH:mm:ss K"
$commitMsg = "Site updated: ${dateTime}"

# Commit.
git commit -m $commitMsg

# Push source and build repos.
git push origin master

# Come back to the project root.
Set-Location .\..

# Organize posts.
powershell .\organize-posts.ps1

Write-Host "The web page has been updated!" -ForegroundColor "Cyan"
