#!/bin/bash

echo "=== 🚀 Starting PercepiYash Deployment ==="

# --- SETUP ---
REPO="stvnXysh/percepiyash-free"
BRANCH="main"

# Check for GitHub Token
if [ -z "$GITHUB_TOKEN" ]; then
  echo "❌ GITHUB_TOKEN is not set. Please export it before running."
  echo "   Example: export GITHUB_TOKEN=your_token_here"
  exit 1
fi

# Setup Git config
git config --global user.name "Steven Yash"
git config --global user.email "stevenodige@gmail.com"

# Initialize git repo if needed
if [ ! -d .git ]; then
  echo "🆕 Initializing Git repository..."
  git init
  git remote add origin https://$GITHUB_TOKEN@github.com/$REPO.git
else
  echo "✅ Git already initialized. Updating remote..."
  git remote set-url origin https://$GITHUB_TOKEN@github.com/$REPO.git
fi

# Add and commit changes
git add .
git commit -m "🔄 Auto deploy commit"

# Push to GitHub
echo "⬆️  Pushing to GitHub..."
git push origin $BRANCH

echo "✅ GitHub Push Complete!"

# --- OPTIONAL: Post-deployment instructions ---
cat <<EOF

🔗 Render Hosting + Freenom Domain Setup:
1. ➕ Go to https://dashboard.render.com and click 'New Web Service' to deploy.
2. 🌐 Register a free domain (e.g. .ml, .ga, .cf) at: https://freenom.com
3. ✉️ Set up email forwarding at: https://improvmx.com

📌 DNS Settings:
 - A Record: (Use IP from Render Dashboard)
 - MX Records:
     mx1.improvmx.com (Priority 10)
     mx2.improvmx.com (Priority 20)

🎉 Deployment script complete. Check your repo at: https://github.com/$REPO

EOF

