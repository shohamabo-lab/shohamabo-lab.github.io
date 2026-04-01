import sys
sys.stdout.reconfigure(encoding='utf-8')

def calculate_fomo(item_name, cost, years=20):
    # חישוב ריבית דריבית של 8%
    future_value = cost * ((1.08) ** years)
    return {
        "item": item_name,
        "cost_today": cost,
        f"future_value_{years}y": round(future_value),
        "lost_wealth": round(future_value - cost)
    }

# אסטרטגיית כסף (Monetization):
# 1. שיווק שותפים לספרים. 
# 2. קורס "הצעד הראשון" ב-99 ש"ח.
# 3. קהילת VIP סגורה.

# דגשי ויראליות:
# טיקטוק: השוואה בין אייפון למניות.
# יוטיוב: סרטוני עומק על פסיכולוגיה של כסף.


def calculate_wealth_gap(item_name, cost, years=30):
    # חישוב ריבית דריבית מורכב (8% תשואה בניכוי 3% אינפלציה = 5% ריאלי)
    real_yield = 0.05
    future_value = cost * ((1 + real_yield) ** years)
    
    # חישוב "מחיר ההזדמנות"
    opportunity_cost = future_value - cost
    return {
        "item": item_name,
        "cost_today": cost,
        "future_value_30y": round(future_value),
        "lost_wealth": round(opportunity_cost)
    }

# אסטרטגיית מונטיזציה (איך שוהם עושה כסף):
monetization_plans = {
    "tier_1": "מדריך דיגיטלי: 'הצעד הראשון ל-S&P 500' ב-99 ש''ח",
    "tier_2": "קהילת דיסקורד סגורה: ליווי צמוד וניתוחי עומק ב-49 ש''ח לחודש",
    "tier_3": "הרצאות במכינות ויחידות צבאיות: 'מנפחים ת'כיס' על מדים"
}

# עקרונות לתוכן ויראלי:
viral_triggers = ["FOMO", "כעס על המערכת", "גאווה ישראלית", "הוכחה מתמטית"]


if __name__ == "__main__":
    print(calculate_wealth_gap("אייפון 15 פרו", 5000))
    print(calculate_fomo("אייפון 15 פרו", 5000))