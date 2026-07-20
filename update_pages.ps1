$targetDir = "d:\Project\Chris\New 20"
$indexFile = Join-Path $targetDir "index.html"

# Read index.html
$indexContent = Get-Content -Path $indexFile -Raw

# Extract footer using regex
$footerRegex = '(?s)(<!-- Footer -->\s*)?<footer.*?</footer>'
$footerMatch = [regex]::Match($indexContent, $footerRegex, 'IgnoreCase')

if (-not $footerMatch.Success) {
    Write-Host "Could not find footer in index.html"
    exit 1
}

$footerHtml = $footerMatch.Value

# Define new header
$newHeader = @'
    <!-- Header -->
    <header class="w-full bg-white shadow-sm relative z-50 pt-4 pb-4 px-6 md:px-16 flex justify-between items-center mx-auto">
        <div class="flex items-center gap-4">
            <a href="index.html" class="flex items-center gap-4">
                <img src="logo.png" alt="Florida Integrative Medical Center" onerror="this.src='logow.png'" class="w-16 md:w-20 h-auto">
                <div class="hidden md:block">
                    <h1 class="text-xl md:text-2xl font-serif font-bold text-[#00657e] leading-tight tracking-wide">FLORIDA INTEGRATIVE<br><span class="text-gray-500">MEDICAL CENTER</span></h1>
                </div>
            </a>
        </div>
        
        <!-- Mobile Menu Toggle -->
        <div class="flex flex-col items-center cursor-pointer relative" onclick="document.getElementById('mobile-menu').classList.toggle('hidden')">
            <div class="text-[#00657e] p-2 flex items-center justify-center hover:opacity-80 transition-all duration-300">
                <i class="fa-solid fa-bars text-3xl md:text-4xl"></i>
            </div>
            
            <!-- Mobile Menu Dropdown -->
            <div id="mobile-menu" class="hidden absolute top-14 right-0 w-64 bg-white/95 backdrop-blur-xl shadow-2xl rounded-2xl p-6 z-50 border border-teal-100 flex flex-col space-y-4 text-left">
                <a href="index.html" class="text-[#003a4d] font-bold text-base hover:text-teal-600 transition border-b border-gray-100 pb-2">Home</a>
                <a href="conditions.html" class="text-[#003a4d] font-bold text-base hover:text-teal-600 transition border-b border-gray-100 pb-2">Conditions</a>
                <a href="therapies.html" class="text-[#003a4d] font-bold text-base hover:text-teal-600 transition border-b border-gray-100 pb-2 hidden">Therapies</a>
                
                <!-- Therapies Dropdown -->
                <div class="border-b border-gray-100 pb-2">
                    <button class="text-[#003a4d] font-bold text-base hover:text-teal-600 transition w-full text-left flex justify-between items-center" onclick="event.stopPropagation(); document.getElementById('therapies-menu-list').classList.toggle('hidden')">
                        Therapies <i class="fa-solid fa-chevron-down text-xs"></i>
                    </button>
                    <div id="therapies-menu-list" class="hidden flex-col space-y-3 mt-3 pl-4 border-l-2 border-teal-100 max-h-48 overflow-y-auto custom-scrollbar">
                        <a href="eboo.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">EBOO</a>
                        <a href="ebo2.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">EBO2</a>
                        <a href="ozone-therapy.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Ozone Therapy</a>
                        <a href="ubi-therapy.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">UBI Therapy</a>
                        <a href="vitamin-c.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Vitamin C</a>
                        <a href="myers-cocktail.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Myers Cocktail</a>
                        <a href="flu-defense.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Flu Defense</a>
                        <a href="vitality.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Vitality</a>
                        <a href="glutathione.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Glutathione</a>
                        <a href="egcg.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">EGCG</a>
                        <a href="migraine-defense.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Migraine Defense</a>
                        <a href="chelation-therapy.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Chelation Therapy</a>
                        <a href="ubi-with-ozone.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">UBI with Ozone</a>
                        <a href="5-pass-ozone.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">5-Pass Ozone Therapy</a>
                        <a href="iv-antibiotics.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">IV Antibiotics</a>
                        <a href="iv-iron.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">IV Iron</a>
                        <a href="silver-infusion.html" class="block text-sm text-[#003a4d] hover:text-teal-600 transition">Silver Infusion</a>
                    </div>
                </div>
                <a href="about.html" class="text-[#003a4d] font-bold text-base hover:text-teal-600 transition border-b border-gray-100 pb-2">About</a>
                <a href="testimonials.html" class="text-[#003a4d] font-bold text-base hover:text-teal-600 transition border-b border-gray-100 pb-2">Testimonials</a>
                <a href="#contact-us" class="bg-teal-600 text-white text-center font-bold text-base py-2 rounded-xl hover:bg-teal-700 shadow-md transition mt-2">Book Now</a>
            </div>
        </div>
    </header>
'@

$htmlFiles = Get-ChildItem -Path $targetDir -Filter "*.html"
$headerRegex = '(?s)(<!-- Header -->\s*)?<header.*?</header>'

$count = 0
foreach ($file in $htmlFiles) {
    if ($file.Name -eq "index.html") {
        continue
    }

    $content = Get-Content -Path $file.FullName -Raw
    
    # Replace header
    $content = [regex]::Replace($content, $headerRegex, $newHeader)
    
    # Replace footer
    $content = [regex]::Replace($content, $footerRegex, $footerHtml)
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    $count++
}

Write-Host "Successfully updated header and footer in $count HTML files."
