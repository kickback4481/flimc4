$targetDir = "d:\Project\Chris\New 20"
$htmlFiles = Get-ChildItem -Path $targetDir -Filter "*.html"
$issuesFound = @()

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    $hasChanges = $false
    
    # 1. Ensure body has overflow-x-hidden
    if ($content -match '<body[^>]*>') {
        $bodyTag = $matches[0]
        if ($bodyTag -notmatch 'overflow-x-hidden') {
            $newBodyTag = $bodyTag -replace 'class="', 'class="overflow-x-hidden '
            $content = $content -replace [regex]::Escape($bodyTag), $newBodyTag
            $hasChanges = $true
            $issuesFound += "$($file.Name): Added overflow-x-hidden to body"
        }
    }

    # 2. Check for missing mobile padding on main containers (heuristic)
    # Most sections should have px-4, px-6, etc.
    # Just logging potential issues for now.
    
    # 3. Check for absolute positioned elements that might overflow right edge
    # if they don't have max-w-full
    if ($content -match 'w-\[([0-9]+)px\]') {
        # $issuesFound += "$($file.Name): Found fixed width w-[$($matches[1])px]"
    }
    
    if ($hasChanges) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    }
}

$issuesFound | Out-File (Join-Path $targetDir "mobile_test_results.txt")
Write-Host "Mobile test complete. Results written to mobile_test_results.txt."
