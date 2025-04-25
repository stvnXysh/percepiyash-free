#!/bin/bash

echo "=== 🚀 Starting PercepiYash Deployment ==="

# Step 1: Setup Git repo
if [ -d .git ]; then
    echo "✅ Git already initialized. Updating remote..."
else
    echo "🔧 Initializing new Git repo..."
    git init
fi

# Step 2: Setup origin with PAT
GITHUB_USER="stvnXysh"
REPO_NAME="percepiyash-free"
TOKEN="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"
REPO_URL="https://${GITHUB_USER}:${TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git"

git remote remove origin 2>/dev/null
git remote add origin $REPO_URL

# Step 3: Commit changes
git add .
git commit -m "🔄 Auto deploy commit" || echo "Nothing to commit."

# Step 4: Set branch and push
git branch -M main
git push -u origin main

# Step 5: Post-deploy instructions
echo ""
echo "✅ GitHub Push Complete!"

echo ""
echo "🔗 Render Hosting + Freenom Domain Setup:"
echo "1. ➕ Go to https://dashboard.render.com and click 'New Web Service' to deploy."
echo "2. 🌐 Register a free domain (e.g. .ml, .ga, .cf) at: https://freenom.com"
echo "3. ✉️ Set up email forwarding at: https://improvmx.com"

echo ""
echo "📌 DNS Settings:"
echo " - A Record: (Use IP from Render Dashboard)"
echo " - MX Records:"
echo "     mx1.improvmx.com (Priority 10)"
echo "     mx2.improvmx.com (Priority 20)"

echo ""
echo "🎉 Deployment script complete. Check your repo at: https://github.com/${GITHUB_USER}/${REPO_NAME}"

