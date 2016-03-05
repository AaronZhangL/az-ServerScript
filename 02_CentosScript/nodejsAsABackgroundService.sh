#-------------------------------------------------------------------------------
# This script will not work in docker container.
#-------------------------------------------------------------------------------

# Nearly every Linux distro comes with systemd, which means forever, monit, etc are no longer necessary - your OS already handles these tasks.
# Make a myapp.service file (replacing 'myapp' with your app's name, obviously):

[Unit]
Description=My app

[Service]
ExecStart=/var/www/myapp/app.js
Restart=always
User=nobody
Group=nobody
Environment=PATH=/usr/bin:/usr/local/bin
Environment=NODE_ENV=production
WorkingDirectory=/var/www/myapp

[Install]
WantedBy=multi-user.target

#- Copy your service file into the /etc/systemd/system.
sudo cp ./myapp /etc/systemd/system
#- Start it with systemctl start myapp.
systemctl start myapp.

#- Enable it to run on boot with systemctl enable myapp.
systemctl enable myapp.

See logs with journalctl -u myapp