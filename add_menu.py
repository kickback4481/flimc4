import os
import glob
import re

target_dir = r"d:\Project\Chris\New 20"
html_files = glob.glob(os.path.join(target_dir, "*.html"))

for file_path in html_files:
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Skip if already added to avoid duplicates
    if "lyme-disease-care.html" in content:
        continue

    # Regex to find the conditions link. 
    # Because whitespace can vary, we use regex.
    pattern = re.compile(r'(<a\s+href="conditions\.html"[^>]*>Conditions</a>)', re.IGNORECASE)
    
    # Replacement string with the new link
    # Using the same classes found in the match (mostly), but hardcoding the standard classes is safer.
    # We will just append the new link after the matched conditions link.
    
    def replacer(match):
        original = match.group(1)
        new_link = '\n                  <a href="lyme-disease-care.html" class="text-[#003a4d] font-bold text-base hover:text-teal-600 transition border-b border-gray-100 pb-2">Lyme Disease Care</a>'
        return original + new_link
        
    new_content, count = pattern.subn(replacer, content)
    
    if count > 0:
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(new_content)
        print(f"Updated {os.path.basename(file_path)}")
    else:
        print(f"Could not find conditions link in {os.path.basename(file_path)}")
