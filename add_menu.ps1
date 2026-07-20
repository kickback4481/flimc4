$targetDir = "d:\Project\Chris\New 20"
$htmlFiles = Get-ChildItem -Path $targetDir -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Skip if already added
    if ($content -match "lyme-disease-care\.html") {
        continue
    }
    
    # Replacement string
    $pattern = '(?i)(<a\s+href="conditions\.html"[^>]*>Conditions</a>)'
    $replacement = '$1' + "`n                  <a href=`"lyme-disease-care.html`" class=`"text-[#003a4d] font-bold text-base hover:text-teal-600 transition border-b border-gray-100 pb-2`">Lyme Disease Care</a>"
    
    if ($content -match $pattern) {
        $newContent = $content -replace $pattern, $replacement
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    } else {
        Write-Host "Could not find conditions link in $($file.Name)"
    }
}
