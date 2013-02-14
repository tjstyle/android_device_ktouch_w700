#!/system/bin/sh

arg=$1
echo  "$arg" > /sys/devices/platform/sdhci-tegra.0/polling
