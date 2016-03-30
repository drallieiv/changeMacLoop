am start -n com.android.settings/.TetherSettings
input tap 600 200
echo -ne '\x46' | dd of=/data/nvram/APCFG/APRDEB/WIFI bs=1 seek=9 conv=notrunc
input tap 600 200
