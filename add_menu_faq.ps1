$targetDir = "d:\Project\Chris\New 20"
$htmlFiles = Get-ChildItem -Path $targetDir -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Skip if already added
    if ($content -match "faq\.html") {
        continue
    }
    
    # Replacement string
    $pattern = '(?i)(<div\s+id="therapies-menu-list"\s+class="hidden\s+flex-col[^>]*>)'
    $replacement = '$1' + "`n                        <a href=`"faq.html`" class=`"block text-sm text-[#003a4d] hover:text-teal-600 transition`">FAQ</a>"
    
    if ($content -match $pattern) {
        $newContent = $content -replace $pattern, $replacement
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
