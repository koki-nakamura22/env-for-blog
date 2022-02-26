$absolutePostsPath = Convert-Path ".\content\posts"
$languages = @("en", "ja")

foreach ($l in $languages) {
    $article
    if ($l -eq "en") {
        $article = Join-Path $absolutePostsPath "${Args}.md"
    } else {
        $article = Join-Path $absolutePostsPath "${Args}.${l}.md"
    }
    hugo new $article
}

Write-Host "The articles have been created!" -ForegroundColor "Cyan"
