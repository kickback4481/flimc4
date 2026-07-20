$targetDir = "d:\Project\Chris\New 20"
$files = @("eboo.html", "ebo2.html", "ozone-therapy.html", "ubi-therapy.html", "vitamin-c.html", "myers-cocktail.html", "flu-defense.html", "vitality.html", "glutathione.html", "egcg.html", "migraine-defense.html", "chelation-therapy.html", "ubi-with-ozone.html", "5-pass-ozone.html", "iv-antibiotics.html", "iv-iron.html", "silver-infusion.html")

foreach ($filename in $files) {
    $path = Join-Path $targetDir $filename
    if (Test-Path $path) {
        $content = Get-Content -Path $path -Raw
        
        # Simple string replacement since they all use the exact same template format
        if ($content -match 'class="text-4xl md:text-5xl lg:text-6xl font-bold text-white mb-6"') {
            $newContent = $content -replace 'class="text-4xl md:text-5xl lg:text-6xl font-bold text-white mb-6"', 'class="text-4xl md:text-5xl lg:text-6xl font-bold font-serif text-white mb-6"'
            Set-Content -Path $path -Value $newContent -Encoding UTF8
            Write-Host "Updated $filename"
        }
    }
}
