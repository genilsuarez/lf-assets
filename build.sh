#!/usr/bin/env bash
# LfAssets — Commit & push static audio assets
set -euo pipefail

cd "$(dirname "$0")"

BRANCH="main"

echo "📦 LfAssets"

if [ -n "$(git status --porcelain)" ]; then
  echo "🔄 Committing changes..."
  git add -A
  SUMMARY=$(git diff --cached --stat | tail -1)
  git commit -m "chore: update — $SUMMARY"
  echo "🔄 Pushing to remote..."
  git push
else
  echo "✅ Working directory clean"
  git fetch --quiet origin "$BRANCH"
  LOCAL=$(git rev-parse HEAD)
  REMOTE=$(git rev-parse "origin/$BRANCH" 2>/dev/null || echo "")
  if [ -n "$REMOTE" ] && [ "$LOCAL" != "$REMOTE" ]; then
    echo "🔄 Pushing unpushed commits..."
    git push
  fi
fi

echo "✅ LfAssets — OK"
