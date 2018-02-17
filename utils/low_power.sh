#!/bin/bash
# cat /sys/kernel/debug/dri/64/radeon_pm_info
set -x
sudo bash -c 'echo low > /sys/class/drm/card0/device/power_dpm_force_performance_level'
