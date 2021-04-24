#!/bin/bash
sudo umount /dev/sda2
sudo mount -t auto /dev/sda2 /media/HD1
sudo /etc/init.d/smbd restart

