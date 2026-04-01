#!/bin/bash
set -e
echo "🔍 מוודא תיקייה..."
if [ ! -f "index.html" ]; then echo "❌ לא נמצא index.html"; exit 1; fi

echo "📦 גיבויים..."
for f in metchilim.html assets.html bankayt.html stock.html protocol.html; do
  [ -f "$f" ] && cp "$f" "${f}.bak" && echo "  ✅ גיבוי: $f"
done

python3 << 'PYEOF'
import re

# הצבעים של psychology.html — אלה הצבעים הרשמיים של האתר
OLD_ROOTS = [
    # גרסה של index.html
    r':root\s*\{[^}]*--blue:#0ea5e9[^}]*\}',
    # גרסאות שונות
]

NEW_ROOT = ''':root {
            --bg: #0b1628;
            --yellow: #FFF100;
            --neon: #00E5FF;
            --text: #fff;
            --card: #111f38;
            --font: 'Heebo', sans-serif;
            --blue: #00E5FF;
            --blue2: #38d4f5;
            --yellow2: #ffe566;
            --dark: #0b1628;
            --border: #1a3050;
            --muted: #64748b;
            --radius: 14px;
        }'''

files = ['metchilim.html', 'assets.html', 'bankayt.html', 'stock.html', 'protocol.html']

for fname in files:
    try:
        with open(fname, 'r', encoding='utf-8') as f:
            html = f.read()

        # מחליף את בלוק :root כולו
        new_html = re.sub(r':root\s*\{[^}]+\}', NEW_ROOT, html, count=1)

        # מחליף צבעים ישנים שמופיעים hardcoded
        replacements = [
            ('#020812', '#0b1628'),
            ('#0a1628', '#111f38'),
            ('#facc15', '#FFF100'),
            ('#fde68a', '#ffe566'),
            ('#0ea5e9', '#00E5FF'),
            ('#38bdf8', '#38d4f5'),
            ('#1e3a5f', '#1a3050'),
        ]
        for old, new in replacements:
            new_html = new_html.replace(old, new)
            new_html = new_html.replace(old.upper(), new)

        with open(fname, 'w', encoding='utf-8') as f:
            f.write(new_html)
        print(f'  ✅ {fname} עודכן')

    except FileNotFoundError:
        print(f'  ⚠️  {fname} לא נמצא, מדלג')

print('🎉 כל הצבעים אוחדו!')
PYEOF

echo ""
echo "📤 מעלה ל-GitHub..."
git add metchilim.html assets.html bankayt.html stock.html protocol.html
git commit -m "style: unify colors across all pages to match psychology.html neon theme"
git push origin master

echo ""
echo "✅ הכל עלה! כל הדפים עכשיו באותו עיצוב ניאון"
