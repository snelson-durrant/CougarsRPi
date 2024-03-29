#!/bin/bash

echo ""
echo -e "  /\e[38;5;6m\$\$\$\$\$\$\e[0m            /\e[38;5;6m\$\$\e[0m   /\e[38;5;6m\$\$\e[0m  /\e[38;5;6m\$\$\$\$\$\$\e[0m   /\e[38;5;6m\$\$\$\$\$\$\e[0m  /\e[38;5;6m\$\$\$\$\$\$\$\e[0m   /\e[38;5;6m\$\$\$\$\$\$\e[0m"
echo -e " /\e[38;5;6m\$\$\e[0m__  \e[38;5;6m\$\$\e[0m          | \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m /\e[38;5;6m\$\$\e[0m__  \e[38;5;6m\$\$\e[0m /\e[38;5;6m\$\$\e[0m__  \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m__  \e[38;5;6m\$\$\e[0m /\e[38;5;6m\$\$\e[0m__  \e[38;5;6m\$\$\e[0m"
echo -e "| \e[38;5;6m\$\$\e[0m  \__/  /\e[38;5;6m\$\$\$\$\$\$\e[0m | \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  \__/| \e[38;5;6m\$\$\e[0m  \ \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  \ \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  \__/"
echo -e "| \e[38;5;6m\$\$\e[0m       /\e[38;5;6m\$\$\e[0m__  \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m /\e[38;5;6m\$\$\$\$\e[0m| \e[38;5;6m\$\$\$\$\$\$\$\$\e[0m| \e[38;5;6m\$\$\$\$\$\$\$\e[0m/|  \e[38;5;6m\$\$\$\$\$\$\e[0m"
echo -e "| \e[38;5;6m\$\$\e[0m      | \e[38;5;6m\$\$\e[0m  \ \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m|_  \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m__  \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m__  \e[38;5;6m\$\$\e[0m \____  \e[38;5;6m\$\$\e[0m"
echo -e "| \e[38;5;6m\$\$\e[0m    \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  \ \e[38;5;6m\$\$\e[0m /\e[38;5;6m\$\$\e[0m  \ \e[38;5;6m\$\$\e[0m"
echo -e "|  \e[38;5;6m\$\$\$\$\$\$\e[0m/|  \e[38;5;6m\$\$\$\$\$\$\e[0m/|  \e[38;5;6m\$\$\$\$\$\$\e[0m/|  \e[38;5;6m\$\$\$\$\$\$\e[0m/| \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m| \e[38;5;6m\$\$\e[0m  | \e[38;5;6m\$\$\e[0m|  \e[38;5;6m\$\$\$\$\$\$\e[0m/"
echo -e " \______/  \______/  \______/  \______/ |__/  |__/|__/  |__/ \______/"
echo ""
echo -e "BYU FROST LAB - CONFIGURABLE UNDERWATER GROUP OF AUTONOMOUS ROBOTIC SYSTEMS"
echo ""

cd ~/teensy_ws
bash restart.sh

cd ~/microros_ws
source install/setup.bash
ros2 run micro_ros_agent micro_ros_agent multiserial --devs "/dev/ttyACM0 /dev/ttyACM1" -b 6000000 &
sleep 5

cd ~/ros2_ws
source install/setup.bash
cd ~/ros2_ws/bag
ros2 launch cougars cougars_launch.py

killall micro_ros_agent
wait