#!/bin/bash

REPO_URL="https://github.com/<felhasználónév>/<repo-név>.git"
SERVICE_NAME="status_lcd"

echo "🔄 Frissítés indítása..."

# Systemd szolgáltatás leállítása
echo "🛑 Szolgáltatás leállítása..."
sudo systemctl stop ${SERVICE_NAME}

# Legújabb verzió letöltése
echo "📥 Legújabb verzió letöltése a GitHub-ról..."
cd /home/pi
if [ -d "<repo-név>" ]; then
    cd <repo-név>
    git pull
else
    git clone ${REPO_URL}
    cd <repo-név>
fi

# Szolgáltatás újraindítása
echo "🚀 Új verzió indítása..."
sudo systemctl start ${SERVICE_NAME}

echo "✅ Frissítés befejezve!"
