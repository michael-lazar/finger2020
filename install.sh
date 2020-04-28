#!/usr/bin/env bash

echo "Installing /usr/bin/finger2020"
install finger2020 /usr/bin/finger2020

echo "Installing systemd files..."
install systemd/finger2020.socket /etc/systemd/system/finger2020.socket
install systemd/finger2020@.service /etc/systemd/system/finger2020@.service
install -b systemd/finger2020.env /etc/sysconfig/finger2020.env

echo "Enabling systemd service..."
systemctl daemon-reload
systemctl enable finger2020.socket
systemctl start finger2020.socket
systemctl status finger2020.socket

echo "Done!"
