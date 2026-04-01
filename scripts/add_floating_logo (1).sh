#!/bin/bash
set -e
echo "🔍 מוודא תיקייה..."
if [ ! -f "index.html" ]; then echo "❌ לא נמצא index.html"; exit 1; fi

# גיבויים
for f in index.html psychology.html assets.html bankayt.html stock.html protocol.html metchilim.html premium.html; do
  [ -f "$f" ] && cp "$f" "${f}.bak" && echo "  ✅ גיבוי: ${f}.bak"
done

# CSS של הלוגו המרחף — נוסיף לכל דף
LOGO_CSS='
        /* ══ FLOATING LOGO ══ */
        .logo-container{position:relative;width:90px;height:90px;margin:0 auto 24px;cursor:pointer;}
        .logo-ring{position:absolute;inset:-10px;border-radius:50%;border:2px solid transparent;background:linear-gradient(var(--dark),var(--dark)) padding-box,conic-gradient(var(--yellow),var(--blue),var(--yellow2),var(--blue2),var(--yellow)) border-box;animation:spinRing 4s linear infinite;}
        @keyframes spinRing{to{transform:rotate(360deg);}}
        .logo-glow-outer{position:absolute;inset:-18px;border-radius:50%;background:radial-gradient(circle,rgba(250,204,21,0.15) 0%,rgba(14,165,233,0.1) 50%,transparent 70%);animation:glowPulse 2.5s ease-in-out infinite;}
        @keyframes glowPulse{0%,100%{transform:scale(1);opacity:0.7;}50%{transform:scale(1.15);opacity:1;}}
        .hero-logo{width:90px;height:90px;border-radius:50%;object-fit:cover;border:3px solid var(--yellow);display:block;position:relative;z-index:2;animation:logoFloat 3s ease-in-out infinite;transition:all 0.3s ease;filter:drop-shadow(0 0 20px rgba(250,204,21,0.4));}
        @keyframes logoFloat{0%,100%{transform:translateY(0px);filter:drop-shadow(0 0 20px rgba(250,204,21,0.4)) drop-shadow(0 0 40px rgba(14,165,233,0.2));}50%{transform:translateY(-12px);filter:drop-shadow(0 0 30px rgba(250,204,21,0.7)) drop-shadow(0 0 60px rgba(14,165,233,0.4));}}
        .logo-container:hover .hero-logo{filter:drop-shadow(0 0 25px rgba(250,204,21,0.9)) drop-shadow(0 0 50px rgba(14,165,233,0.7));transform:scale(1.08) translateY(-6px);border-color:var(--blue2);}
        .logo-container:hover .logo-ring{animation:spinRing 1s linear infinite;}
        .logo-container:hover .logo-glow-outer{background:radial-gradient(circle,rgba(14,165,233,0.35) 0%,rgba(250,204,21,0.2) 50%,transparent 70%);}
        /* לוגו טקסט */
        .nav-logo-text{font-size:1.1rem;font-weight:900;}
        .nav-logo-text .blue{color:#38bdf8;}
        .nav-logo-text .yellow{color:#facc15;}
'

# HTML של הלוגו המרחף
LOGO_HTML='    <div class="logo-container">
        <div class="logo-glow-outer"></div>
        <div class="logo-ring"></div>
        <img src="logo.jpg" alt="לוגו מנפחים תכיס" class="hero-logo">
    </div>'

# פונקציה לעדכון דף
update_page() {
    local file=$1

    # בודק אם לוגו כבר קיים
    if grep -q "hero-logo" "$file"; then
        echo "  ⚠️  $file — לוגו כבר קיים, מדלג"
        return
    fi

    # מוסיף CSS
    sed -i "s|</style>|${LOGO_CSS}\n        </style>|" "$file"

    # מחליף img של לוגו ב-container המרחף
    sed -i 's|<img src="logo\.jpg" alt="לוגו" class="hero-logo">|'"${LOGO_HTML}"'|g' "$file"

    # מעדכן nav logo text
    sed -i 's|<span>מנפחים תכיס 💰</span>|<span class="nav-logo-text"><span class="blue">מנפחים</span> <span class="yellow">ת'\''כיס</span></span>|g' "$file"
    sed -i "s|<span>מנפחים ת'כיס 💰</span>|<span class=\"nav-logo-text\"><span class=\"blue\">מנפחים</span> <span class=\"yellow\">ת'כיס</span></span>|g" "$file"

    echo "  ✅ $file עודכן"
}

echo ""
echo "✍️  מעדכן כל הדפים..."
for f in index.html psychology.html assets.html bankayt.html stock.html protocol.html metchilim.html premium.html; do
    [ -f "$f" ] && update_page "$f"
done

echo ""
echo "📤 מעלה ל-GitHub..."
git add index.html psychology.html assets.html bankayt.html stock.html protocol.html metchilim.html premium.html
git commit -m "feat: floating logo with neon effects on all pages including index"
git push origin master

echo ""
echo "✅ הכל עלה! לוגו מרחף בכל הדפים כולל index.html"
