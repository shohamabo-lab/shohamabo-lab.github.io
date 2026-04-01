#!/bin/bash
set -e
echo "🔍 מוודא תיקייה..."
if [ ! -f "index.html" ]; then echo "❌ לא נמצא index.html"; exit 1; fi
cp bankayt.html bankayt.html.bak
echo "✅ גיבוי נשמר"

cat > bankayt.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="he" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>לדבר בנקאית - מנפחים ת'כיס</title>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@300;400;700;900&display=swap" rel="stylesheet">
    <style>
        *,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
        :root{--yellow:#facc15;--yellow2:#fde68a;--blue:#0ea5e9;--blue2:#38bdf8;--green:#10b981;--dark:#020812;--card:#0a1628;--border:#1e3a5f;--text:#e2e8f0;--muted:#64748b;--radius:14px;}
        html{scroll-behavior:smooth;}
        body{font-family:'Heebo',sans-serif;background:var(--dark);color:var(--text);overflow-x:hidden;}
        body::before{content:'';position:fixed;inset:0;z-index:0;background-image:linear-gradient(rgba(14,165,233,0.04) 1px,transparent 1px),linear-gradient(90deg,rgba(14,165,233,0.04) 1px,transparent 1px);background-size:48px 48px;pointer-events:none;}
        *{position:relative;z-index:1;}

        nav{position:sticky;top:0;z-index:200;background:rgba(2,8,18,0.9);backdrop-filter:blur(16px);border-bottom:1px solid rgba(14,165,233,0.2);padding:0 24px;display:flex;align-items:center;justify-content:space-between;height:62px;}
        .nav-logo{display:flex;align-items:center;gap:10px;text-decoration:none;}
        .nav-logo img{height:38px;width:38px;border-radius:50%;object-fit:cover;border:2px solid var(--yellow);}
        .nav-logo span{font-size:1.1rem;font-weight:900;color:#fff;}
        .nav-links{display:flex;gap:4px;list-style:none;}
        .nav-links a{color:#94a3b8;text-decoration:none;font-size:0.85rem;font-weight:600;padding:6px 11px;border-radius:8px;transition:all 0.2s;}
        .nav-links a:hover{color:#fff;background:rgba(14,165,233,0.1);}
        .nav-links a.active{color:#fff;background:rgba(14,165,233,0.15);}
        .hamburger{display:none;background:none;border:none;color:#fff;font-size:1.5rem;cursor:pointer;}
        .mobile-menu{display:none;flex-direction:column;position:fixed;top:62px;inset-inline:0;background:#060f1e;border-bottom:1px solid var(--border);padding:12px 20px;z-index:199;gap:2px;}
        .mobile-menu.open{display:flex;}
        .mobile-menu a{color:#e2e8f0;text-decoration:none;font-size:0.95rem;padding:10px 0;border-bottom:1px solid #1e3a5f;}
        @media(max-width:780px){.nav-links{display:none;}.hamburger{display:block;}}

        .ticker-wrap{background:#030c18;border-bottom:1px solid rgba(14,165,233,0.15);}

        /* HERO */
        .hero{text-align:center;padding:70px 20px 50px;overflow:hidden;}
        .hero-glow{position:absolute;top:-100px;left:50%;transform:translateX(-50%);width:700px;height:400px;background:radial-gradient(ellipse,rgba(14,165,233,0.12) 0%,rgba(250,204,21,0.05) 50%,transparent 70%);pointer-events:none;}
        .hero-icon{font-size:3.5rem;margin-bottom:20px;display:block;}
        .hero h1{font-size:clamp(2rem,5vw,3.5rem);font-weight:900;color:#fff;margin-bottom:12px;line-height:1.1;}
        .hero h1 span{color:var(--yellow);text-shadow:0 0 30px rgba(250,204,21,0.4);}
        .hero-sub{color:#94a3b8;font-size:1.05rem;max-width:520px;margin:0 auto;line-height:1.75;}

        /* SECTIONS */
        .content{max-width:860px;margin:0 auto;padding:0 20px 80px;}
        .divider{height:1px;max-width:860px;margin:60px auto;background:linear-gradient(90deg,transparent,rgba(14,165,233,0.25) 30%,rgba(250,204,21,0.25) 70%,transparent);}

        .lesson{background:var(--card);border:1px solid var(--border);border-radius:20px;padding:36px 32px;margin-bottom:24px;transition:border-color 0.2s;}
        .lesson:hover{border-color:rgba(14,165,233,0.4);}
        .lesson-num{font-size:0.72rem;font-weight:800;letter-spacing:3px;text-transform:uppercase;color:var(--yellow);margin-bottom:14px;display:flex;align-items:center;gap:10px;}
        .lesson-num::after{content:'';flex:1;height:1px;background:rgba(250,204,21,0.2);}
        .lesson h2{font-size:clamp(1.2rem,3vw,1.6rem);font-weight:900;color:#fff;margin-bottom:18px;line-height:1.3;}
        .lesson-intro{color:#94a3b8;font-size:1rem;line-height:1.8;margin-bottom:22px;}

        .tip-list{list-style:none;display:flex;flex-direction:column;gap:14px;}
        .tip-item{display:flex;gap:14px;align-items:flex-start;}
        .tip-icon{width:36px;height:36px;border-radius:10px;background:rgba(14,165,233,0.1);border:1px solid rgba(14,165,233,0.2);display:flex;align-items:center;justify-content:center;font-size:1rem;flex-shrink:0;margin-top:2px;}
        .tip-item.warning .tip-icon{background:rgba(239,68,68,0.1);border-color:rgba(239,68,68,0.2);}
        .tip-item.success .tip-icon{background:rgba(16,185,129,0.1);border-color:rgba(16,185,129,0.2);}
        .tip-content{}
        .tip-title{font-size:0.92rem;font-weight:800;color:#fff;margin-bottom:4px;}
        .tip-text{font-size:0.88rem;color:#94a3b8;line-height:1.65;}

        .lesson-bottom{margin-top:22px;padding-top:18px;border-top:1px solid var(--border);font-size:0.88rem;font-weight:700;color:var(--blue2);display:flex;align-items:center;gap:8px;}
        .lesson-bottom::before{content:'💡';}

        /* DICTIONARY */
        .dict-wrap{max-width:860px;margin:0 auto;padding:0 20px 80px;}
        .dict-head{text-align:center;margin-bottom:36px;}
        .dict-tag{font-size:0.72rem;font-weight:700;letter-spacing:3px;text-transform:uppercase;color:var(--yellow);display:block;margin-bottom:10px;}
        .dict-head h2{font-size:clamp(1.6rem,3.5vw,2.2rem);font-weight:900;color:#fff;}
        .dict-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(240px,1fr));gap:16px;}
        .dict-card{background:var(--card);border:1px solid var(--border);border-radius:var(--radius);padding:22px 20px;}
        .dict-card h3{font-size:0.95rem;font-weight:800;color:var(--yellow2);margin-bottom:8px;}
        .dict-card p{font-size:0.87rem;color:#94a3b8;line-height:1.65;}

        /* WARNING BOX */
        .warning-box{max-width:860px;margin:0 auto 80px;padding:0 20px;}
        .warning-inner{background:rgba(245,158,11,0.07);border:1px solid rgba(245,158,11,0.25);border-radius:16px;padding:24px 28px;font-size:0.9rem;color:#94a3b8;line-height:1.75;text-align:center;}
        .warning-inner strong{color:var(--yellow2);}

        footer{background:#030c18;border-top:1px solid rgba(14,165,233,0.15);text-align:center;padding:28px 20px;color:var(--muted);font-size:0.8rem;}
        footer a{color:var(--muted);text-decoration:none;}
        footer a:hover{color:#fff;}

        .fade-up{opacity:0;transform:translateY(24px);transition:opacity 0.6s ease,transform 0.6s ease;}
        .fade-up.visible{opacity:1;transform:translateY(0);}
    </style>
</head>
<body>

<nav>
    <a href="index.html" class="nav-logo">
        <img src="logo.jpg" alt="לוגו">
        <span>מנפחים ת'כיס 💰</span>
    </a>
    <ul class="nav-links">
        <li><a href="index.html">בית</a></li>
        <li><a href="metchilim.html">מתחילים לנפח</a></li>
        <li><a href="psychology.html">פסיכולוגיה</a></li>
        <li><a href="assets.html">נכסים</a></li>
        <li><a href="bankayt.html" class="active">בנקאית</a></li>
        <li><a href="stock.html">שוק ההון</a></li>
        <li><a href="protocol.html">פרוטוקול ה-10</a></li>
        <li><a href="premium.html">⭐ פרימיום</a></li>
    </ul>
    <button class="hamburger" onclick="document.getElementById('mob').classList.toggle('open')">☰</button>
</nav>
<div class="mobile-menu" id="mob">
    <a href="index.html">🏠 בית</a>
    <a href="metchilim.html">🚀 מתחילים לנפח</a>
    <a href="psychology.html">🧠 פסיכולוגיה של הכיס</a>
    <a href="assets.html">💎 נכסים מול בורות</a>
    <a href="bankayt.html">🏦 לדבר בנקאית</a>
    <a href="stock.html">📈 שוק ההון</a>
    <a href="protocol.html">✈️ פרוטוקול ה-10</a>
    <a href="premium.html">⭐ מנפחים מתקדמים</a>
</div>

<div class="ticker-wrap">
    <div class="tradingview-widget-container"><div class="tradingview-widget-container__widget"></div>
    <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async>
    {"symbols":[{"proName":"FOREXCOM:SPX500","title":"S&P 500"},{"proName":"FOREXCOM:NSXUSD","title":"NASDAQ 100"},{"proName":"BINANCE:BTCUSDT","title":"ביטקוין"},{"proName":"FX_IDC:USDILS","title":"דולר/שקל"}],"colorTheme":"dark","isTransparent":true,"locale":"he_IL"}
    </script></div>
</div>

<section class="hero">
    <div class="hero-glow"></div>
    <span class="hero-icon">🏦</span>
    <h1>איך לדבר <span>בנקאית</span><br>ולהישאר עם כסף בכיס</h1>
    <p class="hero-sub">המדריך שהבנק לא רוצה שתקרא. כל מה שצריך לדעת לפני שנכנסים לסניף.</p>
</section>

<div class="divider"></div>

<div class="content">

    <!-- 01 -->
    <div class="lesson fade-up">
        <div class="lesson-num">01</div>
        <h2>בחרת מסלול? תוודא שלא הלבישו עליך חשבון</h2>
        <p class="lesson-intro">הבנק חייב להציע לכם מסלולים קבועים, אבל הם תמיד ינסו לדחוף לכם את מה שטוב להם. הנה מה שצריך לדעת לפני שחותמים.</p>
        <ul class="tip-list">
            <li class="tip-item success">
                <div class="tip-icon">🎓</div>
                <div class="tip-content">
                    <div class="tip-title">סטודנט או חייל משוחרר? תדרשו, לא תבקשו</div>
                    <div class="tip-text">יש לכם זכות לחשבון ייעודי עם הטבות. אל תחכו שיציעו לכם, תגידו בפה מלא: "אני רוצה את המסלול לסטודנטים עם פטור מלא מעמלות."</div>
                </div>
            </li>
            <li class="tip-item success">
                <div class="tip-icon">📋</div>
                <div class="tip-content">
                    <div class="tip-title">פטור מעמלות עו"ש לפחות 3 שנים</div>
                    <div class="tip-text">וודאו שזה כתוב שחור על גבי לבן עם תאריך סיום ברור. "פטור ל-24 חודשים" חייב להיות בחוזה, לא רק בפה.</div>
                </div>
            </li>
            <li class="tip-item warning">
                <div class="tip-icon">⚠️</div>
                <div class="tip-content">
                    <div class="tip-title">מסלול מורחב? לא בשבילכם</div>
                    <div class="tip-text">אם אתם עושים הכל באפליקציה כמו כל צעיר נורמלי, המסלול הבסיסי מספיק. אל תשלמו על 50 פעולות פקיד אם לא ראיתם פקיד מהבר מצווה.</div>
                </div>
            </li>
        </ul>
        <div class="lesson-bottom">הבנק לא ייתן לכם הטבות אם לא תדרשו אותן בקול רם.</div>
    </div>

    <!-- 02 -->
    <div class="lesson fade-up" style="transition-delay:.08s">
        <div class="lesson-num">02</div>
        <h2>ציידי העמלות: מה חייבים לחתוך מיד</h2>
        <p class="lesson-intro">עמלות הן הדרך של הבנק להרוויח על גבכם בשקט. רוב האנשים לא שמים לב אליהן, ולכן הבנק ממשיך לגבות. אתם לא רוב האנשים.</p>
        <ul class="tip-list">
            <li class="tip-item warning">
                <div class="tip-icon">💸</div>
                <div class="tip-content">
                    <div class="tip-title">עמלת עו"ש בשנת 2026? לא אצלנו</div>
                    <div class="tip-text">לשלם על "עמלת שורה" זה פשע. בקשו פטור מלא. אם הבנק לא נותן, יש בנקים דיגיטליים שמחכים לכם עם אפס עמלות.</div>
                </div>
            </li>
            <li class="tip-item warning">
                <div class="tip-icon">💳</div>
                <div class="tip-content">
                    <div class="tip-title">דמי כרטיס אשראי חודשיים</div>
                    <div class="tip-text">יש מספיק כרטיסים חוץ-בנקאיים או מסלולי צעירים שנותנים פטור מלא. אל תשלמו דמי כרטיס אם אתם מתחת לגיל 30.</div>
                </div>
            </li>
            <li class="tip-item success">
                <div class="tip-icon">✈️</div>
                <div class="tip-content">
                    <div class="tip-title">טסים לחו"ל? תשאלו מראש</div>
                    <div class="tip-text">לפני כל טיסה שאלו: "מה ההנחה שלי על עמלת חליפין?" הבנק ינסה לגזור קופון, אבל מי ששואל מראש משלם פחות.</div>
                </div>
            </li>
        </ul>
        <div class="lesson-bottom">כל עמלה שאתם משלמים היא כסף שיכלו לעבוד בשבילכם בשוק ההון.</div>
    </div>

    <!-- 03 -->
    <div class="lesson fade-up" style="transition-delay:.16s">
        <div class="lesson-num">03</div>
        <h2>על מה חותמים ועל מה ממש לא</h2>
        <p class="lesson-intro">הבנקאית מחייכת, אבל הדף שהיא מגישה לכם הוא חוזה לכל דבר. לפני כל חתימה עצרו שנייה ושאלו את עצמכם: הבנתי מה כתוב פה?</p>
        <ul class="tip-list">
            <li class="tip-item success">
                <div class="tip-icon">✅</div>
                <div class="tip-content">
                    <div class="tip-title">כן לחתום: רק אחרי שראיתם תאריך סיום</div>
                    <div class="tip-text">כל הטבה חייבת לכלול תאריך סיום ברור בחוזה. "פטור ל-24 חודשים" כתוב שחור על גבי לבן, לא רק בפה של הבנקאית.</div>
                </div>
            </li>
            <li class="tip-item warning">
                <div class="tip-icon">🚫</div>
                <div class="tip-content">
                    <div class="tip-title">לא לחתום: מסגרת אשראי מוגזמת</div>
                    <div class="tip-text">אוברדרפט גדול נראה כמו גב כלכלי, אבל זו הלוואה בריבית רצחנית שמחכה שתפלו. תבקשו מסגרת מינימלית בלבד.</div>
                </div>
            </li>
            <li class="tip-item warning">
                <div class="tip-icon">🚫</div>
                <div class="tip-content">
                    <div class="tip-title">לא לחתום: ביטוחים ומועדונים שלא ביקשתם</div>
                    <div class="tip-text">ביטוחי אשראי יקרים ומועדוני לקוחות בתשלום הם מכירה אגרסיבית. אל תחתמו על שום דבר שלא הגעתם אליו מרצון.</div>
                </div>
            </li>
            <li class="tip-item success">
                <div class="tip-icon">💡</div>
                <div class="tip-content">
                    <div class="tip-title">לא הבנתם סעיף? אל תחתמו</div>
                    <div class="tip-text">זכותכם לקחת את החוזה הביתה, לקרוא אותו, ולחזור. כל בנק שלוחץ עליכם לחתום ברגע הזה מנסה להחביא משהו.</div>
                </div>
            </li>
        </ul>
        <div class="lesson-bottom">חתמתם בלי לקרוא? זה לא טעות של הבנק, זו טעות שלכם.</div>
    </div>

    <!-- 04 -->
    <div class="lesson fade-up" style="transition-delay:.24s">
        <div class="lesson-num">04</div>
        <h2>בקרת נזקים: הבדיקה שאחרי הקפיצה</h2>
        <p class="lesson-intro">פתחתם חשבון? מזל טוב. עכשיו מתחיל הניהול האמיתי. חשבון בנק לא מנהל את עצמו, ובנקים סומכים על זה שלא תבדקו.</p>
        <ul class="tip-list">
            <li class="tip-item success">
                <div class="tip-icon">📊</div>
                <div class="tip-content">
                    <div class="tip-title">הצ'ק-אפ הרבעוני</div>
                    <div class="tip-text">פעם ב-3 חודשים נכנסים לאפליקציה ובודקים "דוח עמלות". ראיתם חיוב מוזר? טלפון קצר לבנק: "שלום, למה חויבתי על עמלת שורה?"</div>
                </div>
            </li>
            <li class="tip-item success">
                <div class="tip-icon">🏃</div>
                <div class="tip-content">
                    <div class="tip-title">הבנק לא זורם? תעברו</div>
                    <div class="tip-text">מעבר בנק היום לוקח קליק אחד באפליקציה. הבנקים הדיגיטליים מחכים לכם עם אפס עמלות ו-100% שירות מהנייד. אל תהיו נשואים לבנק שלא מפנק אתכם.</div>
                </div>
            </li>
            <li class="tip-item success">
                <div class="tip-icon">💬</div>
                <div class="tip-content">
                    <div class="tip-title">המשפט שחוסך לכם כסף</div>
                    <div class="tip-text">"אני שוקל לעבור בנק, מה אתם יכולים להציע לי?" הבנק פחד מלאבד לקוחות יותר ממה שהוא מראה. תשתמשו בזה.</div>
                </div>
            </li>
        </ul>
        <div class="lesson-bottom">הבנק שלכם עובד בשבילכם, לא ההפך. תזכרו את זה בכל שיחה.</div>
    </div>

</div>

<div class="divider"></div>

<!-- DICTIONARY -->
<div class="dict-wrap">
    <div class="dict-head fade-up">
        <span class="dict-tag">📚 מילון</span>
        <h2>לדבר בנקאית במהירות</h2>
    </div>
    <div class="dict-grid">
        <div class="dict-card fade-up">
            <h3>ריבית פריים 📊</h3>
            <p>הבסיס לכל ריבית בישראל. תמיד תשאפו לקבל P מינוס משהו, לא P פלוס.</p>
        </div>
        <div class="dict-card fade-up" style="transition-delay:.06s">
            <h3>מסלול בסיסי 📱</h3>
            <p>חבילה זולה של פעולות שסוגרת את הפינה לרוב הצעירים. כמעט תמיד מספיקה.</p>
        </div>
        <div class="dict-card fade-up" style="transition-delay:.12s">
            <h3>עמלת פקיד 🏧</h3>
            <p>קנס על זה שדיברתם עם בן אדם. תעשו הכל בדיגיטל ותחסכו את זה.</p>
        </div>
        <div class="dict-card fade-up" style="transition-delay:.18s">
            <h3>משכורת זוכה 💰</h3>
            <p>התנאי של הבנק להטבות. הם רוצים לראות כסף נכנס כל חודש לחשבון.</p>
        </div>
        <div class="dict-card fade-up" style="transition-delay:.24s">
            <h3>ריבית דביטורית 📉</h3>
            <p>הריבית שהבנק גובה כשאתם במינוס. לרוב גבוהה מאוד, להימנע בכל מחיר.</p>
        </div>
        <div class="dict-card fade-up" style="transition-delay:.30s">
            <h3>אוברדרפט 🔴</h3>
            <p>מסגרת האשראי שלכם. נראה כמו גב כלכלי אבל הוא הלוואה יקרה שמחכה לכם.</p>
        </div>
    </div>
</div>

<!-- WARNING -->
<div class="warning-box fade-up">
    <div class="warning-inner">
        <strong>⚠️ הערה חשובה:</strong> המידע באתר הוא לימודי ובסיסי בלבד. ניהול חשבון בנק תלוי בהכנסות ובהוצאות האישיות שלכם. חובה להתייעץ עם איש מקצוע ולקרוא כל חוזה לעומק לפני החתימה. דברו בנתונים, תדרשו הטבות, ותנפחו את החשבון שלכם ולא את הרווח של הבנק.
    </div>
</div>

<footer>
    <p>© 2025 מנפחים ת'כיס | <a href="index.html">בית</a> | <a href="premium.html">פרימיום</a> | <a href="https://www.instagram.com/minapchim_tkis">Instagram</a></p>
</footer>

<script>
    document.addEventListener('click', e => { if(!e.target.closest('nav')&&!e.target.closest('#mob')) document.getElementById('mob').classList.remove('open'); });
    const obs = new IntersectionObserver(entries => entries.forEach(e => { if(e.isIntersecting){e.target.classList.add('visible');obs.unobserve(e.target);} }), {threshold:0.08});
    document.querySelectorAll('.fade-up').forEach(el => obs.observe(el));
</script>
</body>
</html>
HTMLEOF

git add bankayt.html
git commit -m "feat: rewrite bankayt.html with youth-friendly content, no dashes"
git push origin master

echo ""
echo "✅ bankayt.html עלה! בדוק: https://shohamabo-lab.github.io/bankayt.html"
