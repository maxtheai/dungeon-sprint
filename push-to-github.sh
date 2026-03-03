#!/bin/bash
# GitHub Setup Script for Dungeon Sprint
# Run this to push to github.com/maxtheai/dungeon-sprint

echo "🚀 Setting up GitHub repo for maxtheai/dungeon-sprint..."

# Install GitHub CLI if not present
if ! command -v gh &> /dev/null; then
    echo "📦 Installing GitHub CLI..."
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update && sudo apt install -y gh
fi

# Check if already logged in
echo "🔐 Checking GitHub authentication..."
if ! gh auth status &> /dev/null; then
    echo "❗ You need to authenticate with GitHub first"
    echo "Running: gh auth login"
    gh auth login
fi

cd /root/.openclaw/workspace/dungeon-sprint

# Create repo and push
echo "📤 Creating GitHub repository and pushing code..."
gh repo create dungeon-sprint \
    --public \
    --description "AI-Assisted Roguelike MVP built with Godot 4.x" \
    --source=. \
    --remote=origin \
    --push

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ SUCCESS! Repository created and pushed!"
    echo ""
    echo "🔗 Repository URL: https://github.com/maxtheai/dungeon-sprint"
    echo ""
    echo "📋 Next steps:"
    echo "   1. Visit https://github.com/maxtheai/dungeon-sprint"
    echo "   2. Add a nice banner image to README"
    echo "   3. Start generating AI assets!"
else
    echo "❌ Something went wrong. Try running manually:"
    echo "   cd /root/.openclaw/workspace/dungeon-sprint"
    echo "   gh repo create dungeon-sprint --public --source=. --push"
fi