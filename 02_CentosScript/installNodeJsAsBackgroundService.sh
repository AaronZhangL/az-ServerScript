#-------------------------------------------------------------------------------
# This script will not work in docker container.
#-------------------------------------------------------------------------------

cat >./gdtrobot <<'EOL'
[Unit]
Description=GDtRobot

[Service]
ExecStart=/gdt/az-GDtRobot/app.js
Restart=always
User=nobody
Group=nobody
Environment=PATH=/usr/bin:/usr/local/bin
Environment=NODE_ENV=production
WorkingDirectory=/gdt/az-GDtRobot

[Install]
WantedBy=multi-user.target
EOL

# Copy your service file into the /etc/systemd/system.
sudo cp ./gdtrobot /etc/systemd/system
# Start it with systemctl start myapp.
systemctl start gdtrobot.

# Enable it to run on boot with systemctl enable myapp.
systemctl enable gdtrobot.

# See logs with journalctl -u myapp
journalctl -u gdtrobot
