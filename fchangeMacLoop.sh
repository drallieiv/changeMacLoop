#!/system/bin/sh

# firstPrime : x40 = 64
# lastPrime : x4F = 79
# first Extended : 00 - 9F (00 - 159)

min=0
max=159

#15 minutes = 900
wait=180

echo "Start Rotating Mac"
index=`cat macIndex`

if [[ ${index} -lt ${min} || ${index} -gt ${max} ]] 
then
  echo "reset mac to " $min
  index=$min
fi

while true
do

  hexindex=`printf "%X\n" $index`

  echo "Set MAC to " $index " / " $hexindex
  am start -n com.android.settings/.TetherSettings
  input tap 600 200
  sleep 2
  echo -ne '\x'$hexindex | dd of=/data/nvram/APCFG/APRDEB/WIFI bs=1 seek=9 conv=notrunc
  input tap 600 200

  index=$(($index+1))

  if [ ${index} -gt ${max} ] 
  then
    echo "reset mac to " $min
    index=$min
  fi

  echo $index > macIndex
  echo "wait " $wait " seconds"
  sleep $wait
 done
