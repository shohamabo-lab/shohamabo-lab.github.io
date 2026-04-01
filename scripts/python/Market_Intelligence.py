import sys
sys.stdout.reconfigure(encoding='utf-8')
import datetime

# סוכן המודיעין - מה קורה בשוק ומה המשימה
def get_market_focus():
    topics = ["S&P 500", "Inflation Israel", "Nasdaq", "Passive Investing"]
    return topics

def get_market_analysis():
    # נתונים אמיתיים שקלוד צריך להכיר לניתוח
    market_data = {
        "SP500_avg_return": 0.10, # 10% שנתי ממוצע היסטורי
        "Israel_Inflation_2024": 0.03, # אינפלציה משוערת
        "Management_Fees_High": 0.02, # דמי ניהול גבוהים שצריך להילחם בהם
        "Management_Fees_Low": 0.003 # דמי ניהול יעד לקהילה
    }
    return market_data

def get_weekly_mission():
    missions = [
        {"task": "מיפוי דמי ניהול", "description": "להתקשר לחברת הביטוח ולהוריד את דמי הניהול ב-50%."},
        {"task": "נכס מול התחייבות", "description": "למצוא הוצאה חודשית קבועה ולהפוך אותה להוראת קבע לתיק השקעות."},
        {"task": "השכלה בנכס", "description": "לסיים פרק 1 ב'אבא עשיר אבא עני' ולכתוב 3 תובנות."},
        {"task": "צייד אינפלציה", "description": "למצוא מוצר שהתייקר ולחשב כמה הוא עלה לפני שנתיים."}
    ]
    week_num = datetime.datetime.now().isocalendar()[1]
    return missions[week_num % len(missions)]

# רשימת מיתוסים ישראליים לניפוץ בתוכן:
israeli_myths = [
    "הבורסה זה רק לעשירים",
    "חייבים לקנות דירה כדי להצליח",
    "הבנק הוא חבר שלך ודואג לכסף שלך",
    "להשקיע זה מסוכן מדי - עדיף לשמור בעו'ש"
]

if __name__ == "__main__":
    print(f"נושאי מיקוד: {get_market_focus()}")
    print(f"משימה שבועית: {get_weekly_mission()}")
    print(f"ניתוח שוק: {get_market_analysis()}")
