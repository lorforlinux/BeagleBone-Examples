#!/bin/bash
servo1=/sys/bus/i2c/drivers/pca9685-pwm/*-0070/pwm/pwmchip*/pwm*:0/

function disable {
        echo 0 > $servo1/enable
}

function enable {
        echo 1 > $servo1/enable
}

echo "Servo attached to S1 must be running now..."

echo 10000000 > $servo1/period
echo 1000000 > $servo1/duty_cycle
enable

sleep 1
echo 2000000 > $servo1/duty_cycle
sleep 1
echo 1000000 > $servo1/duty_cycle
sleep 1
echo 2000000 > $servo1/duty_cycle
sleep 1
echo 1000000 > $servo1/duty_cycle
disable
