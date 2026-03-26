import os

# --- MOCK SECRETS FOR LEGIT SECURITY TESTING ---
# 1. A fake Stripe API Key (Commonly flagged by regex)
STRIPE_API_KEY = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"

# 2. A fake Slack Webhook URL
SLACK_WEBHOOK = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# 3. A hardcoded Database URI
DATABASE_URL = "postgres://admin:p@ssw0rd123!@localhost:5432/mydb"
# -----------------------------------------------

def main():
    print("--- Security Posture Test ---")
    print("Container is running for Legit Security testing!")
    
    # We simulate using the key so the compiler doesn't ignore it
    if STRIPE_API_KEY.startswith("sk_"):
        print("Mock Stripe Key loaded (Simulation only)")

if __name__ == "__main__":
    main()
