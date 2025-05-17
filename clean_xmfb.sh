#!/bin/bash

cd ~/xmfb-vttx || exit 1

echo "==> Creating archive folder..."
mkdir -p archive

echo "==> Archiving legacy folders..."
# Move legacy ADK folders
[ -d "adk-docs" ] && mv adk-docs archive/
[ -d "adk-python" ] && mv adk-python archive/

# Check for redundant flutter
if [ -d "flutter" ] && [ -d "xmfb_flutter_app" ]; then
  echo "NOTE: Both flutter/ and xmfb_flutter_app/ exist."
  echo "Keeping xmfb_flutter_app/, archiving flutter/"
  mv flutter archive/
fi

# Move potential duplicate asset folders
[ -d "web" ] && mv web archive/
[ -d "dist" ] && mv dist archive/

echo "==> Cleanup complete. All archived folders are now in: archive/"
echo "✅ Your working google_adk/ is untouched."

