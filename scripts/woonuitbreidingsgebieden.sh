#!/bin/bash
# Make sure shiny starts at boot
mv /home/ubuntu/woonuitbreidingsgebieden/scripts/woonuitbreidingsgebieden.service /etc/systemd/system
chmod 777 /etc/systemd/system/woonuitbreidingsgebieden.service
chown root:root /etc/systemd/system/woonuitbreidingsgebieden.service
systemctl enable woonuitbreidingsgebieden.service
# Make a tar.gz from the R-package from the code
cd /home/ubuntu/woonuitbreidingsgebieden
if [ -f woonuitbreidingsgebieden.tar.gz ]; then
    rm woonuitbreidingsgebieden.tar.gz
fi
tar -zcvf woonuitbreidingsgebieden.tar.gz woonuitbreidingsgebieden
# Build the docker image
sudo docker build -t wug1 .