#!/bin/bash
# ============================================================
# תיקון קווים (-) ועברית ב-4 דפים
# ============================================================
set -e
echo "🔍 מוודא תיקייה..."
if [ ! -f "index.html" ]; then echo "❌ לא נמצא index.html"; exit 1; fi

for f in metchilim.html psychology.html assets.html protocol.html; do
  [ -f "$f" ] && cp "$f" "${f}.bak" && echo "  ✅ גיבוי: ${f}.bak"
done

python3 << 'PYEOF'
import re

# ============================================================
# פונקציה להסרת קווים מיותרים
# ============================================================
def remove_dashes(html):
    # מחליף " — " (em dash עם רווחים) בנקודתיים או ברווח
    html = html.replace(' — ', ': ')
    # מחליף "—" ללא רווחים
    html = html.replace('—', ' ')
    return html

# ============================================================
# metchilim.html
# ============================================================
with open('metchilim.html', 'r', encoding='utf-8') as f:
    html = f.read()

html = remove_dashes(html)

# תיקוני עברית
fixes = [
    ('המדריך שאתם שצריכים לדעת', 'המדריך שצריך לדעת'),
    ('בלי עמלות מיותרות, בלי בנקים שיאכלו לכם את הרווחים', 'ללא עמלות מיותרות, ללא בנקים שיאכלו את הרווחים שלך'),
]
for old, new in fixes:
    if old in html:
        html = html.replace(old, new)
        print(f'  ✅ metchilim: תוקן')

with open('metchilim.html', 'w', encoding='utf-8') as f:
    f.write(html)
print('✅ metchilim.html הושלם')

# ============================================================
# psychology.html
# ============================================================
with open('psychology.html', 'r', encoding='utf-8') as f:
    html = f.read()

html = remove_dashes(html)

# תיקוני עברית
fixes = [
    ('להבין כסף זה לא לדעת רק מתמטיקה, זה לדעת לשלוט בדחפים שלכם.',
     'להבין כסף זה לא רק מתמטיקה. זה לדעת לשלוט בדחפים שלכם.'),
    ('קל מאוד לזהות מישהו שקנה רכב ב-300 אלף שקל, אבל כמעט בלתי אפשרי לזהות מישהו שיש לו מיליון שקל בתיק השקעות.',
     'קל מאוד לזהות מישהו שקנה רכב ב-300 אלף שקל. אבל כמעט בלתי אפשרי לזהות מישהו שיש לו מיליון שקל בתיק השקעות.'),
    ('אתם מוציאים כסף כדי לרשים אנשים שאולי אתם בכלל לא אוהבים.',
     'אתם מוציאים כסף כדי לרשים אנשים שלפעמים בכלל לא מכירים.'),
    ('תפסיקו למדוד הצלחה לפי מה שקניתם.',
     'תפסיקו למדוד הצלחה לפי מה שקניתם.'),
    ('אתם לא צריכים להיות גאוני פיננסים.',
     'אין צורך להיות גאוני פיננסים.'),
    ('כולם מחפשים את ה"מניה" שתעלה ב-1,000% מחר בבוקר.',
     'כולם מחפשים את המניה שתעלה מאה אחוז מחר בבוקר.'),
]
for old, new in fixes:
    if old in html:
        html = html.replace(old, new)
        print(f'  ✅ psychology: תוקן')

with open('psychology.html', 'w', encoding='utf-8') as f:
    f.write(html)
print('✅ psychology.html הושלם')

# ============================================================
# assets.html
# ============================================================
with open('assets.html', 'r', encoding='utf-8') as f:
    html = f.read()

html = remove_dashes(html)

# תיקוני עברית
fixes = [
    ('"משיכת יתר"', 'משיכת יתר'),
    ('ריבית דביטורית של 8-12% בשנה', 'ריבית דביטורית גבוהה במיוחד'),
    ('מי שלא מבין את הפרטים האלה', 'מי שלא שם לב לפרטים האלה'),
    ('נחוש מתנדף בלי שמרגישים', 'כסף מתנדף בלי שמרגישים'),
    ('תוספות שנצמרות', 'תשואות שנצברות'),
]
for old, new in fixes:
    if old in html:
        html = html.replace(old, new)
        print(f'  ✅ assets: תוקן')

# שינוי כותרת המילון
html = html.replace('מילון מנפחים', 'מילון מנפחים שוק ההון')

with open('assets.html', 'w', encoding='utf-8') as f:
    f.write(html)
print('✅ assets.html הושלם')

# ============================================================
# protocol.html
# ============================================================
with open('protocol.html', 'r', encoding='utf-8') as f:
    html = f.read()

html = remove_dashes(html)

# תיקון כותרת המילון
html = html.replace('>מילון פרוטוקול<', '>מילון מנפחים שוק ההון<')

with open('protocol.html', 'w', encoding='utf-8') as f:
    f.write(html)
print('✅ protocol.html הושלם')

print('')
print('🎉 כל התיקונים הושלמו!')
PYEOF

echo ""
echo "📤 מעלה ל-GitHub..."
git add metchilim.html psychology.html assets.html protocol.html
git commit -m "fix: remove dashes, fix Hebrew in metchilim/psychology/assets/protocol"
git push origin master

echo ""
echo "✅ הכל עלה! יתעדכן תוך דקה-שתיים"
echo ""
echo "📝 סיכום:"
echo "  metchilim.html  — הוסרו קווים + תיקוני עברית"
echo "  psychology.html — הוסרו קווים + תיקוני עברית"
echo "  assets.html     — הוסרו קווים + תיקוני עברית"
echo "  protocol.html   — הוסרו קווים"
