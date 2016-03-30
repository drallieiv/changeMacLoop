#!/system/bin/sh
while true; do
    su -c svc wifi enable
    sleep 1
    netcfg | grep wlan0 && break
    sleep 10
done
su -c svc wifi disable
sleep 2
/system/bin/hostapd -e /data/misc/wifi/entropy.bin /data/misc/wifi/hostapd.conf &