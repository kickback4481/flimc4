$pages = @(
    @{ Title="Vitamin C"; File="vitamin-c.html"; Subtitle="Immune System & Recovery"; Desc="A high dose of this powerful antioxidant can help boost your immune system, improve skin health, and support recovery from illness or surgery. Some also use it to support chronic health conditions." },
    @{ Title="Myers Cocktail"; File="myers-cocktail.html"; Subtitle="Fatigue & Wellness"; Desc="A popular mix of vitamins and minerals (like magnesium, B vitamins, and vitamin C) that helps with fatigue, migraines, immunity, and overall wellness." },
    @{ Title="Flu Defense"; File="flu-defense.html"; Subtitle="Immunity Boost"; Desc="A blend of immune-boosting vitamins like vitamin C, zinc, and B vitamins. Great if you’re fighting a cold or flu or want extra protection during flu season." },
    @{ Title="Vitality"; File="vitality.html"; Subtitle="Energy & Focus"; Desc="Need a pick-me-up? This energy-boosting IV is designed to improve mental focus, fight fatigue, and support daily wellness with B vitamins, vitamin C, and amino acids." },
    @{ Title="Glutathione"; File="glutathione.html"; Subtitle="Master Antioxidant"; Desc="This is a master antioxidant that helps your body detox, supports your immune system, and improves skin clarity and glow." },
    @{ Title="EGCG"; File="egcg.html"; Subtitle="Green Tea Extract"; Desc="A green tea extract known for its ability to reduce inflammation, support weight management, and promote heart health." },
    @{ Title="Migraine Defense"; File="migraine-defense.html"; Subtitle="Relief & Prevention"; Desc="A mix of magnesium and B vitamins to help stop migraines in their tracks—and even prevent them in the future." },
    @{ Title="Chelation Therapy"; File="chelation-therapy.html"; Subtitle="Heavy Metal Detox"; Desc="This therapy helps remove heavy metals (like lead or mercury) from your body. It's sometimes used to support heart health or for deep detox. Only offered under medical supervision." },
    @{ Title="UBI with Ozone"; File="ubi-with-ozone.html"; Subtitle="Oxygenation & Detox"; Desc="This combines UV light and ozone to help with oxygenation and detox support." },
    @{ Title="5-Pass Ozone Therapy"; File="5-pass-ozone.html"; Subtitle="Advanced Blood Treatment"; Desc="5-Pass Ozone Therapy is an advanced blood treatment in which a patient’s blood is repeatedly withdrawn, enriched with medical-grade ozone, and reinfused over multiple cycles to enhance oxygen delivery and support immune function. It is a focused, efficient approach that treats smaller blood volumes per pass while delivering meaningful systemic benefits." },
    @{ Title="IV Antibiotics"; File="iv-antibiotics.html"; Subtitle="Serious Infections"; Desc="For serious infections like sepsis or pneumonia—faster and more effective than oral meds." },
    @{ Title="IV Iron"; File="iv-iron.html"; Subtitle="Restore Energy"; Desc="For people with low iron levels or anemia who don’t tolerate iron pills well. It helps restore energy and reduce fatigue." },
    @{ Title="Silver Infusion"; File="silver-infusion.html"; Subtitle="Antimicrobial Properties"; Desc="Used in some immune-support programs for its natural antimicrobial properties." }
)

$template = Get-Content "nad.html" -Raw

$old_desktop_dropdown = @"
                        <div class="absolute left-0 top-full mt-0 w-48 bg-white border border-gray-100 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50">
                            <a href="eboo.html" class="block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition border-b border-gray-50">EBOO</a>
                            <a href="ebo2.html" class="block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition border-b border-gray-50">EBO2</a>
                            <a href="ozone-therapy.html" class="block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition border-b border-gray-50">Ozone Therapy</a>
                            <a href="ubi-therapy.html" class="block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition rounded-b-md">UBI Therapy</a>
                        </div>
"@

$new_desktop_dropdown = @"
                        <div class="absolute left-0 top-full mt-0 w-56 max-h-96 overflow-y-auto bg-white border border-gray-100 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50 custom-scrollbar">
                            <a href="eboo.html" class="block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition border-b border-gray-50">EBOO</a>
                            <a href="ebo2.html" class="block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition border-b border-gray-50">EBO2</a>
                            <a href="ozone-therapy.html" class="block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition border-b border-gray-50">Ozone Therapy</a>
                            <a href="ubi-therapy.html" class="block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition border-b border-gray-50">UBI Therapy</a>
"@
foreach ($p in $pages) {
    if ($p -eq $pages[-1]) {
        $new_desktop_dropdown += "`r`n                            <a href=`"$($p.File)`" class=`"block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition rounded-b-md`">$($p.Title)</a>"
    } else {
        $new_desktop_dropdown += "`r`n                            <a href=`"$($p.File)`" class=`"block px-4 py-3 text-[12px] text-gray-700 hover:bg-teal-50 hover:text-teal-600 transition border-b border-gray-50`">$($p.Title)</a>"
    }
}
$new_desktop_dropdown += "`r`n                        </div>"

$old_mobile_dropdown = @"
                <!-- Therapies Section -->
                <div class="block px-3 py-2 text-base font-bold text-gray-800 uppercase">Therapies</div>
                <div class="pl-6 space-y-1">
                    <a href="eboo.html" class="block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase">EBOO</a>
                    <a href="ebo2.html" class="block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase">EBO2</a>
                    <a href="ozone-therapy.html" class="block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase">Ozone Therapy</a>
                    <a href="ubi-therapy.html" class="block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase">UBI Therapy</a>
                </div>
"@

$new_mobile_dropdown = @"
                <!-- Therapies Section -->
                <div class="block px-3 py-2 text-base font-bold text-gray-800 uppercase">Therapies</div>
                <div class="pl-6 space-y-1 max-h-64 overflow-y-auto custom-scrollbar">
                    <a href="eboo.html" class="block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase">EBOO</a>
                    <a href="ebo2.html" class="block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase">EBO2</a>
                    <a href="ozone-therapy.html" class="block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase">Ozone Therapy</a>
                    <a href="ubi-therapy.html" class="block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase">UBI Therapy</a>
"@
foreach ($p in $pages) {
    $new_mobile_dropdown += "`r`n                    <a href=`"$($p.File)`" class=`"block px-3 py-2 rounded-md text-sm font-medium text-gray-600 hover:text-teal-500 hover:bg-gray-50 uppercase`">$($p.Title)</a>"
}
$new_mobile_dropdown += "`r`n                </div>"

# Replace Menus in template
$template_fixed = $template -replace [regex]::Escape(($old_desktop_dropdown -replace "`r`n", "`n")), ($new_desktop_dropdown -replace "`r`n", "`n")
$template_fixed = $template_fixed -replace [regex]::Escape(($old_mobile_dropdown -replace "`r`n", "`n")), ($new_mobile_dropdown -replace "`r`n", "`n")

# Inject Custom Scrollbar CSS
$css = @"
        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #5ac6d6;
            border-radius: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #047b8e;
        }
    </style>
"@
$template_fixed = $template_fixed -replace "</style>", $css

# Generate new pages
foreach ($p in $pages) {
    $pageContent = $template_fixed
    
    # Replace Content
    $pageContent = $pageContent -replace "NAD\+ IV Therapy \| Florida Integrative Medical Center", "$($p.Title) | Florida Integrative Medical Center"
    $pageContent = $pageContent -replace "NAD\+ IV Therapy", "$($p.Title)"
    $pageContent = $pageContent -replace "Cellular Energy &amp; Vitality", "$($p.Subtitle)"
    $pageContent = $pageContent -replace "Cellular Energy & Vitality", "$($p.Subtitle)"
    $pageContent = $pageContent -replace "Recharge Your Cells", "Discover the Benefits of $($p.Title)"
    $pageContent = $pageContent -replace "NAD\+ \(Nicotinamide Adenine Dinucleotide\) is a critical coenzyme found in every cell of your body. Our NAD\+ IV Therapy is designed to support healthy aging, cognitive function, and cellular energy production. Contact us to learn if this therapy is right for you.", $($p.Desc)
    
    Set-Content -Path $p.File -Value $pageContent
}

# Update Menus in all existing html files (except the ones we just created which already have it)
$all_html = Get-ChildItem "*.html"
foreach ($f in $all_html) {
    # Skip if it is one of the new pages (we already generated them with new menus)
    $is_new = $false
    foreach ($p in $pages) {
        if ($f.Name -eq $p.File) {
            $is_new = $true
            break
        }
    }
    if ($is_new) { continue }
    
    $content = Get-Content $f.FullName -Raw
    $content = $content -replace "`r`n", "`n"
    $content = $content -replace [regex]::Escape(($old_desktop_dropdown -replace "`r`n", "`n")), ($new_desktop_dropdown -replace "`r`n", "`n")
    $content = $content -replace [regex]::Escape(($old_mobile_dropdown -replace "`r`n", "`n")), ($new_mobile_dropdown -replace "`r`n", "`n")
    $content = $content -replace "</style>", $css
    
    Set-Content -Path $f.FullName -Value $content
}

Write-Output "Generation complete."
