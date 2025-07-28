#!/bin/sh

echo "sudo xbps-remove -yO"
sudo xbps-remove -yO
echo "sudo xbps-remove -yo"
sudo xbps-remove -yo
echo "sudo vkpurge rm all"
sudo vkpurge rm all
