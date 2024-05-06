#!/usr/bin/env bash
# script to set up my webservers for deployment of web_static

sudo apt-get update
sudo apt-get install -y nginx
# Creating folders
sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
# Changing ownership to ubuntu
sudo chown -R ubuntu /data/
sudo chgrp -R ubuntu /data/
# Creating html file with content to test configuration
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
# Creating symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
# Updating Nginx configuration
sudo sed -i '/listen 80 default_server/a location /hbnb_static/ { alias /data/web_static/current/;}' /etc/nginx/sites-available/default
sudo service nginx restart
