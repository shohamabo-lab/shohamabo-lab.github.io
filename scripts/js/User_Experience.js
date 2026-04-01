// ============================================================
// מנפחים ת'כיס — Velo Master Code
// ============================================================

// --- הצהרה משפטית ---
// שוהם אבו ו'מנפחים ת'כיס' אינם בעלי רישיון ייעוץ השקעות.
// התוכן נועד למטרות חינוכיות בלבד ואינו מהווה ייעוץ פיננסי.
// ביצוע השקעות טומן בחובו סיכון להפסד כספי.

import wixLocation from 'wix-location';

// --- cache formatter (נוצר פעם אחת בלבד לביצועים מהירים) ---
const ILS = new Intl.NumberFormat('he-IL', {
    style: 'currency',
    currency: 'ILS',
    maximumFractionDigits: 0
});

// ============================================================
// PAGE INIT — רץ בכל דף
// ============================================================
$w.onReady(function () {
    _initCTA();
});

// --- CTA Button (מופיע בכל דף, מוביל לחנות) ---
function _initCTA() {
    const cta = $w('#ctaShopButton');
    if (!cta) return;
    cta.label = '🛒 לחנות — קח את הצעד הראשון';
    cta.show();
    cta.onClick(() => wixLocation.to('/shop'));
}

// ============================================================
// FORMATTERS
// ============================================================

// מחזירה מספר מפורמט כשקלים: ₪1,250,000
export function formatILSCurrency(number) {
    return ILS.format(number);
}

// ============================================================
// CALCULATORS
// ============================================================

// חישוב ריבית דריבית — גמיש לפי שיעור ושנים
export function calculateFutureLoss(cost, rate = 0.08, years = 20) {
    return cost * Math.pow(1 + rate, years);
}

// מחשבון מלא — מחזיר dict עם כל הנתונים לתצוגה
export function calculateWealthGap(itemName, cost, rate = 0.08, years = 20) {
    const futureValue = calculateFutureLoss(cost, rate, years);
    return {
        item: itemName,
        costToday: cost,
        futureValue: Math.round(futureValue),
        lostWealth: Math.round(futureValue - cost),
        years,
        ratePercent: Math.round(rate * 100)
    };
}

// ============================================================
// EVENT HANDLERS (לחיבור לאלמנטים ב-Wix Editor)
// ============================================================

// חיבור: Input #calcAmount + Button #calcButton + Text #calcResult
export function onCalculateClick(event) {
    const input = $w('#calcAmount');
    const resultEl = $w('#calcResult');

    const raw = Number(input.value);

    // ולידציה
    if (!input.value || isNaN(raw) || raw <= 0) {
        resultEl.text = 'אנא הזן סכום חיובי';
        return;
    }
    if (raw > 10_000_000) {
        resultEl.text = 'הסכום גדול מדי — נסה שוב';
        return;
    }

    const result = calculateWealthGap('הפריט', raw);
    resultEl.text =
        `במקום לבזבז ${formatILSCurrency(result.costToday)} היום, ` +
        `בעוד ${result.years} שנה זה היה שווה ${formatILSCurrency(result.futureValue)} 🚀`;
}

// ניווט לחנות
export function goToShop() {
    wixLocation.to('/shop');
}
