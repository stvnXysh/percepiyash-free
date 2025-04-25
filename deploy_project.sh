#!/bin/bash

# 🚀 Starting PercepiYash Deployment
echo "=== 🚀 Starting PercepiYash Deployment ==="

# Ensure git is initialized
if [ ! -d ".git" ]; then
  echo "Initializing git..."
  git init
fi

# Update remote repository URL
echo "✅ Git already initialized. Updating remote..."
git remote set-url origin https://github.com/stvnXysh/percepiyash-free.git

# Check for changes and commit
echo "Checking for changes..."
git add .
git commit -m "🔄 Auto deploy commit"

# Push changes to GitHub (using environment token)
echo "⬆️ Pushing to GitHub..."
GITHUB_TOKEN=$(cat .env | grep GITHUB_TOKEN | cut -d '=' -f2)

if [ -z "$GITHUB_TOKEN" ]; then
  echo "ERROR: GITHUB_TOKEN not found in .env"
  exit 1
fi

# Using the token for secure Git push
git push https://$GITHUB_TOKEN@github.com/stvnXysh/percepiyash-free.git

# Notify about Render Hosting + Freenom Domain Setup
echo "✅ GitHub Push Complete!"

echo "🔗 Render Hosting + Freenom Domain Setup:"
echo "1. ➕ Go to https://dashboard.render.com and click 'New Web Service' to deploy."
echo "2. 🌐 Register a free domain (e.g. .ml, .ga, .cf) at: https://freenom.com"
echo "3. ✉️ Set up email forwarding at: https://improvmx.com"

echo "📌 DNS Settings:"
echo " - A Record: (Use IP from Render Dashboard)"
echo " - MX Records:"
echo "     mx1.improvmx.com (Priority 10)"
echo "     mx2.improvmx.com (Priority 20)"

echo "🎉 Deployment script complete. Check your repo at: https://github.com/stvnXysh/percepiyash-free"

