# מנפחים ת'כיס — Project Context for Claude

## What is this project?
A Hebrew financial education brand targeting Gen-Z Israelis (ages 16–28).
Founder: שוהם אבו (Shoham Abu).
Mission: Make personal finance accessible, non-scary, and actionable for young Israelis who were never taught about money.

## Brand Identity
- Name: מנפחים ת'כיס (Menafim T'kis)
- Tagline: "נמאס מהמסלול הבינוני"
- Colors: Neon Blue `#00E5FF`, Neon Yellow `#FFF100`, Dark BG `#080C10`
- Font: Heebo (Hebrew-optimized)
- Tone: Dugri (direct/honest), rebellious against mediocrity, math-backed
- Language: Hebrew only, RTL layout
- Legal: All content is educational only. Shoham is NOT a licensed financial advisor.

## Platform
- Website built on **Wix** using **Velo** (JavaScript)
- Social: Instagram, TikTok
- Python scripts are used for content/mission generation (not deployed to Wix)

## File Structure
| File | Purpose |
|---|---|
| `User_Experience.js` | Velo master code — calculators, CTA, formatters, page init |
| `Market_Intelligence.py` | Weekly missions, market focus topics, myth-busting list |
| `Growth_Engine.py` | Compound interest calculators, monetization plans |
| `Brand_Identity.txt` | Brand voice, colors, legal disclaimer, psychological framework |
| `Psychology_Assests.txt` | Core financial philosophy, must-read books, key concepts |
| `menafim_post.html` | Instagram post mockup (phone frame UI) |

## Monetization Tiers
1. **Tier 1** — Digital guide: "הצעד הראשון ל-S&P 500" — ₪99
2. **Tier 2** — Discord VIP community — ₪49/month
3. **Tier 3** — Lectures at pre-military academies and IDF units

## Key Concepts Used in Content
- ריבית דריבית (compound interest) — 8% nominal, 5% real (after 3% inflation)
- מארב פיננסי — spending on status/appearance instead of investing
- כיפת ברזל כלכלית — emergency fund
- נכס מול התחייבות — asset vs. liability (Rich Dad Poor Dad framework)
- FIRE movement, קרן השתלמות, low management fees

## Viral Content Triggers
FOMO, כעס על המערכת, גאווה ישראלית, הוכחה מתמטית

## Wix/Velo Element IDs (for User_Experience.js)
- `#ctaShopButton` — CTA button present on every page
- `#calcAmount` — calculator input field
- `#calcResult` — calculator result text element
- `#calcButton` — calculate button

## Language Rule
Always speak and respond to the user in English.
Always create all content and files in Hebrew. All output files, posts, and scripts must be in Hebrew only.

## Coding Conventions
- Python files use `sys.stdout.reconfigure(encoding='utf-8')` at the top for Windows Hebrew output
- JS formatter `ILS` is cached as a module-level constant (not recreated per call)
- All calculator functions accept `rate` and `years` as optional params (defaults: 8%, 20y)
- Input validation: check for empty, NaN, negative, and >10,000,000

## Agent Team — Strategy Overview

Each agent folder is at `agents/<Name>/instructions.md`. All agents operate in Hebrew only.

| סוכן | תפקיד | מיקוד אסטרטגי |
|---|---|---|
| **מאיה** | שיווק | לוח תוכן שבועי, תבניות הוק, פורמטים לטיקטוק/אינסטגרם, טריגרים לקהל ישראלי |
| **עומרי** | אנליסט פיננסי | תבניות בלוג, מקורות נתונים פיננסיים, מסגרת ניתוח ACWI מול S&P 500, מילות מפתח SEO בעברית |
| **ליאת** | קהילה | סקריפטים לאירוסין בעברית, אתגרים שבועיים, ניהול קבוצת VIP, תבניות מענה לשאלות נפוצות |
| **נועה** | מנהלת | רצפי אימייל אוטומטי (7 ימי ליד נרצ'), תבנית סיכום שבועי, משפך מכירות ₪39→₪199, אוטומציית מסירת מוצר דיגיטלי |
| **רועי** | קריאייטיב | מערכת עיצוב מלאה (#080C10 / #FFF100 / #00E5FF), תבניות HTML שבועיות, פורמט קרוסלה לאינסטגרם, מפרט Wix embed |

### Sales Funnel Architecture (נועה מנהלת)
```
כניסה חינמית (תוכן אורגני)
       ↓
ליד מגנט — PDF חינמי / אתגר 7 ימים
       ↓
Tier 1 — מדריך דיגיטלי ₪39 (entry)
       ↓
Upsell — מדריך מורחב ₪99
       ↓
Tier 2 — VIP Discord ₪49/חודש
       ↓
Premium Upsell — חבילת VIP שנתית ₪199
```

### Cross-Agent Workflow
1. **עומרי** מייצר נתונים ותובנות פיננסיות
2. **מאיה** הופכת אותם לתוכן ויראלי + לוח שבועי
3. **רועי** מעצב ויזואלים לפי תבניות HTML + מערכת עיצוב
4. **ליאת** מפיצה בקהילה + מנהלת מענה ואתגרים
5. **נועה** מתאמת, שולחת אימיילים אוטומטיים, ומדווחת לשוהם
