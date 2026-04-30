#!/bin/bash
# EC2 Setup Script for TaskApp Backend
# Run this after SSH-ing into your EC2 instance

set -e

echo "=== Updating system ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing Python and dependencies ==="
sudo apt install -y python3 python3-pip python3-venv git nginx

echo "=== Cloning the repository ==="
cd /home/ubuntu
git clone https://github.com/charvenswhales/taskapp.git
cd taskapp/backend

echo "=== Creating virtual environment ==="
python3 -m venv venv
source venv/bin/activate

echo "=== Installing Python packages ==="
pip install -r requirements.txt
pip install gunicorn

echo "=== Creating .env file ==="
# IMPORTANT: Edit these values with your actual RDS endpoint and secrets
cat > .env << 'ENVFILE'
DATABASE_URL=postgresql://taskuser:taskpassword@YOUR-RDS-ENDPOINT:5432/taskmanager
SECRET_KEY=change-this-to-something-random
ALLOWED_ORIGINS=https://YOUR-CLOUDFRONT-ID.cloudfront.net
PORT=5000
ENVFILE

echo ""
echo "=== SETUP COMPLETE ==="
echo "NEXT STEPS:"
echo "1. Edit the .env file with your real RDS endpoint:"
echo "   nano /home/ubuntu/taskapp/backend/.env"
echo "2. Test the app:"
echo "   source venv/bin/activate"
echo "   python run.py"
echo "3. Once working, run with Gunicorn for production:"
echo "   gunicorn --bind 0.0.0.0:5000 'app:create_app()'"
