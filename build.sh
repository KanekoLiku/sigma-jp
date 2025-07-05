#!/bin/bash
set -eu

# For use in the GitHub workflow process.
# Run in the root of the repository to produce a dist/ directory.

# Create directory structure
mkdir -p dist

# Copy fonts and images
cp -a origin/fonts origin/images dist

# Copy CSS
mkdir -p dist/css
cp origin/sigma.css sigma.css

# Localize CSS
sed -i 's|cdn\.scpwiki\.com/theme/en|scp-jp.github.io|g' sigma.css
cat localization.css >> sigma.css
cp sigma.css dist/css

# Minify CSS
npm run minify
[[ -f dist/css/sigma.min.css ]]
