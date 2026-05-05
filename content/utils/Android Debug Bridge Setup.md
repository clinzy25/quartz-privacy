```sh
sudo apt update
sudo apt install adb

sudo usermod -aG plugdev $USER
# Download the udev rules
sudo wget -O /etc/udev/rules.d/51-android.rules https://raw.githubusercontent.com/M0Rf30/android-udev-rules/main/51-android.rules

# Set correct permissions
sudo chmod a+r /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
sudo udevadm trigger

adb kill-server
adb start-server
```